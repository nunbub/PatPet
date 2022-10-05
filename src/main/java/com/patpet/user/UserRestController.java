package com.patpet.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.patpet.user.bo.UserBO;
import com.patpet.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/signup")
	public Map<String, String> singup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		int count = userBO.addUser(loginId, password, name, email, phoneNumber);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/duplicate_id")
	public Map<String, Boolean> isDeuplicate(@RequestParam("loginId") String loginId) {
		
		boolean isDuplicate = userBO.isDuplicate(loginId);
		
//		중복시	{"id_duplicate":true}
//		중복이 아닌경우	{"id_duplicate":false}
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(isDuplicate) {
			result.put("id_duplicate", true);
		} else {
			result.put("id_duplicate", false);
		}
		
		return result;
	}
	
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
}
