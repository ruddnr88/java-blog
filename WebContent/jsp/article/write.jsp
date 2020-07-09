<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<CateItem> cateItems = (List<CateItem>) request.getAttribute("cateItems");
%>

<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>
<style>
</style>
<!-- 어바웃 미메인컨텐츠 -->
<div class="con write-form-box">
	<h1>글 작성하기</h1>
	<form action="doWrite" method="POST" class="write-form form1" onsubmit="submitWriteForm(this); return false;">
		<div class="form-row">
			<div class="label">카테고리</div>
			<div class="input" style="text-align: left;">
				<select name="cateItemId">
					<%
						for (CateItem cateItem : cateItems) {
					%>
					<option value="<%=cateItem.getId()%>"><%=cateItem.getName()%></option>
					<%
						}
					%>

				</select>
			</div>
		</div>
		<div class="form-row">
			<div class="label">제목</div>
			<div class="input">
				<input name="title" type="text" placeholder="제목을 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">내용</div>
			<div class="input">
				<textarea name="body" placeholder="내용을 입력해주세요."></textarea>
			</div>
		</div>
		<div class="con_butt" style="margin-top: 10px;">
			<div class="input">
				<input type="submit" value="전송" class="button_css" /> <a
					class="button_css" href="list">취소</a>
			</div>
		</div>

	</form>
</div>
<script>
	function submitWriteForm(form) {
		form.title.value = form.title.value.trim();
		if (form.title.value.length == 0) {
			alert('제목을 입력해주세요.');
			form.title.focus();
		}
		form.body.value = form.body.value.trim();
		if (form.body.value.length == 0) {
			alert('내용을 입력해주세요.');
			form.body.focus();
		}
	}
</script>
<%@ include file="/jsp/part/foot.jspf"%>
