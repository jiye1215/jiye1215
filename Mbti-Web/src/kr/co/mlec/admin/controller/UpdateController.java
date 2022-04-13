package kr.co.mlec.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.member.vo.MemberVO;

public class UpdateController  implements Controller { 
	
	@Override
	public String handleRequest(HttpServletRequest request, 
		   HttpServletResponse response) throws Exception {
			
		   request.setCharacterEncoding("utf-8");
		   
		   String id = request.getParameter("id");
		   
		   BoardService service = new BoardService();
		   MemberVO member = service.selectMemberById(id);
		   

		   System.out.println(member);
		   request.setAttribute("member", member);
		   
		   return "/jsp/member/updateMemberForm.jsp";
		   

		   /*
		   if(MemberVO.memInfo("updateMemberForm.do") != -1)  
		   {
		     String id = request.getParameter("id");
		     String password = request.getParameter("password");
		     String name = request.getParameter("name");
		     String addr = request.getParameter("addr");
		     String mymbti = request.getParameter("mymbti");
		     String likembti = request.getParameter("ikembt");
		     String dislikembti = request.getParameter("dislikembti");
		   			
		     MemberVO dao = new MemberVO(id, password, name, addr, mymbti, likembti, dislikembti);
		   			
		     dao.userInfo(dao);
		     response.sendRedirect("/jsp/member/updateMemberForm.jsp");
			}
		   */

	
		
		
	
	}
}
		
		
		

	



