package kr.co.mlec.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;

public class BoardWriteFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request,
			HttpServletResponse response)throws Exception {

		return "/jsp/board/writeForm.jsp";
	}
}
