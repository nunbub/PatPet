package com.patpet.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.patpet.review.model.Review;

@Repository
public interface ReviewDAO {

	public int insertReview(
			@Param("userId") int userId
			, @Param("title") String title
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Review> selectReviewList();
	
	public Review selectMainPage();
	
	public Review selectReview(@Param("id") int id);
	
	public int updateReview(
			@Param("postId") int postId
			, @Param("title") String title
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
}
