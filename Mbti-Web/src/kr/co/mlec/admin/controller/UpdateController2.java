package kr.co.mlec.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.member.vo.MemberVO;

public class UpdateController2  implements Controller { 
	
	@Override
	public String handleRequest(HttpServletRequest request, 
		   HttpServletResponse response) throws Exception {
			
		   request.setCharacterEncoding("euc-kr");
		   
		   
		   BoardService service = new BoardService();
		   MemberVO member = new MemberVO();
		   member.setId(request.getParameter("id"));
		   member.setPassword(request.getParameter("password"));
		   member.setName(request.getParameter("name"));
		   member.setAddr(request.getParameter("addr"));
		   member.setMymbti(request.getParameter("mymbti"));
		   member.setLikembti(request.getParameter("likembti"));
		   member.setDislikembti(request.getParameter("dislikembti"));
		   member.setAddrx(request.getParameter("addrx"));
		   member.setAddry(request.getParameter("addry"));
		   service.selectUpdateMember(member);
		   
		   System.out.println(member);

	
		   request.setAttribute("member", member);
		   
		   return "redirect:/member/memberList.do";
		   
		
		
	
	}
}
		
		
		

	



