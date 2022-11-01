package com.patpet.post.file.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface FileDAO {

	public int insertFile(int postId, int reviewId, String imagePath);
	
}
