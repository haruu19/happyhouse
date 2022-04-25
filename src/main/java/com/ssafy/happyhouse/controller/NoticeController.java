package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.model.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("/noticeList")
	public void notice(Model model) {
		model.addAttribute("list", service.list());
	}
	
	@GetMapping("/noticeDetail")
	public void noticeDetail(Model model, int isbn) {
		model.addAttribute("detail", service.searchNoticeByIsbn(isbn));
	}
	
	@GetMapping("/noticeForm")
	public void writeNotice() {}
	
	@PostMapping("/writeNotice")
	public String writeNotice(Notice notice) {
		service.insertNotice(notice);
		return "redirect:noticeList";
	}
	@GetMapping("/noticeUpdateForm")
	public void updateNotice(HttpServletRequest request, Model model) {
		model.addAttribute("notice",service.searchNoticeByIsbn(Integer.parseInt(request.getParameter("isbn"))));
	}
	
	@GetMapping("/updateNotice")
	public String updateNotice(Notice notice) {
		System.out.println(notice.toString());
		service.updateNotice(notice);
		return "redirect:noticeList";
	}
	
	@GetMapping("/deleteNotice")
	public String deleteNotice(int isbn) {
		service.deleteNoticeByIsbn(isbn);
		return "redirect:noticeList";
	}
	
	@GetMapping("noticeSort")
	public String sortNotice() {
		service.listSortedByViews();
		return "redirect:noticeList";
	}
}
