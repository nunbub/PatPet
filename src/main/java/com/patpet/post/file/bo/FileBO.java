package com.patpet.post.file.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.patpet.post.file.dao.FileDAO;

@Service
public class FileBO {
	
	@Autowired
	private FileDAO fileDAO;
	
	public int addFile(int postId, int reviewId, String imagePath) {
		return fileDAO.insertFile(postId, reviewId, imagePath);
	}
	
	
}
