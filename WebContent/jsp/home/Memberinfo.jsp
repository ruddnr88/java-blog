<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>
<%
	Member member = (Member) request.getAttribute("member");
%>

<!-- 메인컨텐츠 -->
<div class="con info-con">
	<h1>회원정보</h1>
	<ul class="member_info">
		<li>가입번호 : &nbsp <%=loginedMember.getId()%></li>
		<li>아이디 :&nbsp<%=loginedMember.getLoginId()%></li>
		<li>이름 : &nbsp<%=loginedMember.getName()%></li>
		<li>닉네임 :&nbsp<%=loginedMember.getNickname()%></li>
		<li>가입날짜 :&nbsp<%=loginedMember.getRegDate()%></li>
		<li>이메일 :&nbsp<%=loginedMember.getEmail()%></li>

	</ul>


</div>



<%@ include file="/jsp/part/foot.jspf"%>
