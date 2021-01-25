package com.luv2code.springsecurity.demo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource myDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(myDataSource);
		/*UserBuilder users = User.withDefaultPasswordEncoder();
		
		auth.inMemoryAuthentication()
		.withUser(users.username("john").password("test123").roles("EMPLOYEE"));
		
		auth.inMemoryAuthentication()
		.withUser(users.username("mary").password("test123").roles("EMPLOYEE","MANAGER"));
		
		auth.inMemoryAuthentication()
		.withUser(users.username("susan").password("test123").roles("EMPLOYEE","ADMIN"));*/
		
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		/*http.authorizeRequests()
			.antMatchers("/css/**").permitAll() //this line permit rendering of css or other files you want to access without login in
			.anyRequest().authenticated()
				.and() //login form setting
					.formLogin()
						.loginPage("/showMyLoginPage")
						.loginProcessingUrl("/authenticateTheUser")
						.permitAll()
						
						.and() //to handle Logout ability
						.logout().permitAll();*/
		
		http.authorizeRequests()
		//adding all user role descriptiion
		.antMatchers("/").hasRole("EMPLOYEE")
		.antMatchers("/leaders/**").hasRole("MANAGER")
		.antMatchers("/systems").hasRole("ADMIN")
			.and() //login form setting
				.formLogin()
					.loginPage("/showMyLoginPage")
					.loginProcessingUrl("/authenticateTheUser")
					.permitAll()
					.and() //to handle Logout ability
					.logout().permitAll()
					.and()
					.exceptionHandling()
					.accessDeniedPage("/access-denied")
					;
	}
	
	
}
