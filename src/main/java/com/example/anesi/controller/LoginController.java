package com.example.anesi.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

		
	@RequestMapping("/login.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/login";
		
	}

	
	@RequestMapping("/text.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/test";
    }
	
	@RequestMapping("/header.do") 
	public String header(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/header";
	}

}
