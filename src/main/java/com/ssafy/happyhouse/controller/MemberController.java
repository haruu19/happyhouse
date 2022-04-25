package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.service.MemberService;

@Controller
@RequestMapping("/")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/main")
	public void main() {}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Member member, Model model, HttpSession session) {
		String id = member.getId();
		String pwd = member.getPwd();
		System.out.println(id+" "+pwd);
		try {
			member = memberService.login(id, pwd);
			if (member != null) {
				session.setAttribute("memberinfo", member);
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호를 확인해 주세요!");
			}
			return "redirect:/main";
		} catch (Exception e) {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해 주세요.");
			e.printStackTrace();
			return "error/error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@GetMapping("/registerForm")
	public void registerForm() {}
	
	@PostMapping("/register")
	public String register(Member member) {
		memberService.signUp(member);
		return "redirect:/main";
	}
	
	@GetMapping("/memberinfo")
	public void memberinfo() {}
	
	@GetMapping("/updateForm")
	public void updateForm() {}
	
	@PostMapping("/update")
	public String update(Member member, HttpSession session) {
		session.setAttribute("memberinfo", member);
		return "redirect:/memberinfo";
	}
	
	@PostMapping("/delete")
	public String delete(HttpSession session) {
		Member m = (Member) session.getAttribute("memberinfo");
		System.out.println(m);
		memberService.deleteMember(m.getId());
		session.invalidate();
		return "redirect:/main";
	}
	
	@GetMapping("/findPwdForm")
	public void findPwdForm() {}
	
	@PostMapping("/newPwdForm")
	public String newPwdForm(Member member, Model model, HttpSession session) {
		try {
			String pwd = memberService.findPwd(member.getId(),member.getName(),member.getPhone());
			if (pwd != null) {
				session.setAttribute("memberid", member.getId());
				session.setAttribute("memberpwd", pwd);
			} else {
				model.addAttribute("msg", "가입정보가 없거나, 아이디를 잘못 입력하셨습니다:(");
				return "error/error";
			}
			return "newPwdForm";
		} catch (Exception e) {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해 주세요.");
			return "error/error";
		}
	}
	
	@PostMapping("/newPwd")
	public String newPwd(HttpServletRequest request, Model model, HttpSession session) {
		Member member = new Member();
		String id = (String)session.getAttribute("memberid");
		String pwd = (String)session.getAttribute("memberpwd");
		try {
		member = memberService.login(id, pwd);
		member.setPwd(request.getParameter("newpwd"));
		memberService.updateMember(member);
		model.addAttribute("memberinfo", member);
	} catch (Exception e) {
		model.addAttribute("msg", "비밀번호 수정 중 오류가 발생했습니다:(");
		e.printStackTrace();
		return "error/error";
	}
		return "findPwdResult";
	}
}
