package pl.heroesclash.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.heroesclash.entity.Hero;

public interface HeroRepository extends JpaRepository<Hero, Integer>  {

}
