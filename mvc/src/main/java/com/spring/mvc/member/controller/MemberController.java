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
	public String login(Member member, Model model, HttpSession session) {
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
	public String m_emailChk(String m_email, Model model) {
		int result = ms.m_emailChk(m_email);
		String msg = "";
		if(result == 1) {
			msg = "이미 사용 중이거나 탈퇴한 이메일입니다.";
		}else if(result == 0) {
			msg = "사용 가능한 이메일입니다.";
		}
		model.addAttribute("msg", msg);
		return "member/m_emailChk";
	}
	
	@RequestMapping(value = "m_nickChk", method = RequestMethod.POST)
	public String m_nickChk(String m_nick, String no, Member member, Model model) {
		member.setM_no(Integer.parseInt(no));
		member.setM_nick(m_nick);
		int result = ms.m_nickChk(m_nick, member);
		String msg = "";
		if(result > 0) {
			msg = "이미 사용 중인 닉네임입니다.";
		}else if(result == 0) {
			msg = "";
		}else {
			msg = "사용 가능한 닉네임입니다.";
		}
		model.addAttribute("msg", msg);
		return "member/m_nickChk";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
		
}
