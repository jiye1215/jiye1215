package kr.co.mlec.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardCommentVO;
import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.board.vo.Paging2VO;
import kr.co.mlec.board.vo.PagingVO;
import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.vo.MemberVO;

public class BoardService {
   
   private BoardDAO boardDao;  //모든 보드dao 가져와야하니까 만들어줌 
   private MemberDAO memberDao;

   
   public BoardService() {
      boardDao = new BoardDAO();     //인스턴스 객체 생성
      memberDao = new MemberDAO();
   }
   
   /**
    * 게시글 조회 서비스
    */
   public List<BoardVO> selectAllBoard(PagingVO paging) {
      List<BoardVO> list = boardDao.selectAllBoard(paging);
      return list;
   }
   
   
   /**
    * 게시판 상세 서비스 방법 2
    * 1. 파라미터로 날라온 번호에 해당 게시물 조회
    * 2. 파라미터에 해당하는 첨부파일 조회
    
   public Object[] detailBoard2(int no) {
	  // 1.
      BoardVO board = boardDao.selectBoardByNo(no);
      // 2. 
      List<BoardFileVO> fileList = boardDao.selectFileByNo(no);
      
      // 넘기려는 객체가 두개임(board,fileList) 1.묵시적형변환을 할 수 있는 object 배열을 만들어서 넘김
      Object[] arr = {board, fileList};
      
      
      
      return arr;
      
   }
   */
   
   /**
    * 게시판 상세 서비스 방법 1
    * 1. 파라미터로 날라온 번호에 해당 게시물 조회
    * 2. 파라미터에 해당하는 첨부파일 조회
    */
   public Map<String, Object> detailBoard(int no) {
	  // 1.
      BoardVO board = boardDao.selectBoardByNo(no);
      boardDao.updateCnt(no);
      // 2. 
      List<BoardFileVO> fileList = boardDao.selectFileByNo(no);
      
      // 넘기려는 객체가 두개임(board,fileList)
     Map<String, Object> data = new HashMap<>();
     data.put("board", board);
     data.put("fileList", fileList);
     
     return data;
      
   }

   /**
    * 게시물 등록 서비스
    */
   public void insertBoard(BoardVO board) {
      boardDao.insertBoard(board);
   }

   /*
    * 게시물 등록(첨부파일 포함) 서비스
    */
   public void insertBoard(BoardVO board, List<BoardFileVO> fileList) {
	   
	   // 게시물 번호(seq_tbl_board_no)추출
	   int boardNo = boardDao.selectBoardNo();
	   
	   // tbl_board 저장
	   board.setNo(boardNo);
	   boardDao.insertBoard(board);
	   
	   // tbl_board_file 저장
	   for(BoardFileVO fileVO : fileList) {
		   fileVO.setBoardNo(boardNo);
		   boardDao.insertFile(fileVO);
	   }
	   
   }
   /**
    * 
    * @param board
    */
   public BoardVO selectBoardByNo(int no) {
	      BoardVO board = boardDao.selectBoardByNo(no);
	      return board;
	      
	   }
   /*
    * 게시물 수정 서비스
    */
   
   public void updateBoard(BoardVO board) {
	      boardDao.updateBoard(board);
	   }
   
//   /**
//	 * update용 ???????????????????????
//	 * 
//	 * @param board
//	 */
//	public BoardVO selectBoard(int no) {
//		BoardVO board = boardDao.detailBoard(no);
//		return board;
//	}

	
   /*
    * 게시물 삭제 서비스
    */
   public void deleteBoard(int no) {
	   boardDao.deleteBoard(no);
   }
   
   /**
	 * 게시물 검색 서비스
	 * 
	 * 
	 */
	public List<BoardVO> searchByOneBoard(String choice, String word, Paging2VO paging2) {
		List<BoardVO> sbList = boardDao.searchByOneBoard(choice, word, paging2);

		return sbList;
	}
	
	
   /*
    * 답글 서비스
    */
   public void replyBoard(BoardVO board) {
	   boardDao.replyBoard(board);

   } 
   /**
	 * 지도정보서비스
	 * */
	public List<MemberVO> selectMbti(){
		
	List<MemberVO> list = memberDao.getMemberList();
	
	return list;
	
	}
	/**
	    *    회원 조회 서비스
	    */
	   public List<MemberVO> selectAllMember() {
	      List<MemberVO> list = memberDao.getMemberList();   
	      return list;
	      
	   }


	   /**
	    *    회원 수정 서비스
	    */
	   public void selectUpdateMember(MemberVO member) {
	      memberDao.updateMember(member);
	   
	   }

	   
	   /**
	    *  회원 정보 아이디로 불러오기
	    */
	   public MemberVO selectMemberById(String id) {
	      return memberDao.userInfo(id);
	   }
	   
	   /**
	    *  회원 삭제
	    */
	   public void selectdelMember(String id) {
	       memberDao.delMember(id);
	   }
}