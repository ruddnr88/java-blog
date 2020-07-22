<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>

<!-- 어바웃 미메인컨텐츠 -->
<div class="con sign-form-box">
	<h1>아이디/비밀번호찾기</h1>
	<div class="tab_wrap">
		<div class="tab_menu">
			<button class="tab_menu_btn on" type="button">아이디찾기</button>
			<button class="tab_menu_btn on" type="button">비밀번호찾기</button>
		</div>
		<div class="tab_box_con">
			<div class="tab_box">
			
			</div>
		
		</div>
		
	</div>
	<form action="doFindId" method="POST" class="sign-form form1"
			onsubmit="submitFindidForm(this); return false;">
			<input type="hidden" name="loginPwReal" />
			<div class="form-row">
				<div class="label">이름</div>
				<div class="input box-form">
					<input name="name" class="box-form" type="text"
						placeholder="이름을 입력해주세요." />
				</div>
			</div>
			<div class="form-row">
				<div class="label">이메일</div>
				<div class="input box-form">
					<input name="email" class="box-form" type="email"
						placeholder="이메일를 입력해주세요." />
				</div>
			</div>

			<div class="con_butt sign_butt"
				style="margin-top: 50px; width: 100%;">
				<div class="input">
					<input type="submit" value="메일전송" class="login_but lb_2" /> <a
						href="${pageContext.request.contextPath}/s/home/main"
						class="login_but lb_3">취소</a>
				</div>
			</div>

		</form>




</div>
<script>
	function submitFindidForm(form) {
		form.name.value = form.name.value.trim();
		if (form.name.value.length == 0) {
			alert('아이디를 입력해주세요.');
			form.name.focus();
			return;
		}
		form.email.value = form.email.value.trim();
		if (form.email.value.length == 0) {
			alert('메일을 입력해주세요.');
			form.email.focus();
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		form.submit();
	}
</script>

<%@ include file="/jsp/part/foot.jspf"%>
