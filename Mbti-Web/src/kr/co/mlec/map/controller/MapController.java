package kr.co.mlec.map.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.mlec.controller.Controller;
import kr.co.mlec.member.service.MapService;
import kr.co.mlec.member.vo.LoginVO;
import kr.co.mlec.member.vo.MemberVO;

public class MapController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String uri = "";
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
	
		
		LoginVO vo = (LoginVO)session.getAttribute("userVO");
		
		if(vo != null) {
		
		String id = vo.getId();
		
		System.out.println("id : " + id);
		
		
		MapService service = new MapService();
		
		//내id로 검색된 지도정보리스트
		MemberVO mapVO = service.map(id);
		System.out.println(mapVO);
		
		//회원전체 지도정보리스트
		List<MemberVO> allmaplist = service.selectAllMapList(id);
		
		System.out.println("id : " + id);
		System.out.println("allmaplist : "+ allmaplist);
		
		request.setAttribute("mapVO",mapVO);
		request.setAttribute("allmaplist", allmaplist);
		
		
		uri =  "/jsp/map/mbtiMap.jsp";
		}
		else {
			
			uri = "redirect:/login.do";
			
		}
		return uri;
		
	}

}
