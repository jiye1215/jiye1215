package kr.co.mlec.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.BoardService;

import kr.co.mlec.controller.Controller;

public class BoardDeleteController implements Controller {

   @Override
   public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
	  //int bNum = Integer.parseInt(request.getParameter("boardNum"));
      int no = Integer.parseInt(request.getParameter("no"));
      BoardService service = new BoardService();
      
      service.deleteBoard(no);
      
      return "redirect:/board/list.do";
      
   }

}