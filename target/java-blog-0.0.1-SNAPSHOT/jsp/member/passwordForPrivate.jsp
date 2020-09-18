<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>

<script>
	function submitLoginForm(form) {
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length == 0) {
			alert('로그인 비번을 입력해주세요.');
			form.loginPw.focus();
			return;
		}
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.submit();
	}
</script>
<!-- 비밀번호확인 메인컨텐츠 -->
<div class="con sign-form-box">
	<h1>비밀번호 확인</h1>
	<form action="dopasswordForPrivate" method="POST" class="sign-form form1"
		onsubmit="submitLoginForm(this); return false;">
		<input type="hidden" name="loginPwReal" />
		<div class="form-row">
			<div class="label">PW</div>
			<div class="input box-form">
				<input name="loginPw" class="box-form" type="password" placeholder="비밀번호를 입력해주세요." />
		</div>
		</div>

		<div class="con_butt sign_butt" style="margin-top: 50px; width:100%;">
			<div class="input">
				<input type="submit" style="right:18%;" value="확인" class="login_but lb_2"/>
				<a href="${pageContext.request.contextPath}/s/home/main" class="login_but lb_3">취소</a>
			</div>
		</div>

	</form>
</div>
<%@ include file="/jsp/part/foot.jspf"%>
