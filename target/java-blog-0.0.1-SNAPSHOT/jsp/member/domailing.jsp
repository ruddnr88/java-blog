<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>

<style>
h1 {color:#6EAEA3;}
.body_bar { width: 400px; height: 300px; box-sizing: border-box;}
.title_bar {box-sizing: border-box; width:400px; height: 35px; margin-bottom: 20px;}
.input {text-align: center;}
.con_butt  input { padding: 10px 25px;
    background-color: #C2E2DD;
    color: #6EAEA3;
    border: 1px solid #6EAEA3;}
</style>
<!-- 어바웃 미메인컨텐츠 -->
<h1>운영자 문의하기</h1>
<form action="doMailing" name="update" method="POST"
	onsubmit="submitForm(this); return false;">
	<input type="hidden" name="email" value="${member.email}">
	<input type="text" name="title" class="title_bar" placeholder="제목을 입력하세요.">
	<textarea name="body" class="body_bar"  placeholder="내용을 입력하세요.(이름수정,닉네임수정,메일수정 원할시)"></textarea>
	<div class="con_butt" style="margin-top: 20px;">
		<div class="input">
			<input type="submit" value="보내기" /> <input type="reset" onClick='window.close()' value="취소" />
		</div>
	</div>
</form>
<script>
	function submitForm(form) {
		form.body.value = form.body.value.trim();
		if (form.body.value.length == 0) {
			alert('내용을 입력해주세요.');
			form.body.focus();
			return;
		}

		form.submit();
	}
	document.form_chk.submit();
	window.open("about:blank", "_self").close();
</script>


