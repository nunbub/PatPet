package com.patpet.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId
			, @Param("title") String title
			, @Param("name") String name
			, @Param("category") String category
			, @Param("state") String state
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
}
