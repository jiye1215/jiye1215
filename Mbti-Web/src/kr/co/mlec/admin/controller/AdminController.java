package kr.co.mlec.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.member.vo.MemberVO;

public class AdminController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
//		HttpSession session = request.getSession();
//		session.invalidate();
		
		// 회원 목록 조회
		BoardService service = new BoardService();
		List<MemberVO> list = service.selectAllMember();
		// 공유영역등록
		request.setAttribute("list", list);		
		return "/jsp/member/memberList.jsp";
	
	
		
		
		

	}
}
