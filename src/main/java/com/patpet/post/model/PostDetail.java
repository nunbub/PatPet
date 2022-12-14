package com.patpet.post.model;

import java.util.List;

import com.patpet.post.file.model.File;

import com.patpet.user.model.User;

public class PostDetail {
	
	private Post post;
	private User postUser;
	private List<File> files;
	private File file;
	private int attentionCount;
	private boolean isAttention;
	
	
	
	public List<File> getFiles() {
		return files;
	}
	public void setFiles(List<File> files) {
		this.files = files;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public User getPostUser() {
		return postUser;
	}
	public void setPostUser(User postUser) {
		this.postUser = postUser;
	}
	
	
	public boolean isAttention() {
		return isAttention;
	}
	public void setAttention(boolean isAttention) {
		this.isAttention = isAttention;
	}
	public int getAttentionCount() {
		return attentionCount;
	}
	public void setAttentionCount(int attentionCount) {
		this.attentionCount = attentionCount;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
	
	

}
