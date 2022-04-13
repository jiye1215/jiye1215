package kr.co.mlec.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.member.vo.MemberVO;

public class DelController implements Controller { 
	
	@Override
	public String handleRequest(HttpServletRequest request, 
		   HttpServletResponse response) throws Exception {
		   
		  String id = request.getParameter("id");
		   
		   BoardService service = new BoardService();
		   service.selectdelMember(id);
		  
	
		   return "redirect:/member/memberList.do";
		   
		
		
	
	}
}
		
		
		

	



