package kr.co.mlec.member.service;

import kr.co.mlec.member.dao.SignupDAO;
import kr.co.mlec.member.vo.MemberVO;


public class SignupService {
	
	private SignupDAO signupDao;
	
	public SignupService() {
		signupDao = new SignupDAO();
	}
	//회원가입
	public void signup(MemberVO signupVO) {
		signupDao.signup(signupVO);
		
		
		
	}
}
