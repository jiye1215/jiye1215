package kr.co.mlec.board.service;

import java.util.List;

import kr.co.mlec.board.dao.CommentDAO;
import kr.co.mlec.board.vo.BoardCommentVO;

public class CommentService {
   
   private CommentDAO commentDao;
      
    public CommentService() {
         commentDao = new CommentDAO();
      }
    
    /**
       * 댓글 목록
       */
      public List<BoardCommentVO> selectBComment(int No) {
         List<BoardCommentVO> list = commentDao.selectBComment(No);
         return list;
      }
      /**
       * 댓글 등록
       */
      public void insertBComment(BoardCommentVO comment) {
        
         int commentNo = commentDao.selectBCommentNo();
         
         // tbl_board_comment 저장
         comment.setCommentNo(commentNo);
         commentDao.insertBComment(comment);
         
         
      }
      /*
       * 게시글에 해당하는 댓글 조회
       */
      public BoardCommentVO selectCommentByNo(int cNo, int No) {
         BoardCommentVO comment = commentDao.selectCommentByNo(cNo, No);
         return comment;
      }

      /*
       * 댓글 삭제 서비스
       */
      public void deleteBComment(int commentNo) {
         commentDao.deleteBComment(commentNo);
      }
      /*
       * 게시물 삭제 시 댓글 삭제
      
      public void deleteAllBComment(int No) {
         commentDao.deleteAllBComment(No);
      }
       */
}