package kr.co.mlec.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;

public class BoardReplyFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int no = Integer.parseInt(request.getParameter("no"));
			 
		BoardService service = new BoardService();
		 
		BoardVO board = service.selectBoardByNo(no);
		 

		request.setAttribute("board", board); // JSP에 값을 넘겨주기 위하여 세팅

	    return "/jsp/board/replyForm.jsp";
	
	}

}
