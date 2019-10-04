package com.apps.sm.gae.travelify.beta;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@Configuration
public class AppConfig {
	
	@Bean
	public UserService userService() {
		return UserServiceFactory.getUserService();
	}
}
