package com.patpet.post.file.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.patpet.post.file.dao.FileDAO;
import com.patpet.post.file.model.File;

@Service
public class FileBO {
	
	@Autowired
	private FileDAO fileDAO;
	
	public int addFile(int postId, int reviewId, String imagePath) {
		return fileDAO.insertFile(postId, reviewId, imagePath);
	}
	
	public File getFileByPostId(int postId) {
		return fileDAO.selectFileByPostId(postId);
	}
	
	public List<File> getFile(int postId) {
		return fileDAO.selectFile(postId);
	}
	
	
}
