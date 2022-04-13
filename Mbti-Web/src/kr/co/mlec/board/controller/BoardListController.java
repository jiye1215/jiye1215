package kr.co.mlec.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.board.vo.PagingVO;
import kr.co.mlec.controller.Controller;

/*
 *  	/board/list.do(전체리스트조회) 호출되었을 때
 *  	1. 비지니스 로직 수행(tbl_board에서 전체게시글 조회)
 *  	2. servlet에게 forward 시킬 jsp/board/list.jsp 알려줌
 */
public class BoardListController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		
		BoardService service = new BoardService();
		BoardDAO dao = new BoardDAO();
		PagingVO paging = new PagingVO();
		//List<BoardVO> list = service.selectAllBoard(paging);
		
		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int count = dao.getAllCount();
		paging.setPage(page);
		paging.setTotalCount(count);
		
		System.out.println("nnnncount" + count );
		List<BoardVO> list = service.selectAllBoard(paging);
		
		// 공유영역에 등록
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		
		return "/jsp/board/list.jsp?page="+page;
	}

}