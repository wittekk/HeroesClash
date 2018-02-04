package pl.heroesclash.Model;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class RandomNumber {
	
	public int random10() {
		Random rn = new Random();
		int answer = rn.nextInt(10) + 1;
		return  answer;
	}
	
	public int random100() {
		Random rn = new Random();
		int answer = rn.nextInt(100) + 1;
		return  answer;
	}
	public int random50() {
		Random rn = new Random();
		int answer = rn.nextInt(50) + 1;
		return  answer;
	}
}
