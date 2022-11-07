package com.patpet.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.patpet.common.FileManagerService;
import com.patpet.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
	
	@Autowired
	private PermissionInterceptor interceptor;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	
		registry.addInterceptor(interceptor)
		// 인터셉터를 거칠 페이지
		.addPathPatterns("/**")
		// 제외할 페이지
		.excludePathPatterns("/static/**", "/images/**", "/user/signout", "/post/main/view", "/post/introduce/view");
		
		
	}
	
}
