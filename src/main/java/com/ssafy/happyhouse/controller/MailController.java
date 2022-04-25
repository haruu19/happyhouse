package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseInfoDTO;
import com.ssafy.happyhouse.model.service.MailService;

@RestController
public class MailController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private MailService mailService;
	
//	@GetMapping("/email")
//	public String sendMail(String email) {
//		mailService.sendMail(email);
//		return "registerForm";
//	}
	
	@GetMapping("/email")
	public String sendMail(HttpServletRequest request){ // ajax 연동 시 json 형식이 아닌 객체로 넘겨줘도 된다
		System.out.println("sendEmail 호출됨");
		String email = request.getParameter("email");
		try {
			mailService.sendMail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "616617";
	}
}
