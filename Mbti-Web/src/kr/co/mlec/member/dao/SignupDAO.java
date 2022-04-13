package kr.co.mlec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

public class SignupDAO {


	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	boolean flag = false;

		//id중복확인
		public boolean checkId(String id) {
		
			try {
				conn = new ConnectionFactory().getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("select id from mbti_member where id = ? ");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, id);
				flag = pstmt.executeQuery().next();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCClose.close(pstmt, conn);
			}
			return flag;
		}
/**
 * 		
 * @param signupVO
 * @return signVO
 */
		//회원가입
//		
//		public SignupVO signup(SignupVO signupVO) {
//			
//			SignupVO signVO = null;
//			
//			StringBuilder sql = new StringBuilder();
//			sql.append("select id, password, type ");
//			sql.append("    from mbti_member ");
//			sql.append(" where id = ? and password = ? ");
//			try (
//				Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//			){
//				pstmt.setString(1, signupVO.getId());
//				pstmt.setString(2, signupVO.getPwd());
//				
//				ResultSet rs = pstmt.executeQuery();
//				if(rs.next()) {
//					signVO = new SignupVO();
//					signVO.setId(rs.getString("id"));
//					signVO.setPwd(rs.getString("password")); 
//				}
//			}catch (Exception e) {
//			e.printStackTrace();
//			}
//			return signVO;
//		}
		
	/**
	 * 회원가입
	 * */
	  public void signup(MemberVO sign) {
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		
		  
	  
		  try { 
			  conn = new ConnectionFactory().getConnection(); 
			  StringBuilder sql = new StringBuilder();
			  
			  sql.append(" insert into mbti_member(no,id,password,name, my_mbti, like_mbti,dislike_mbti, addr_x, addr_y) ");
			  sql.append(" values(seq_mbti_member_no.nextval,?,?,?,?,?,?,?,?) ");
			  
			  pstmt = conn.prepareStatement(sql.toString()); 
			  
			  pstmt.setString(1, sign.getId());
			  pstmt.setString(2, sign.getPassword());
			  pstmt.setString(3, sign.getName()); 
			  pstmt.setString(4, sign.getMymbti()); 
			  pstmt.setString(5, sign.getLikembti()); 
			  pstmt.setString(6, sign.getDislikembti()); 
			  pstmt.setString(7, sign.getAddrx()); 
			  pstmt.setString(8, sign.getAddry()); 
			  
			 
			  pstmt.executeUpdate(); 
			  
			  } catch (Exception e) { 
				  e.printStackTrace(); 
			  } finally { 
				JDBCClose.close(pstmt, conn); 
			  } 
		  		
			  
			  }
}