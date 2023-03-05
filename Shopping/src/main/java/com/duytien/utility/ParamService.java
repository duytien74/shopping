package com.duytien.utility;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;
	
	
	public String getString(String name,String defaultValue) {
		String value = request.getParameter(name);
		return value != null ? value : defaultValue; 		
	}
	
	public int getInt(String name, int defaultValue) {
		String value = (String)request.getParameter(name);
		return value != null? Integer.parseInt(value) : defaultValue;
	}
	
	public double getDouble(String name, double defaultValue) {
		String value = (String)request.getParameter(name);
		return value != null? Double.parseDouble(value) : defaultValue;
	}
	
	public boolean getBoolean(String name, boolean defaultValue) {
		String value = (String)request.getParameter(name);
		return value != null? Boolean.parseBoolean(value) : defaultValue;
	}
	
	public Date getDate(String name, String pattern) throws ParseException {
		String value = (String)request.getParameter(name);
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		return value != null? formatter.parse(value) : formatter.parse(formatter.format(new Date()));
	}
	
	public File save(MultipartFile image,String nameFolder) {
		File file1 = new File("src/main/resources/static/image/"+nameFolder);
		String absolutePath = file1.getAbsolutePath();
		System.out.println(absolutePath);
		if(!image.isEmpty()) {
			String filename = image.getOriginalFilename();
			String uploadDir = absolutePath+"\\"+filename;
			System.out.println(uploadDir);
			File file = new File(uploadDir);
			try {
				image.transferTo(file);
				return file;
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		}else {
			System.out.println("hong co gì");
		}
		
		return null;
	}
}
