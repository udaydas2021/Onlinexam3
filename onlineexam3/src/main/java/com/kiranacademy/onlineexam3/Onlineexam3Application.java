package com.kiranacademy.onlineexam3;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EntityScan("com")
@ComponentScan("com")
public class Onlineexam3Application 
{

	public static void main(String[] args) {
		SpringApplication.run(Onlineexam3Application.class, args);
	}

}
