package com.spring.mvc.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mvc.member.model.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	public int insertMember(Member member) {
		int result = 0, m_number = 0, m_no = 0;
		try {
			m_no = session.selectOne("member.selectMno", member);
			if(m_no > 0) {
				member.setM_no(m_no);
				result = session.update("member.updateMember", member);
			}else {
				m_number = session.selectOne("member.selectNum");
				member.setM_no(m_number);
				result = session.insert("member.insertMember", member);
			}
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

	public int loginChk(Member member) {
		int m_no = 0;
		try {
			m_no = session.selectOne("member.loginChk", member);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return m_no;
	}

	public int m_emailChk(String m_email) {
		int result = 0;
		try {
			result = session.selectOne("member.m_emailChk", m_email);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

	public int m_nickChk(String m_nick) {
		int result = 0;
		try {
			result = session.selectOne("member.m_nickChk", m_nick);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}
	
	public Member selectMember(int m_no) {
		return session.selectOne("member.selectMember", m_no);
	}

	public int updateMember(Member member) {
		int result = 0;
		try {
			result = session.update("member.updateMember", member);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

	public int deleteMember(int m_no) {
		int result = 0;
		try {
			result = session.update("member.deleteMember", m_no);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

}
