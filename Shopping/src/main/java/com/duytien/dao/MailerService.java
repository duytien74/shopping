package com.duytien.dao;

import javax.mail.MessagingException;

import com.duytien.model.MailInfo;

public interface MailerService {
	//Gửi mail với param là thông tin đầy đủ email
	void send(MailInfo mail) throws MessagingException;
	
	
	//Gửi mail cơ bản
	void send(String to, String subject, String body)throws MessagingException;
}
