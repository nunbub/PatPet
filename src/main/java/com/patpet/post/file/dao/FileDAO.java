package com.patpet.post.file.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.patpet.post.file.model.File;


@Repository
public interface FileDAO {

	public int insertFile(
			@Param("postId") int postId
			, @Param("reviewId") int reviewId
			, @Param("imagePath")String imagePath);
	
	public File selectFileByPostId(@Param("postId") int postId);
	
	public File selectFile(@Param("postId") int postId);
	
	public List<File> selectFileList(@Param("postId") int postId);
	
	public File selectReviewFile(@Param("reviewId") int reviewId);
	
	public File selectFileByReviewId(@Param("reviewId") int reviewId);
	
}
