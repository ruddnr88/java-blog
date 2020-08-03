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
			<button class="tab_menu_btn" type="button">비밀번호찾기</button>
		</div>
		<div class="tab_box_con">
			<div class="tab_box on">
				<form action="doFindId" method="POST" class="sign-form1 form1"
					onsubmit="submitFindidForm(this); return false;">
					<input type="hidden" name="loginPwReal" />
					<div class="form-row">
						<div class="label">이름</div>
						<div class="input box-form">
							<input name="name" autofocus class="box-form" type="text"
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
							<input type="submit" value="확인" class="login_but lb_2" /> <a
								href="${pageContext.request.contextPath}/s/home/main"
								class="login_but lb_3">취소</a>
						</div>
					</div>
				</form>

			</div>
			<div class="tab_box">
				<form action="doFindPw" method="POST" class="sign-form1 form1"
					onsubmit="submitFindPwForm(this); return false;">
					<input type="hidden" name="loginPwReal" />
					<div class="form-row">
						<div class="label">아이디</div>
						<div class="input box-form">
							<input name="loginId" class="box-form" type="text"
								placeholder="아이디을 입력해주세요." />
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
		</div>
	</div>
</div>
<script>
	$('.tab_menu_btn').on('click', function() {
		//버튼 색 제거,추가
		$('.tab_menu_btn').removeClass('on');
		$(this).addClass('on')

		//컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
		var idx = $('.tab_menu_btn').index(this);

		$('.tab_box').hide();
		$('.tab_box').eq(idx).show();
	});

	function submitFindidForm(form) {
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

		form.submit();
	}
	function submitFindPwForm(form) {
		form.loginId.value = form.namloginIde.value.trim();
		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}
		form.email.value = form.email.value.trim();
		if (form.email.value.length == 0) {
			alert('메일을 입력해주세요.');
			form.email.focus();
			return;
		}

		form.submit();
	}
</script>

<%@ include file="/jsp/part/foot.jspf"%>
