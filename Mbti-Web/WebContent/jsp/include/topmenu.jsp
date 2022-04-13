<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/topmenu.css">

    
         <a href="${ pageContext.request.contextPath }/index.jsp">
            <img id="logo" src= "${ pageContext.request.contextPath }/resources/images/logo3.png" alt=""/>
         </a>
      
      <nav>
         <span><a href="${ pageContext.request.contextPath }/board/list.do">자유게시판</a></span>
         <span><a href="${ pageContext.request.contextPath }/board/writeForm.do">새글등록</a></span>
          <span><a href="${pageContext.request.contextPath }/map.do">MBTI지도보기</a></span>
          <c:if test="${ empty userVO }">
         <span><a href="${ pageContext.request.contextPath }/login.do">로그인</a></span>
         <span><a href="${ pageContext.request.contextPath }/member/signup.do">회원가입</a></span>
         </c:if>   
         <c:if test="${ not empty userVO }">
         <span><a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a></span>
         </c:if>
         <c:if test="${ userVO.type eq 'S' }">
         <span><a href="${ pageContext.request.contextPath }/member/memberList.do">관리자페이지</a></span>
         </c:if>
      </nav>
    