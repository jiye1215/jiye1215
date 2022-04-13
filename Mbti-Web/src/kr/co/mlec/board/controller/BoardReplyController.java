package kr.co.mlec.board.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;


public class BoardReplyController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int reStep = Integer.parseInt(request.getParameter("re_step"));
		int reLevel = Integer.parseInt(request.getParameter("re_level"));
		
		BoardVO board = new BoardVO();
		
		board.setNo(no);
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		board.setRef(ref);
		board.setReStep(reStep);
		board.setReLevel(reLevel);

		
		BoardService service = new BoardService();
		service.replyBoard(board);
		
		
		return "redirect:/board/list.do";

	}


}
