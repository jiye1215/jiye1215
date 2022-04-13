package kr.co.mlec.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mlec.controller.Controller;
import kr.co.mlec.member.dao.SignupDAO;
import kr.co.mlec.member.service.SignupService;
import kr.co.mlec.member.vo.MemberVO;


public class SignupProcessController implements Controller {

   @Override
   public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      //인코딩 먼저
      request.setCharacterEncoding("utf-8");
      
      String id = request.getParameter("id");
      String password = request.getParameter("pwd");
      String name = request.getParameter("name");
      String mymbti = request.getParameter("mymbti");
      String likembti = request.getParameter("likembti");
      String dislikembti = request.getParameter("dislikembti");
      String addrx = request.getParameter("find_lat");//위도
      String addry = request.getParameter("find_lng");//경도
    
      
      MemberVO signupVO = new MemberVO();
      signupVO.setId(id);
      signupVO.setPassword(password);
      signupVO.setName(name);
      signupVO.setMymbti(mymbti);
      signupVO.setLikembti(likembti);
      signupVO.setDislikembti(dislikembti);
      signupVO.setAddrx(addrx);
      signupVO.setAddry(addry);
      
      
      
	  SignupService service = new SignupService();
	  service.signup(signupVO);
	  
	  
	  
	  /*
	  if(signupVO == null) {
		  msg = "회원가입에 실패하셨습니다";
		  location = "signup.jsp";
		  
	  } else {
		  msg = "회원가입이 완료되었습니다";
		  
	  }*/
		  
		  return "redirect:/login.do";
	  
		 
	  /*
	  boolean result = dao.insertMember(signupVO);
	  	
	  	String msg = "";
	  	String location ="mbtiSignup.jsp";
	  	if(result){
	  		msg="회원가입에 실패 하였습니다";
	  		location ="mbtiSignup.jsp";
	  	} else {
	  		msg = "회원가입이 완료되었습니다";
	  	}
	  		System.out.print(msg);
	      return "/jsp/login/loginForm.jsp";
	   }
	   */
   }
}