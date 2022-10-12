package com.patpet.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	public static final String FILE_UPLOAD_PATH = "C:\\Users\\Ryu\\OneDrive\\바탕 화면\\프로그래밍\\spring\\test\\patpet\\upload";
	
	// 파일을 저장하고, 해당 파일을 접근할 경로를 돌려주는 기능
	public static String saveFile(int userId, MultipartFile file) {
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// 파일 생성
		String filePath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(filePath);
		
		// 파일 생성 실패
		if(directory.mkdir() == false) {
			return null;
		}
		
		// 파일 저장
		try {
			byte[] bytes = file.getBytes();
			
			String fileFullPath = filePath + file.getOriginalFilename();
			Path path = Paths.get(fileFullPath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			return null;
		}
		
		return "/images" + directoryName + file.getOriginalFilename();
		
	}
	
	// 파일 삭제 기능
	public static boolean removeFile(String filePath) {
		
		if(filePath == null) {
			return true;
		}
		
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		Path path = Paths.get(realFilePath);
		
		// 파일이 존재 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;
			}
		}
		
		// 디렉토리 삭제
		path = path.getParent();
		// 디렉토리 존재 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;
			}
		}
		
		return true;
		
	}
	
}

