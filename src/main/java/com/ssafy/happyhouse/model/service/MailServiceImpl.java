package com.ssafy.happyhouse.model.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender javaMailSender;

	
	@Override
	public void sendMail(String email) {
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			
			//메일 제목 설정
			helper.setSubject("회원가입 인증코드 안내입니다.");
			//수신자 설정
			helper.setTo(email);
			//발신자 설정
			helper.setFrom("000000");
			//내용 설정
			helper.setText("귀하의 인증 코드는 616617 입니다.");
			
			//메일 보내기
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
}
