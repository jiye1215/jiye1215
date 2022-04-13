package kr.co.mlec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

public class MemberDAO {
	
	/**
	 * 	회원 리스트
	 */
	
	public List<MemberVO> getMemberList() {
		
		List<MemberVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, id, password, name, type ");
			sql.append("	, to_char(reg_date,'yyyy-mm-dd') as reg_date ");
			sql.append("	, my_mbti, like_mbti, dislike_mbti, addr_x, addr_y ");
			sql.append("	from mbti_member ");
			sql.append(" 	order by no desc ");
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
						
			while(rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String type = rs.getString("type");
				String regDate = rs.getString("reg_date");
				String mymbti = rs.getString("my_mbti");
				String likembti = rs.getString("like_mbti");
				String dislikembti = rs.getString("dislike_mbti");
				String addrx = rs.getString("addr_x");
				String addry = rs.getString("addr_y");
				MemberVO member = new MemberVO(no, id, password, name, type, regDate, mymbti, likembti, dislikembti, addrx, addry);
			//	System.out.println(board);
				
				list.add(member);
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
		return list;
	}
	  /**
	    * 회원정보에 맞는 이름 가져오기
	    * */
	   
	   public MemberVO selectMyMapList(String id) {
		      
		     
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      
		      
		      MemberVO memb = null;
		      
		      
		      try {
		         conn = new ConnectionFactory().getConnection();
		         StringBuilder sql = new StringBuilder();
		         
		         sql.append(" select id, name, my_mbti, like_mbti, dislike_mbti, addr_x, addr_y ");
		         sql.append(" from mbti_member ");
		         sql.append(" where id = ? ");
		       
		         pstmt = conn.prepareStatement(sql.toString());
		         
		         pstmt.setString(1, id);
		         
		         ResultSet rs = pstmt.executeQuery();
		                  
		         while(rs.next()) {
		        	memb = new MemberVO();
		            memb.setId(rs.getString("id")); 
		            memb.setName(rs.getString("name"));
		            //memb.setAddr(rs.getString("addr"));
		            memb.setMymbti(rs.getString("my_mbti")) ;
		            memb.setLikembti(rs.getString("like_mbti"));
		            memb.setDislikembti(rs.getString("dislike_mbti"));
		            memb.setAddrx(rs.getString("addr_x"));
		            memb.setAddry(rs.getString("addr_y"));
		            
		            
		            
		            
		            
		      }
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         JDBCClose.close(pstmt, conn); 
		      }
		      
		      return memb;
		   }
	   
	   
	   /**
	    * 전체 회원 지도 정보 가져오기
	    * */
	   
	   
	   public List<MemberVO> selectAllMapList(String id){
		   List<MemberVO> allmaplist = new ArrayList<>();
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      
		      try {
		         conn = new ConnectionFactory().getConnection();
		         StringBuilder sql = new StringBuilder();
		         sql.append(" select id, name, my_mbti, like_mbti, dislike_mbti, addr_x, addr_y ");
		         sql.append(" from mbti_member ");
		         sql.append(" where id != ? ");
		         
		         pstmt = conn.prepareStatement(sql.toString());
		         pstmt.setString(1, id);
		         ResultSet rs = pstmt.executeQuery();
		                  
		         while(rs.next()) {
		            
		            String id2 = rs.getString("id");
		            String name = rs.getString("name");
		            //String addr = rs.getString("addr");
		            String mymbti = rs.getString("my_mbti");
		            String likembti = rs.getString("like_mbti");
		            String dislikembti = rs.getString("dislike_mbti");
		            String addrx = rs.getString("addr_x");
		            String addry = rs.getString("addr_y");
		            
		            MemberVO allmember = new MemberVO(id2, name, mymbti, likembti, dislikembti, addrx, addry);
		         //   System.out.println(allmember);
		            
		            allmaplist.add(allmember);
		      }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         JDBCClose.close(pstmt, conn);
		      }
		      
		      return allmaplist;
	   }	

	/**
	 * 	회원 아이디 가져오기
	 */
	
	 public MemberVO userInfo(String _id) {
		MemberVO memInfo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
	 try {
		conn = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		
		sql.append("select * from mbti_member where id = ? ");
		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1,_id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
			String id = rs.getString("id");
			String password = rs.getString("password");
			String name = rs.getString("name");
			String mymbti = rs.getString("my_mbti");
			String likembti = rs.getString("like_mbti");
			String dislikembti = rs.getString("dislike_mbti");
			String addrx = rs.getString("addr_x");
			String addry = rs.getString("addr_y");
			memInfo = new MemberVO(id, password, name, mymbti, likembti, dislikembti, addrx, addry);
	 } catch (Exception e) {
		 e.printStackTrace();
	 }
	 return memInfo;
}

	

	/**
	 * 	회원 수정
	 */
	
	public void updateMember(MemberVO member) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			
			sql.append("update mbti_member ");
			sql.append("   set  password = ?, name = ? ");
			sql.append("   , my_mbti = ?, like_mbti = ?, dislike_mbti = ?, addr_x = ?, addr_y = ?");
			sql.append(" where id = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(9, member.getId());
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName());
			pstmt.setString(4, member.getMymbti());
			pstmt.setString(5, member.getLikembti());
			pstmt.setString(6, member.getDislikembti());
			pstmt.setString(7, member.getAddrx());
			pstmt.setString(8, member.getAddry());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}


	}	  

	/**
	 * 	회원 삭제
	 */
	
	public void delMember(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = " delete from mbti_member where id = ? ";
		
		try {
			
		    conn = new ConnectionFactory().getConnection();
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, id);
		    pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}
}