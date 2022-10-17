package com.patpet.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.patpet.common.EncryptUtils;
import com.patpet.user.dao.UserDAO;
import com.patpet.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email, String phoneNumber) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email, phoneNumber);
		
	}
	
	public boolean isDuplicate(String loginId) {
		int count = userDAO.selectCountLoginId(loginId);
		
		return count!= 0 ;
	}
	
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
		
	}
	
	
	
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
	
}
