<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>
<style>
</style>
<!-- 어바웃 미메인컨텐츠 -->
<div class="con sign-form-box">
	<h1>회원가입</h1>
	<form action="doJoin" method="POST" class="sign-form form1"
		onsubmit="submitJoinForm(this); return false;">
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
		<div class="form-row">
			<div class="label">PW 확인</div>
			<div class="input">
				<input name="loginPwConfirm" type="password"
					placeholder="비밀번호를 다시 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">이름</div>
			<div class="input">
				<input name="name" type="text" placeholder="이름을 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">닉네임</div>
			<div class="input">
				<input name="nickname" type="text" placeholder="닉네임을 입력해주세요." />
			</div>
		</div>
		<div class="con_butt sign_butt" style="margin-top: 50px;">
			<div class="input">
				<input type="submit" value="확인" class="login_but lb_1" /><a
					class="login_but lb_3"
					href="${pageContext.request.contextPath}/s/home/main">취소</a>
			</div>
		</div>

	</form>
</div>
<script>
	function submitJoinForm(form) {
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
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
		if (form.loginPwConfirm.value.length == 0) {
			alert('비밀번호 확인을 입력해주세요.');
			form.loginPwConfirm.focus();
			return;
		}
		form.name.value = form.name.value.trim();
		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return;
		}
		form.nickname.value = form.nickname.value.trim();
		if (form.nickname.value.length == 0) {
			alert('닉네임 입력해주세요.');
			form.nickname.focus();
			return;
		}

		form.submit();
	}
</script>

<%@ include file="/jsp/part/foot.jspf"%>
