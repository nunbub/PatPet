package com.patpet.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.patpet.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email, String phoneNumber) {
		return userDAO.insertUser(loginId, password, name, email, phoneNumber);
	}
}
