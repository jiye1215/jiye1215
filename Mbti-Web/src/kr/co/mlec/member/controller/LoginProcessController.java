package kr.co.mlec.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.controller.Controller;
import kr.co.mlec.member.service.LoginService;
import kr.co.mlec.member.vo.LoginVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//인코딩 먼저
		request.setCharacterEncoding("utf-8");
		//날아오는 id와 pw 추출
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		LoginVO loginVO = new LoginVO(id, password);
		
		LoginService service = new LoginService();
		LoginVO userVO = service.login(loginVO);
		
		String url = "";
		if(userVO == null) {
			//로그인 실패
			//url = request.getContextPath() + "/login.do";
			
			url = "/login.do";
			
		}else {
			//로그인 성공
			//url = request.getContextPath(); dispatcher에서 붙여준다.
			url = "";
			//session.setAttribute("userVO",userVO); 세션객체 자바코드라서 모른다.
			//request객체를 통해서 session객체 얻어오는 함수, 자바는 request개체와 response객체밖에 모른다.
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			//이렇게 하면 session 객체 받아서 [user님으로 로그인중... 이라고 뜬다]
			
		}
		
		return "redirect:"+url;
	}

	
}
