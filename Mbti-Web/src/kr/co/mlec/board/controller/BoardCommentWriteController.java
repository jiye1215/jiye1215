package kr.co.mlec.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.board.service.CommentService;
import kr.co.mlec.board.vo.BoardCommentVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;

public class BoardCommentWriteController implements Controller {

   @Override
   public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      request.setCharacterEncoding("utf-8");
      
      BoardVO board = new BoardVO();
      
      int no = Integer.parseInt(request.getParameter("no"));
      String commentId = request.getParameter("comment_id");
      String commentContent = request.getParameter("comment_content");
      
      BoardCommentVO comment = new BoardCommentVO();
      
      comment.setNo(no);
      comment.setCommentId(commentId);
      comment.setCommentContent(commentContent);
      
      CommentService service = new CommentService();
      service.insertBComment(comment);
      
      
      return "redirect:/board/detail.do?no=" + no;
   }

}