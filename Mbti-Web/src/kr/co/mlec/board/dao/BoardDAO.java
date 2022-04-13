package kr.co.mlec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.board.vo.BoardCommentVO;
import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.board.vo.Paging2VO;
import kr.co.mlec.board.vo.PagingVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

/*
 * 게시판 DB(tbl_board) CRUD 
 * @author user
 */
public class BoardDAO {

	

	/**
	 * 전체 게시글 조회 (페이징 추가)
	 */
	public List<BoardVO> selectAllBoard(PagingVO paging) {

		List<BoardVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append(" select * ");
			sql.append(" from ( ");
			sql.append(" select rownum rnum, b.* ");
			sql.append(" from ( ");
			sql.append(" select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date, ref, re_step, re_level ");
			sql.append(" from tbl_board ");
			sql.append(" ORDER by no desc ");
			sql.append(" ) b ) ");
			sql.append(" where rnum >= ? and rnum <= ? ");
			sql.append(" order by ref desc, re_level asc, re_step desc ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, paging.getStartNum());
			pstmt.setInt(2, paging.getEndNum());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				int ref = rs.getInt("ref");
			    int reStep = rs.getInt("re_step");
			    int reLevel = rs.getInt("re_level");

				BoardVO board = new BoardVO(no, title, writer, viewCnt, regDate, ref, reStep, reLevel);

				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}

		return list;
	}
	
	/*
	 * 게시물번호 추출(seq_tbl_board_no)
	 */
	public int selectBoardNo() {
		String sql = "select seq_tbl_board_no.nextval from dual "; //dual은 가상의 테이블
		int boardNo = 0;
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			boardNo = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return boardNo;
	}
	
	/*
	 * 새글 등록
	 * 저장만하고 끝나기때문에 return타입이 void임
	 */
	public void insertBoard(BoardVO board) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;

	      try {
	         conn = new ConnectionFactory().getConnection();
	         StringBuilder sql = new StringBuilder();
	         sql.append("insert into tbl_board(no, title, writer, content, ref) ");
	         sql.append(" values(?, ?, ?, ?, ?) ");
	         pstmt = conn.prepareStatement(sql.toString());

	         pstmt.setInt(1, board.getNo());
	         pstmt.setString(2, board.getTitle());
	         pstmt.setString(3, board.getWriter());
	         pstmt.setString(4, board.getContent());
	         pstmt.setInt(5, board.getNo());
	         pstmt.executeUpdate();

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         JDBCClose.close(pstmt, conn);
	      }
	   }
	/////////////////////////////////////////////////////////
	// 				첨부파일 CRUD							   //
	/////////////////////////////////////////////////////////
	
	public void insertFile(BoardFileVO fileVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into tbl_board_file( ");
		sql.append(" no, board_no, file_ori_name, file_save_name, file_size ");
		sql.append(" ) values(seq_tbl_board_file_no.nextval, ?, ?, ?, ?) ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, fileVO.getBoardNo());
			pstmt.setString(2, fileVO.getFileOriName());
			pstmt.setString(3, fileVO.getFileSaveName());
			pstmt.setInt(4, fileVO.getFileSize());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 *  조회수 증가
	 */
	
	   public void updateCnt(int no) {
		      
		      StringBuilder sql = new StringBuilder();   
		      sql.append("update tbl_board ");
		      sql.append("   set view_cnt = (view_cnt + 1) ");
		      sql.append(" where no = ? ");
		      try (
		         Connection conn = new ConnectionFactory().getConnection();
		         PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		         ){
		         pstmt.setInt(1, no);
		         pstmt.executeUpdate();
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		   }
	
	/*
	 * 게시글 상세 조회(수정)
	 * 
	 */
	public BoardVO selectBoardByNo(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		BoardVO board = null;
		
		try {
			
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql =  new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date, ref, re_step, re_level ");
			sql.append(" from tbl_board ");
			sql.append(" where no = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);		
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				int ref = rs.getInt("ref");
				int reStep = rs.getInt("re_step");
				int reLevel = rs.getInt("re_level");

				
				board = new BoardVO(no, title, writer, content, viewCnt, regDate, ref, reStep, reLevel);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(pstmt, conn);
		} return board;
	} 
	

	/*
	 * 게시물 수정(제목, 작성, 내용)
	 */
	
	public void updateBoard(BoardVO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		
		try {
			
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update tbl_board ");
			sql.append(" set title = ?, content = ? ");
			sql.append(" where no = ? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(pstmt, conn);
		} 
		
	}
	
	/*
	 * 
	 */
	public List<BoardFileVO> selectFileByNo(int boardNo) {
		
		List<BoardFileVO> fileList = new ArrayList<>(); // 하나의 레코드를 추가추가 하는 것이 목적
		
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, file_ori_name, file_save_name, file_size ");
		sql.append(" from tbl_board_file ");
		sql.append(" where board_no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery(); // 0개부터 최대 2개의 첨부파일이 날라옴
			
			while(rs.next()) {
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setNo(rs.getInt("no"));
				fileVO.setFileOriName(rs.getString("file_ori_name"));
				fileVO.setFileSaveName(rs.getString("file_save_name"));
				fileVO.setFileSize(rs.getInt("file_size"));
				
				fileList.add(fileVO);
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return fileList;
	}
	
	/**
	 * 게시글 삭제
	 * 
	 */
	public void deleteBoard(int no) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = " delete from tbl_board where no = ? ";

		try {
			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}
	/*
	    * 답글
	   */
	   public int replyBoard(BoardVO board) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      conn = new ConnectionFactory().getConnection();
	            
	      // 게시글물의 가장 큰 순번을 조회
	      String maxSql = " select max(no) from tbl_board ";

	      int result = 0 ;

	      try {
	         
	         pstmt = conn.prepareStatement(maxSql);
	         ResultSet rs = pstmt.executeQuery();
	         int no = 0; // 리턴할 결과를 저장할 변수
	         if(rs.next()) {
	            no = rs.getInt(1) + 1;
	         }else {
	            no = 1;
	         }
	      

	         
	      // ★핵심코드
	      // 답변형 게시판의 특징
	      // 글을 그룹으로 만들어야하기때문에 re_step과 re_level을 먼저 수정해줘야한다.
	      // 부모 글보다 큰 re_level값을 전부 1씩 증가시켜줌
	      // 들어온 글 그룹값이 같고 들어온 글 레벨보다 글 레벨이 클 경우 글 레벨에 +1
	      // (같은 그룹에 최신 답글이 하나 더 들어오면 보여주는 순서가 하나 더 밀림)
	      // 해당 게시물의 기존 답글의 순번을 하나씩 증가시킴
	         
	      String sql = " update tbl_board set re_level = re_level + 1 where ref = ? and re_level > ? ";

	      pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, board.getRef());
	      pstmt.setInt(2, board.getReLevel());
	      
	      result = pstmt.executeUpdate();

	      //답글을 등록
	      sql = "insert into tbl_board(no, title, writer, content, ref, re_step, re_level) values(?, ?, ?, ?, ?, ?, ?) ";
	      
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         pstmt.setString(2, board.getTitle());
	         pstmt.setString(3, board.getWriter());
	         pstmt.setString(4, board.getContent());
	         pstmt.setInt(5, board.getRef());
	         pstmt.setInt(6, board.getReStep()+1);
	         pstmt.setInt(7, board.getReLevel()+1);

	         
	         result = pstmt.executeUpdate();

	         }catch (Exception e) {
	            e.printStackTrace();
	         }finally {
	            JDBCClose.close(pstmt, conn);
	         } return result;
	      }
	   
	   
		/**
		 * 총 게시물 갯수
		 */

		public int getAllCount() {
			Connection conn = null;
			PreparedStatement pstmt = null;

			int count = 0;

			try {
				conn = new ConnectionFactory().getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("SELECT COUNT(*) as count FROM tbl_board ");

				pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					count = rs.getInt("count");
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCClose.close(pstmt, conn);
			}

			return count;
		}

		/**
		 * 검색글  총갯수
		 */

		public int getSearchCount(String choice, String word) {
			Connection conn = null;
			PreparedStatement pstmt = null;

			int scount = 0;

			try {
				conn = new ConnectionFactory().getConnection();
				StringBuilder sql = new StringBuilder();
				
				 if (choice.equals("writer")) {
		            sql.append("SELECT count(*) as scount from tbl_board "); 
		            sql.append(" WHERE writer LIKE '%" + word + "%' ");
		            pstmt = conn.prepareStatement(sql.toString());
		                
		            
		            } else if (choice.equals("title")) {
		            	sql.append("SELECT count(*) as scount from tbl_board "); 
		            sql.append(" WHERE title LIKE '%" + word + "%' ");
		            System.out.println(sql.toString());
		                pstmt = conn.prepareStatement(sql.toString());
		               
		                
		            } else if (choice.equals("content")) {
		            	sql.append("SELECT count(*) as scount from tbl_board "); 
		            sql.append(" WHERE content LIKE '%" + word + "%' ");
		            pstmt = conn.prepareStatement(sql.toString());

		                
		            } else if (choice.equals("titleNcontent")) {
		            	sql.append("SELECT count(*) as scount from tbl_board "); 
		           sql.append(" WHERE title LIKE '%" + word + "%' OR content LIKE '%" + word + "%' ");
		           pstmt = conn.prepareStatement(sql.toString());
		            }
				
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					scount = rs.getInt("scount");
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCClose.close(pstmt, conn);
			}
			
			System.out.println("scount = " + scount);

			return scount;
		}
		
		/**
		 * 게시글 검색기능
		 * 
		 */
		
		public List<BoardVO> searchByOneBoard(String choice, String word, Paging2VO paging) {
	        List<BoardVO> list = new ArrayList<BoardVO>();
	 
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        
	       
	        try {
	    		conn = new ConnectionFactory().getConnection();
				StringBuilder sql = new StringBuilder();
				
				System.out.println("dao dao choice : " + choice);
				
	            if (choice.equals("writer")) {
	            	sql.append(" select * ");
	    			sql.append(" from ( ");
	    			sql.append(" select rownum rnum, b.* ");
	    			sql.append(" from ( ");
	    			sql.append(" SELECT no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	                sql.append(" FROM tbl_board");
	                sql.append(" WHERE writer LIKE '%" + word + "%' ");
	                sql.append(" ORDER BY reg_date DESC");
	    			sql.append(" ) b ) ");
	    			sql.append(" where rnum >= ? and rnum <= ? ");
	                pstmt = conn.prepareStatement(sql.toString());
	                
	            } else if (choice.equals("title")) {
	            	sql.append(" select * ");
	    			sql.append(" from ( ");
	    			sql.append(" select rownum rnum, b.* ");
	    			sql.append(" from ( ");
	            	sql.append(" SELECT no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	                sql.append(" FROM tbl_board ");
	                sql.append(" WHERE title LIKE '%" + word + "%' ");
	                sql.append(" ORDER BY reg_date DESC ");
	                sql.append(" ) b ) ");
	    			sql.append(" where rnum >= ? and rnum <= ? ");
	                System.out.println(sql.toString());
	                pstmt = conn.prepareStatement(sql.toString());
	               
	                
	            } else if (choice.equals("content")) {
	            	sql.append(" select * ");
	    			sql.append(" from ( ");
	    			sql.append(" select rownum rnum, b.* ");
	    			sql.append(" from ( ");
	            	sql.append(" SELECT no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	                sql.append(" FROM tbl_board ");
	                sql.append(" WHERE content LIKE '%" + word + "%' ");
	                sql.append(" ORDER BY reg_date DESC ");
	                sql.append(" ) b ) ");
	    			sql.append(" where rnum >= ? and rnum <= ? ");
	                pstmt = conn.prepareStatement(sql.toString());

	                
	            } else if (choice.equals("titleNcontent")) {
	            	sql.append(" select * ");
	    			sql.append(" from ( ");
	    			sql.append(" select rownum rnum, b.* ");
	    			sql.append(" from ( ");
	            	sql.append(" SELECT no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	                sql.append(" FROM tbl_board ");
	                sql.append(" WHERE title LIKE '%" + word + "%' OR content LIKE '%" + word + "%' ");
	                sql.append(" ORDER BY reg_date DESC ");
	                sql.append(" ) b ) ");
	    			sql.append(" where rnum >= ? and rnum <= ? ");
	                pstmt = conn.prepareStatement(sql.toString());
	                
	            } 
	        	
				pstmt.setInt(1, paging.getStartNum());
				pstmt.setInt(2, paging.getEndNum());
				
				System.out.println("startnum =" + paging.getStartNum());
				
				
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					int no = rs.getInt("no");
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					int viewCnt = rs.getInt("view_cnt");
					String regDate = rs.getString("reg_date");
					
					BoardVO board = new BoardVO(no, title, writer, viewCnt, regDate);

					list.add(board);
	 

	            }
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            JDBCClose.close(pstmt, conn);
	        }
	 
	        return list;
	    }
		/**
		 * 게시글 조회 카운트
		 */
		
		public void readCountUp(int boardNo) {
		      

		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      
		      try {
		    	 conn = new ConnectionFactory().getConnection();
		    	 
		         StringBuilder sql = new StringBuilder();
		         sql.append(" update tbl_board set view_cnt = view_cnt +1 ");
		         sql.append(" where no = ? ");
		         pstmt= conn.prepareStatement(sql.toString());
		         pstmt.setInt(1, boardNo);
		         
		         pstmt.executeUpdate();
		         
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		         
		      }finally {
		         JDBCClose.close(pstmt, conn);
		      }
		      
		}

}
