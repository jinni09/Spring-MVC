package com.spring.mvc.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mvc.member.model.Member;
import com.spring.mvc.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("pgm", "../member/login.jsp");
		return "decorators/main";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public String login(Member member, HttpSession session) {
		int m_no = ms.loginChk(member);
		String result = null;
		if(m_no != 0) {
			session.setAttribute("m_no", m_no);
			result = "success";
		}
		return result;
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinForm(Model model) {
		model.addAttribute("pgm", "../member/join.jsp");
		return "decorators/main";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Member member, Model model) {
		int result = ms.insertMember(member);
		if(result > 0) {
			model.addAttribute("pgm", "../member/login.jsp");			
			return "decorators/main";
		}else {
			model.addAttribute("pgm", "../member/join.jsp");						
			return "decorators/main";
		}
	}
	
	@RequestMapping(value = "m_emailChk", method = RequestMethod.POST)
	@ResponseBody
	public int m_emailChk(String m_email) {
		int result = ms.m_emailChk(m_email);
		return result;
	}
	
	@RequestMapping(value = "m_nickChk", method = RequestMethod.POST)
	@ResponseBody
	public int m_nickChk(String m_nick) {
		int result = ms.m_nickChk(m_nick);
		return result;
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
		
}
