package kr.co.mlec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.board.vo.BoardCommentVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

public class CommentDAO {

      /*
       * 댓글 목록
      */       
   
      public List<BoardCommentVO> selectBComment(int No){
         
         List<BoardCommentVO> list = new ArrayList<>();
         Connection conn = null;
         PreparedStatement pstmt = null;
        
         
         try {
            conn = new ConnectionFactory().getConnection();
            String sql = "select * from tbl_board_comment where no = ? order by comment_no asc ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, No);
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()){
               int commentNo = rs.getInt("comment_No");
               int no = rs.getInt("no");
               String commentId = rs.getString("comment_id");
               String commentDate = rs.getString("comment_date");
               String commentContent = rs.getString("comment_content");
               
               BoardCommentVO comment = new BoardCommentVO(commentNo, no, commentId, commentDate, commentContent);

               list.add(comment);
            }
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
               JDBCClose.close(pstmt, conn);
            } return list;
         }
      
      /*
       *  댓글 추가
       */
      public void insertBComment(BoardCommentVO comment) {
         Connection conn = null;
          PreparedStatement pstmt = null;

            try {
               conn = new ConnectionFactory().getConnection();
               StringBuilder sql = new StringBuilder();
               sql.append("insert into tbl_board_comment(comment_no, no, comment_id, comment_content) ");
               sql.append(" values(?, ?, ?, ?) ");
               pstmt = conn.prepareStatement(sql.toString());


               pstmt.setInt(1, comment.getCommentNo());
               pstmt.setInt(2, comment.getNo());
               pstmt.setString(3, comment.getCommentId());
               pstmt.setString(4, comment.getCommentContent());
               pstmt.executeUpdate();

            } catch (Exception e) {
               e.printStackTrace();
            } finally {
               JDBCClose.close(pstmt, conn);
            }
      }
      
      /*
       * 댓글번호 추출(seq_tbl_board_comment_no)
       */
      public int selectBCommentNo() {
         String sql = "select seq_tbl_board_comment_no.nextval from dual "; //dual은 가상의 테이블
         int bCommentNo = 0;
         try(
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
         ){
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            bCommentNo = rs.getInt(1);
         }catch(Exception e) {
            e.printStackTrace();
         }
         return bCommentNo;
      }
      /*
          * 게시글에 해당하는 댓글 조회
          */
         public BoardCommentVO selectCommentByNo(int commentNO, int No) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            BoardCommentVO comment = null;
            
           try {
                conn = new ConnectionFactory().getConnection();
               StringBuilder sql =  new StringBuilder();
               sql.append(" select * from tbl_board_comment ");
               sql.append(" where comment_no = ? and no = ? ");
               pstmt = conn.prepareStatement(sql.toString());
               pstmt.setInt(1, commentNO);      
               pstmt.setInt(2, No);      
               ResultSet rs = pstmt.executeQuery();
               
               
               if(rs.next()) {
                  int commentNo = rs.getInt("comment_No");
                  int no = rs.getInt("no");
                  String commentId = rs.getString("comment_id");
                  String commentDate = rs.getString("comment_date");
                  String commentContent = rs.getString("comment_content");
                  
                  comment = new BoardCommentVO(commentNo, no, commentId, commentDate, commentContent);
               }
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            JDBCClose.close(pstmt, conn);
         } return comment;
         }
      /*
       * 댓글 갯수
       */
      public int getBCommentCount(int No){
         Connection conn = null;
         PreparedStatement pstmt = null;
         int coCount  = 0;
         try {
            conn = new ConnectionFactory().getConnection();
            String sql = "select count(comment_no) from tbl_board_comment where comment_no = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, No);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
               coCount = rs.getInt(1);
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            JDBCClose.close(pstmt, conn);
         }
         return coCount;
      }
      /*
       * 댓글 삭제
       */
      public void deleteBComment(int commentNo){
         Connection conn = null;
         PreparedStatement pstmt = null;
         
         String sql = "delete from tbl_board_comment where comment_no = ? ";
         try {
            conn = new ConnectionFactory().getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, commentNo);
            pstmt.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            JDBCClose.close(pstmt, conn);
         }
      }
      
}