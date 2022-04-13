package kr.co.mlec.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.board.vo.Paging2VO;
import kr.co.mlec.controller.Controller;

public class SearchBoardController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BoardService service = new BoardService();
		BoardDAO dao = new BoardDAO();
		Paging2VO paging2 = new Paging2VO();
		
		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String choice = request.getParameter("choice");
		String word = request.getParameter("word");
		int scount = dao.getSearchCount(choice, word);
		
		
		paging2.setPage(page);
		paging2.setTotalCount(scount);
		
		
		System.out.println(paging2);
		
        //BoardVO board = new BoardVO();
        
		//BoardService service = new BoardService();
		
        //board.setChoice(choice);
       // board.setWord(word);

        System.out.println(choice + " : " + word + " : " + page);
        List<BoardVO> sbList = service.searchByOneBoard(choice, word, paging2);
        
        request.setAttribute("sbList", sbList);
        request.setAttribute("paging2", paging2);
        
        return "/jsp/board/searchBoard.jsp?choice="+choice+"&word="+word+"&page="+page;
        
       // return "redirect:/board/searchBoard.do?choice=" + choice + "&word=" + word + "&page=" + page;
        }

}
