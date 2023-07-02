package com.kiranacademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiranacademy.dao.LoginDAO;
import com.kiranacademy.entity.Users;

@Service
public class LoginService 
{
	@Autowired
	LoginDAO loginDAO;
	
	public boolean validate(String username,String password)
	{
		Users users=loginDAO.getUser(username);
		
		if(users==null)
		{
			return false;
		}
		
		else if(username.equals(users.getUsername()) && password.equals(users.getPassword()))
		{
			
			return true;
			
		}
		
		else 
		{
			return false;
		}
	}
	

}
