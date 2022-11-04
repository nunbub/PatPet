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
	
	public File selectFile(int postId) {
		return fileDAO.selectFile(postId);
	}
	
	public List<File> getFile(int postId) {
		return fileDAO.selectFileList(postId);
	}
	
	public int deleteFileByPostId(int postId) {
		return fileDAO.deleteFileByPostId(postId);
	}
	
	
	
	public File reviewFile(int reviewId) {
		return fileDAO.selectReviewFile(reviewId);
	}
	
	public File getFileByReviewId(int reviewId) {
		return fileDAO.selectFileByReviewId(reviewId);
	}
	
	public List<File> getReviewList(int reviewId) {
		return fileDAO.selectReviewList(reviewId);
	}
	
	public int deleteFileByReviewId(int reviewId) {
		return fileDAO.deleteFileByReviewId(reviewId);
	}
	
}
