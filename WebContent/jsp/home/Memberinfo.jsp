<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>
<!-- 메인컨텐츠 -->
<div class="con info-con">
	<h1>회원정보</h1>
	<ul class="member_info">
		<li>가입번호 : &nbsp ${loginedMember.id}</li>
		<li>아이디 :&nbsp${loginedMember.loginId}</li>
		<li>이름 : &nbsp${loginedMember.name}</li>
		<li>닉네임 :&nbsp${loginedMember.nickname}</li>
		<li>가입날짜 :&nbsp${loginedMember.regDate}</li>
		<li>이메일 :&nbsp${loginedMember.email}</li>

	</ul>
	
	<div class="butt"><a href="dodelete?id=${loginedMember.id}">회원탈퇴</a></div>

</div>



<%@ include file="/jsp/part/foot.jspf"%>
