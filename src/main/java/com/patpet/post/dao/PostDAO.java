package com.patpet.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.patpet.post.model.Post;



@Repository
public interface PostDAO {

	public int insertPost(Post post);
	
	public List<Post> selectPostList(@Param("category") String category);
	
	public Post selectMainPost();
	
	public Post selectPost(@Param("id") int id);
	
	public Post selectPostByIdAndUserId(@Param("id") int id, @Param("userId") int userId);
	
	public int updatePost(
			@Param("postId") int postId
			, @Param("title") String title
			, @Param("name") String name
			, @Param("category") String category
			, @Param("state") String state
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public int deletePost(@Param("postId") int postId);
	
}
