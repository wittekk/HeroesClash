package pl.heroesclash.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "enemy")
public class Enemy {
	
	private static final String RANDOM_NAME = "ENEMY NO.";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
//	@Column
//	@NotNull	
//	private String name;

	@Column
	@NotNull	
	private int hp;

	@Column
	@NotNull
	private int skills;
	
	@Column
	@NotNull
	private int agility;
	
	@Column
	@NotNull
	private int strength;
	
	@ManyToOne
	@JoinColumn(name="hero_id")
	private	Hero hero;
		
	public Enemy() {}	

	public Hero getHero() {
		return hero;
	}
	public void setHero(Hero hero) {
		this.hero = hero;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return RANDOM_NAME + this.id;
	}
//	public void setName(String name) {
//		this.name = name;
//	}
	public int getHp() {
		return hp;
	}
	public void setHp(int hp) {
		this.hp = hp;
	}
	public int getSkills() {
		return skills;
	}
	public void setSkills(int skills) {
		this.skills = skills;
	}
	public int getAgility() {
		return agility;
	}
	public void setAgility(int agility) {
		this.agility = agility;
	}
	public int getStrength() {
		return strength;
	}
	public void setStrength(int strength) {
		this.strength = strength;
	}
}
