package com.patpet.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.patpet.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/signup")
	public Map<String, String> addUser(
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
	
}
