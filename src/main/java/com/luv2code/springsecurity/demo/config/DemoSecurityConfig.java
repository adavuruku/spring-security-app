package com.luv2code.springsecurity.demo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource myDataSource;
	
	//noop for no encryption usedjust plain text
//	@SuppressWarnings("deprecation")
//	@Bean
//	public static NoOpPasswordEncoder passwordEncoder() {
//	return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
//	}
	
	 @Bean
	    public PasswordEncoder encoder() {
	        return new BCryptPasswordEncoder();
	    }

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		/*Note: the authentication table - you add {noop} to the password i.e {noop}test123
		* if its bcrypt u add {bcrypt} i.e {bcrypt}$2y$12$st76baNxhY8TPPokCcGjB.aWLtBIXUDlY4ynS/gfMFSql0gv49UzC
		* auth.jdbcAuthentication().dataSource(myDataSource);
		* 
		*  or 
		* 
		* Also you can create an encoder helper class to tell spring on how to encode the password
		* as such u dont need to add  {noop} or {bcrypt} to the password 
		*  only the hash value is save to db
		* and while confirm it you add .passwordEncoder(encoder()); to the auth.authen...*/
		
		auth.jdbcAuthentication().dataSource(myDataSource).passwordEncoder(encoder());
		
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
		.antMatchers("/").permitAll()
		.antMatchers("/employees").hasRole("EMPLOYEE")
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
