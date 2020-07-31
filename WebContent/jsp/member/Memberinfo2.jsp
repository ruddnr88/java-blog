<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script>
	function ModiyfyPrivateForm_submit(form) {
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
		if (form.loginPw.value != form.loginPwConfirm.value) {
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPwConfirm.focus();
			return;
		}

	}
</script>
<!-- 메인컨텐츠 -->
<div class="con info-con">
	<h1>회원정보</h1>
	<form action="doModifyForPrivate" method="POST" class="sign-form form1"
		onsubmit="ModiyfyPrivateForm_submit(this); return false;">
		<div class="member_info">
			<div class="a">아이디 : ${loginedMember.loginId}</div>
			<div class="form-row">
				<div class="label">비밀번호</div>
				<div class="input">
					<input name="loginPw" class="box-form" type="password"
						placeholder="비밀번호를 입력해주세요." />
				</div>
			</div>
			<div class="form-row">
				<div class="label">비밀번호 확인</div>
				<div class="input">
					<input name="loginPwConfirm" class="box-form" type="password"
						placeholder="비밀번호를 다시 입력해주세요." />
				</div>
			</div>
			<div class="a">이름 : ${loginedMember.name}</div>
			<div class="a">닉네임 : ${loginedMember.nickname}</div>
			<div class="a">가입날짜 : ${loginedMember.regDate}</div>
			<div class="a">이메일 : ${loginedMember.email}</div>
		</div>
	</form>
	<div onclick="if ( confirm('정말 탈퇴하시겠습니까?') == false ) return false;"
		class="butt">
		<a href="dodelete?id=${loginedMember.id}">회원탈퇴</a>
	</div>
	<div class="butt">
		<a href="../member/Mailing"
			onclick="window.open(this.href, '_blank', 'width=450px,height=500px,toolbars=no,scrollbars=no'); return false;">문의하기</a>
	</div>

</div>

<%@ include file="/jsp/part/foot.jspf"%>
