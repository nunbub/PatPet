package com.patpet.review.model;

import java.util.List;

import com.patpet.post.file.model.File;
import com.patpet.user.model.User;

public class ReviewDetail {

	private Review review;
	private List<File> files;
	private User reviewUser;
	private File file;
	
	
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public List<File> getFiles() {
		return files;
	}
	public void setFiles(List<File> files) {
		this.files = files;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public User getReviewUser() {
		return reviewUser;
	}
	public void setReviewUser(User reviewUser) {
		this.reviewUser = reviewUser;
	}
	
}
