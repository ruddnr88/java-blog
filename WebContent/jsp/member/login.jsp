<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>

<!-- 어바웃 미메인컨텐츠 -->
<div class="con sign-form-box">
	<h1>LOGIN</h1>
	<form action="doLogin" method="POST" class="sign-form form1"
		onsubmit="submitLoginForm(this); return false;">
		<div class="form-row">
			<div class="label">ID</div>
			<div class="input">
				<input name="loginId" type="text" placeholder="아이디를 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">PW</div>
			<div class="input">
				<input name="loginPw" type="password" placeholder="비밀번호를 입력해주세요." />
			</div>
		</div>

		<div class="con_butt sign_butt" style="margin-top: 50px; width:100%;">
			<div class="input">
				<a class="login_but lb_1" href="${pageContext.request.contextPath}/s/member/join">회원가입</a>
				<input type="submit" value="로그인" class="login_but lb_2"/>
				<a href="${pageContext.request.contextPath}/s/home/main" class="login_but lb_3">취소</a>
			</div>
		</div>

	</form>
</div>
<script>
	function submitLoginForm(form) {
		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return;
		}

		form.submit();
	}
</script>

<%@ include file="/jsp/part/foot.jspf"%>
