package pl.heroesclash.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pl.heroesclash.entity.Enemy;
import pl.heroesclash.entity.Hero;

public interface EnemyRepository extends JpaRepository<Enemy, Integer> {
	
//	public List<Enemy> findByHero(Hero hero); findByRatingGreaterThan
	public List<Enemy> findByHeroOrderByIdDesc(Hero hero);
	
//	@Query("Select e from Enemy e where e.hero = :hero, e.hp > 0 orderby e.hp desc") //%-wszystkie dowolne znaki i w dowolnej ilości w SQL
//	List<Enemy> findByHeroWhoWin(@Param("hero") Hero hero);	
	
}
