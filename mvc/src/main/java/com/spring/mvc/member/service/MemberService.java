package com.spring.mvc.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.member.dao.MemberDao;
import com.spring.mvc.member.model.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao md;
	
	public int insertMember(Member member) {
		return md.insertMember(member);
	}

	public int loginChk(Member member) {
		return md.loginChk(member);
	}

	public int m_emailChk(String m_email) {
		return md.m_emailChk(m_email);
	}

	public int m_nickChk(String m_nick) {
		return md.m_nickChk(m_nick);
	}
	
	public Member selectMember(int m_no) {
		return md.selectMember(m_no);
	}
	
	public int updateMember(Member member) {
		return md.updateMember(member);
	}
	
	public Member m_deletePwdChk(int m_no) {
		return md.m_deletePwdChk(m_no);
	}

	public int deleteMember(int m_no) {
		return md.deleteMember(m_no);
	}
	
}
