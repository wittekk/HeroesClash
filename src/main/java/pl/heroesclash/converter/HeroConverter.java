package pl.heroesclash.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import pl.heroesclash.entity.Hero;
import pl.heroesclash.repository.HeroRepository;

public class HeroConverter implements Converter<String, Hero> {
	
	@Autowired
	private HeroRepository heroRepository;

	@Override
	public Hero convert(String source) {
		Hero curentUser = heroRepository.findOne(Integer.parseInt(source));
		return curentUser;
	}

}
