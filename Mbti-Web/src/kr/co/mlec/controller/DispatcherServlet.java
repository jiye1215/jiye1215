package kr.co.mlec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet { // DispatcherServlet는 대표전화 , Servlet을 인식시켜주기 위해 http로 상속. 
	
	private HandlerMapping mappings = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException{
		
		String propLoc = config.getInitParameter("propLocation");
		
		
		mappings = new HandlerMapping(propLoc);
	}
	
	@Override // 요청이 들어오면 처리하기위해 만들어줌
	   public void service(HttpServletRequest request, HttpServletResponse response)
	                       throws ServletException, IOException{
		
		  String uri = request.getRequestURI();
		  String context = request.getContextPath(); // getContextPath가 Servers-modules-path/Mission-Web-MVC을 가지고있음
		  uri = uri.substring(context.length()); // substring :문자열을 추출 
	      System.out.println("요청 URI : " + uri);
	     // System.out.println("contextPath : " + context);
	      
		  try {
		  //String callPage = ""; // switch문 밖에서도 사용하기 위해 밖으로 빼줌
	      // Controller control = null;
	      
			  /*
			   * switch(uri) {
			  		case "/board/list.do" : 
			  			control = new BoardListController();
			  			break;
			  			
			  		case "/board/writeForm.do":
			  			control = new BoardWriteFormController();
			  			break;
			  		}
			    	
			   */
		 // HandlerMapping mappings = new HandlerMapping();
	      Controller control = mappings.getController(uri);
		  
	      String callPage = control.handleRequest(request, response); // forward 시킬 주소를 알려줘서 callPage에 저장 시킴
	      
	      // forward or sendRedirect 선택
		 if(callPage.startsWith("redirect:")) {
			 callPage = callPage.substring("redirect:".length());
			 response.sendRedirect(request.getContextPath() + callPage);
		 } else {
		      RequestDispatcher dispatcher = request.getRequestDispatcher(callPage);
		      dispatcher.forward(request, response); // 그래야 요청 날라온 파라미터를 분석할 수 있음
			  }
		  }
		  catch(Exception e) {
			  e.printStackTrace();
			  throw new ServletException(e);
		  }
		}   
}
