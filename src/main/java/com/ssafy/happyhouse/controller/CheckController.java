package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/check")
public class CheckController {
	
	@GetMapping("/check")
	public void main(){}
	
	@GetMapping("/housingPay")
	public void housingPay() {}
	
	@GetMapping("/housingPublic")
	public void housingPublic() {}
	
	@GetMapping("/housingFinance")
	public void housingFinance() {}
	
	@GetMapping("/housingPayResult")
	public void result() {}
}
