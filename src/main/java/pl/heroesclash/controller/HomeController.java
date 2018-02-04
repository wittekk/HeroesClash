package pl.heroesclash.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
//@ResponseBody
@RequestMapping("/home")
public class HomeController {
	
	@RequestMapping("")	
	public String hello() {		
		return "home/index";		
	}
	

}
