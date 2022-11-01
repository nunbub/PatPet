package com.patpet.review.model;

import com.patpet.post.file.model.File;
import com.patpet.user.model.User;

public class ReviewDetail {

	private Review review;
	private File file;
	private User user;
	
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
