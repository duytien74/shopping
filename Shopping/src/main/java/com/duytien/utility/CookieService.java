package com.duytien.utility;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
	@Autowired HttpServletRequest request;
	@Autowired HttpServletResponse response;
	
	public Cookie add(String name, String value,int days) {
		Cookie cookie = new Cookie(name,value);
		cookie.setMaxAge(days*60*60);
		cookie.setPath("/");
		response.addCookie(cookie);
		return cookie;
	}
	
	public String getValue(String name) {
		return this.get(name) != null ? get(name).getValue() : null;
	}
	
	public Cookie get(String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies !=null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					System.out.println(cookie.getName()+" nha");
					return cookie;
				}
			}
		}
		
		return null;
	}
	
	public void remove(String name) {
		this.add(name, null, 0); 
	}
}
