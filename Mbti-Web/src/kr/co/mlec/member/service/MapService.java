package kr.co.mlec.member.service;

import java.util.List;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.vo.MemberVO;

public class MapService {

	
	private MemberDAO memberDao;
	
	public MapService() {
		memberDao = new MemberDAO();
		
	}
	
	public MemberVO map(String id) {
		return memberDao.selectMyMapList(id);
		
	}
	
	public List<MemberVO> selectAllMapList(String id) {
		
		List<MemberVO> allmaplist = memberDao.selectAllMapList(id);
		
		return allmaplist;
	}
}
