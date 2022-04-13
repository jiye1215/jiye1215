package kr.co.mlec.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.CommentService;
import kr.co.mlec.controller.Controller;

public class BoardCommentDeleteController implements Controller {

   @Override
   public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
	      int commentNo = Integer.parseInt(request.getParameter("commentNo"));
	      int no = Integer.parseInt(request.getParameter("no"));
	      CommentService service = new CommentService();
	      service.deleteBComment(commentNo);
	      
	      return "redirect:/board/detail.do?no=" + no;
      
   }

}
