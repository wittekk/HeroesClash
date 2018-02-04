package pl.heroesclash.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pl.heroesclash.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

//	Boolean findUser(User user);
	// "from Account where name=?");
	
//	public List<User> findFirst10ByWin();
	public List<User> findFirst50ByOrderByWinDesc();

	@Query("Select u from User u where u.name = :name")
	User findUserByName(@Param("name") String name);
	
//	@Query("SELECT u FROM User u ORDER BY win DESC;") //SELECT * FROM Customers	ORDER BY Country DESC
//	User findUsersByWin();
	
//	@Query("select	u	from	User	u	where	u.emailAddress	=	?1")
//	User	findByEmailAddress(String	email);

}
