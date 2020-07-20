<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>
<%
	Member member = (Member) request.getAttribute("member");
%>

<!-- 메인컨텐츠 -->
<div class="con sns-con">
	<h1>회원정보</h1>
	<ul>
		<li>가입번호 :<%=loginedMember.getId()%></li>
		<li>아이디 :<%=loginedMember.getLoginId()%></li>
		<li>이름 : <%=loginedMember.getName()%></li>
		<li>닉네임 :<%=loginedMember.getNickname()%></li>
		<li>가입날짜 :<%=loginedMember.getRegDate()%></li>
		<li>이메일 :<%=loginedMember.getEmail()%></li>

	</ul>


</div>



<%@ include file="/jsp/part/foot.jspf"%>
