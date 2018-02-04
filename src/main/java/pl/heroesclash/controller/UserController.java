package pl.heroesclash.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.heroesclash.Model.RandomNumber;
import pl.heroesclash.entity.Enemy;
import pl.heroesclash.entity.Hero;
import pl.heroesclash.entity.User;
import pl.heroesclash.repository.EnemyRepository;
import pl.heroesclash.repository.HeroRepository;
import pl.heroesclash.repository.UserRepository;

@Controller
@RequestMapping("")
public class UserController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	HeroRepository heroRepository;

	@Autowired
	EnemyRepository enemyRepository;

	@Autowired
	RandomNumber ran;
	
	@GetMapping("/logout")
	public String userLogOut(HttpSession session) {
		session.invalidate();		
		return "redirect:/";
	}
	@GetMapping("/")
	public String userLogin(Model model) {
		User user = new User();		
		model.addAttribute("user", user); //przekazuje do widoku pusty obiekt usera
		
		List<User> usersAll = (List<User>) userRepository.findFirst50ByOrderByWinDesc(); //przekazuje do widoku listę wszystkich userów		
		model.addAttribute("usersall", usersAll);
		
		return "user/homelogin";
	}
	@PostMapping("/")
	public String userLoginSubmit(@ModelAttribute @Valid User user, BindingResult result, Model model,
			HttpSession session) {

		if (result.hasErrors()) {
			return "user/homelogin";
		} else {
			if (user.getName().equals("")) {
				return "redirect:/";
			}else if (userRepository.findUserByName(user.getName()) == null) {// jeśli nie ma takiego użytkownika w bazie
				user.setCreated(LocalDateTime.now());
				user.setUpdated(LocalDateTime.now());
				user.setWin(0);
				user.setLose(0);
				this.userRepository.save(user); // zapisuje stworzonego usera do bazy
				User currentUser = userRepository.findUserByName(user.getName());
				model.addAttribute("user", currentUser);

				session.setAttribute("loginUserSes", currentUser); // dodaje nowoutworzonego usera z nowym id do sesji
				return "user/createhero";

			} else if (userRepository.findUserByName(user.getName()).getPassword().equals(user.getPassword())) {// sprawdzam poprawność hasła
				User currentUser = userRepository.findUserByName(user.getName()); // pobieram z bazy zalogowanegu usera
				currentUser.setUpdated(LocalDateTime.now());				
				userRepository.save(currentUser);				
				model.addAttribute("user", currentUser);				
				session.setAttribute("loginUserSes", currentUser);
				if(currentUser.getHero()==null) {
					return "user/createhero";
				}
				Hero hero = currentUser.getHero(); //do wyświetlenia listy enemys odrazu po zalogowaniu
				List<Enemy> curentUserEnemys = enemyRepository.findByHeroOrderByIdDesc(hero);
				model.addAttribute("curentuserenemys", curentUserEnemys);
				return "user/userlobby";
			}
			return "user/wrongpassword";
		}
	}
	@GetMapping("/lobby")
	public String userLobby(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUserSes");  
		Enemy enemy = (Enemy) session.getAttribute("curentEnemy");
		Hero hero = user.getHero();
		
		model.addAttribute("user", user);
		model.addAttribute("hero", hero);
		model.addAttribute("enemy", enemy);

		return "user/userlobby";
	}
	@GetMapping("/user/hero/{hero}")
	public String newCharacter(@PathVariable String hero, HttpSession session, Model model) {

		User user = (User) session.getAttribute("loginUserSes");

		Hero userHero = new Hero();
		userHero.setHp(100);
		userHero.setSkills(90);
		userHero.setAgility(90);
		userHero.setStrength(90);		

		if (hero.equals("soldier")) {
			userHero.setName("SOLDIER");
			userHero.setAgility(120);
			userHero.setStrength(150);
		} else if (hero.equals("wizard")) {
			userHero.setName("WIZARD");
			userHero.setStrength(120);
			userHero.setSkills(150);
		} else if (hero.equals("athlete")) {
			userHero.setName("ATHLETE");
			userHero.setSkills(120);
			userHero.setAgility(150);
		}
		if (user.getHero() == null) {
			heroRepository.save(userHero);
			user.setHero(userHero);
		}
		this.userRepository.save(user);

		session.setAttribute("loginUserSes", user);

		model.addAttribute("user", user);
		return "user/userlobby";
	}
	@GetMapping("user/lookbattle")
	public String lookForBattle(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loginUserSes");
		
		int enemyImage = ran.random10();
		session.setAttribute("enemyimage", enemyImage);

		Enemy enemy = new Enemy();
		Hero hero = user.getHero();

		enemy.setHp(100);
		enemy.setSkills(hero.getSkills() - 30 + ran.random50());
		enemy.setAgility(hero.getAgility() - 30 + ran.random50());
		enemy.setStrength(hero.getStrength() - 30 + ran.random50());
		enemy.setHero(user.getHero());
		enemyRepository.save(enemy);
		session.setAttribute("curentEnemy", enemy);

		return "redirect:/user/battle";
	}
	@GetMapping("user/battle")
	public String userFight(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loginUserSes");
		Enemy enemy = (Enemy) session.getAttribute("curentEnemy");
		Hero hero = user.getHero();
		
		//pobieram z sesji int odpowiadający za image wroga zeby byl jeden podczas calej bitwy
		int enemyImage = (int) session.getAttribute("enemyimage"); 
		model.addAttribute("enemyfoto", enemyImage);
		

		model.addAttribute("user", user);
		model.addAttribute("hero", hero);
		model.addAttribute("enemy", enemy);
		

		return "user/battle";
	}
	@GetMapping("user/fight")
	public String userFightEnemy(HttpSession session, Model model) {
		User user = (User) session.getAttribute("loginUserSes");
		Enemy enemy = (Enemy) session.getAttribute("curentEnemy");
		// Hero hero = (Hero) session.getAttribute("hroFight");
		Hero hero = user.getHero();
		
		//pobieram z sesji int odpowiadający za image wroga zeby byl jeden podczas calej bitwy
		int enemyImage = (int) session.getAttribute("enemyimage"); 
		model.addAttribute("enemyfoto", enemyImage);

		int subSkills = hero.getSkills() - enemy.getSkills();
		int subAgility = hero.getAgility() - enemy.getAgility();
		int subStrength = hero.getStrength() - enemy.getStrength();

		int enemyDemage = 0;
		int heroDemage = 0;

		if (subSkills > 0) {
			enemyDemage += subSkills;
		} else if (subSkills < 0) {
			heroDemage -= subSkills;
		}
		if (subAgility > 0) {
			enemyDemage += subAgility;
		} else if (subSkills < 0) {
			heroDemage -= subAgility;
		}
		if (subStrength > 0) {
			enemyDemage += subStrength;
		} else if (subSkills < 0) {
			heroDemage -= subStrength;
		}
		enemy.setHp(enemy.getHp() - enemyDemage + ran.random50() - ran.random50());
		hero.setHp(hero.getHp() - heroDemage + ran.random50() - ran.random50());
		if(hero.getHp()>100) {
			hero.setHp(100);
		}else if(enemy.getHp()>100) {
			enemy.setHp(100);
		}
		this.enemyRepository.save(enemy);
		this.heroRepository.save(hero);

		session.setAttribute("curentEnemy", enemy);
		session.setAttribute("hroFight", hero);
		session.setAttribute("loginUserSes", user);

		model.addAttribute("user", user);
		model.addAttribute("hero", hero);
		model.addAttribute("enemy", enemy);
		if (hero.getHp() <= 0) {// jesli walka przegrana
			hero.setHp(0);
			user.setLose(user.getLose()+1);
			heroRepository.save(hero);
			userRepository.save(user);
			return "user/lose";
		}		
		if (enemy.getHp() <= 0) { // jesli walka wygrana
			user.setWin(user.getWin()+1);
			heroRepository.save(hero);
			userRepository.save(user);
			return "user/win";
		}		
		return "user/battle";
	}
	@GetMapping("/user/sleep")
	public String heroSleep(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUserSes");
		Hero hero = user.getHero();
		if (hero.getHp() < 91) {
			hero.setHp(hero.getHp() + 10);
			heroRepository.save(hero);
		}else if (hero.getHp() >= 91) {
			hero.setHp(100);
			heroRepository.save(hero);
		}
		model.addAttribute("user", user);
		model.addAttribute("hero", hero);
		return "user/userlobby";
	}
	
	@GetMapping("/user/forest")
	public String serchForest(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUserSes");
		Hero hero = user.getHero();
		
		int randNum10 = ran.random10();		
		String find = "";
		
		if (randNum10 > 8) {
			find = "Nic, szukaj dalej...";
		}else if (randNum10 == 1) {
			find = "Magiczne jagody! + 15 do zdrowia";
			hero.setHp(hero.getHp()+15);
		}else if (randNum10 == 2) {
			find = "Magiczne jagody! Nie, nie. To były zatrute jerzyny... - 10 do zdrowia";
			hero.setHp(hero.getHp()-10);
		}else if (randNum10 == 3) {
			find = "Nic, ale nalatałeś się jak głupi więc +15 do zwinności";
			hero.setAgility(hero.getAgility() + 15);
		}else if (randNum10 == 4) {
			find = "Nic, ale potknąłeś się i zwichnąłeś stopę -10 do zwinności";
			hero.setAgility(hero.getAgility() - 10);
		}else if (randNum10 == 5) {
			find = "Zniżkę na kurs CodersLab!!! +15 do umiejętności";
			hero.setSkills(hero.getSkills() + 15);
		}else if (randNum10 == 6) {
			find = "Nic, ale gdy tak szedłeś i szukałeś, zapomniałeś co było na kursie CodersLab. -10 do umiejętności";
			hero.setSkills(hero.getSkills() - 10);
		}else if (randNum10 == 7) {
			find = "Kłodę drewna! i uznałeś że ci się przyda i niosłeś ją ze sobą... +15 do siły";
			hero.setStrength(hero.getStrength() +15);
		}else if (randNum10 == 8) {
			find = "Nic, ale tak się nachodziłeś że opadasz z sił -10 do siły";
			hero.setStrength(hero.getStrength() -10);
		}
		this.heroRepository.save(hero);
		model.addAttribute("find", find);
		model.addAttribute("hero", hero);
		model.addAttribute("user", user);
		return "user/find";
	}
	@ModelAttribute("curentuserenemys") //to będzie dostępne we wszystkich akcjach w tym kontrolerze
	public List<Enemy> curentUserEnemys(HttpSession session){
		User user = (User) session.getAttribute("loginUserSes");
		try {
			Hero hero = user.getHero();
			return enemyRepository.findByHeroOrderByIdDesc(hero);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;				
	}
//	@ModelAttribute("random10") //to będzie dostępne we wszystkich akcjach w tym kontrolerze
//	public int randomValue10(HttpSession session){
//		int rand10 = ran.random10();
//		return rand10;				
//	}
}
