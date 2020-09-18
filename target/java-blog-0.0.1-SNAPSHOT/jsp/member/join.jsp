<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>

<script>
	var JoinForm__validLoginId = '';
	function JoinForm__submit(form) {
		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		if (form.loginId.value != JoinForm__validLoginId) {
			alert('다른 아이디를 입력해주세요.');
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
		if (form.loginPw.value !=form.loginPwConfirm.value) {
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPwConfirm.focus();
			return;
		}
		form.name.value = form.name.value.trim();
		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return;
		}
		form.email.value = form.email.value.trim();
		if (form.email.value.length == 0) {
			alert('메일을 입력해주세요.');
			form.email.focus();
			return;
		}
		form.nickname.value = form.nickname.value.trim();
		if (form.nickname.value.length == 0) {
			alert('닉네임 입력해주세요.');
			form.nickname.focus();
			return;
		}
		
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';

		form.submit();
	}
	function JoinForm__checkLoginIdDup(input) {
		var form = input.form;
		form.loginId.value = form.loginId.value.trim();
		
		if (form.loginId.value.length == 0) {
			return;
		}
		
		$.get('getLoginIdDup', {
			loginId : form.loginId.value
		}, function(data) {
			var $message = $(form.loginId).next();
			
			 if( data.resultCode.substr(0,2) == 'S-') {
				 $message.empty().append('<div class="loginDup" style="color:green;">' + data.msg + '</div>');
				 JoinForm__validLoginId = data.loginId;
			} else {
				 $message.empty().append('<div class="loginDup" style="color:red;">' + data.msg + '</div>');
				 JoinForm__validLoginId = '';
			}
		}, 'json');
	}
</script>
<!-- 회원가입 컨텐츠 -->
<div class="con sign-form-box">
	<h1>회원가입</h1>
	<form action="doJoin" method="POST" class="sign-form form1"
		onsubmit="JoinForm__submit(this); return false;">
		<input type="hidden" name="loginPwReal" />
		<div class="form-row">
			<div class="label">로그인ID</div>
			<div class="input">
				<input onkeyup="JoinForm__checkLoginIdDup(this);" class="box-form" name="loginId"
					type="text" placeholder="로그인 아이디를 입력해주세요." />
				<div class="message-msg"></div>
				
			</div>
		</div>
	
		<div class="form-row">
			<div class="label">비밀번호</div>
			<div class="input">
				<input name="loginPw" class="box-form"type="password" placeholder="비밀번호를 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label" >비밀번호 확인</div>
			<div class="input">
				<input name="loginPwConfirm"  class="box-form" type="password"
					placeholder="비밀번호를 다시 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">이름</div>
			<div class="input">
				<input name="name" type="text" class="box-form" placeholder="이름을 입력해주세요." />
			</div>
		</div>
		
		<div class="form-row">
			<div class="label">닉네임</div>
			<div class="input">
				<input name="nickname" type="text" class="box-form" placeholder="닉네임을 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">E-Mail</div>
			<div class="input">
				<input name="email" type="email" class="box-form" placeholder="e-mail을 입력해주세요" />
			</div>
		</div>
		<div class="con_butt sign_butt" style="margin-top: 50px;">
			<div class="input">
				<input type="submit" value="확인" class="login_but lb_1" /><a
					class="login_but lb_3"
					href="../home/main">취소</a>
			</div>
		</div>

	</form>
</div>

<%@ include file="/jsp/part/foot.jspf"%>
