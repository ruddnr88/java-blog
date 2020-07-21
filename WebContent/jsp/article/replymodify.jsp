<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.ArticleReply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArticleReply articleReplie = (ArticleReply) request.getAttribute("articleReplie");
%>
<style>
h1 {color:#6EAEA3;}
.body_bar { width: 400px; height: 35px; box-sizing: border-box;}
.input {text-align: center;}
.con_butt  input { padding: 10px 25px;
    background-color: #C2E2DD;
    color: #6EAEA3;
    border: 1px solid #6EAEA3;}
</style>
<!-- 어바웃 미메인컨텐츠 -->
<h1>댓글 수정하기</h1>
<form action="doModifyReply" name="update" method="POST"
	onsubmit="submitForm(this); return false;">
	<input type="hidden" name="id" value="<%=articleReplie.getId()%>">
	<input name="body" type="text" class="body_bar" value="<%=articleReplie.getBody()%>" />
	<div class="con_butt" style="margin-top: 20px;">
		<div class="input">
			<input type="submit" value="수정" /> <input type="reset" onClick='window.close()' value="취소" />
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


