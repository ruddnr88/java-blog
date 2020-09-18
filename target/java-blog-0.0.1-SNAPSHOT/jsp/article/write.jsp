<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="게시물 작성"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>
<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 글쓰기 메인컨텐츠 -->
<div class="con write-form-box">
	<h1>글 작성하기</h1>
	<form action="doWrite" method="POST" class="write-form form1"
		onsubmit="submitWriteForm(this); return false;">
		<input type="hidden" name="body">
		<div class="form-row">
			<div class="label">카테고리</div>
			<div class="input" style="text-align: left;">
				<select name="cateItemId">
					<c:forEach items="${cateItems}" var="cateItem">
						<option value="${cateItem.id}">${cateItem.name}</option>
					</c:forEach>

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
				<script type="text/x-template"></script>
				<div class="toast-editor" style="text-align: left;"></div>
			</div>
		</div>
		<div class="con_butt" style="margin-top: 10px;">
			<div class="input">
				<input type="submit" value="전송" class="login_but input_but" /> <a
					class="login_but lb_3" onClick="cencle()">취소</a>
			</div>
		</div>

	</form>
</div>
<script>
	var submitWriteFormDone = false;

	function cencle() {
		if (confirm("취소하시겠습니까?")) {
			location.href = "list"
		} else {
			alert('아님말고');
		}
	}
	function submitWriteForm(form) {
		if (submitWriteFormDone) {
			alert('처리중입니다.');
			return;
		}
		form.title.value = form.title.value.trim();
		if (form.title.value.length == 0) {
			alert('제목을 입력해주세요.');
			form.title.focus();
			return;
		}
		var editor = $(form).find('.toast-editor').data('data-toast-editor');
		var body = editor.getMarkdown();
		body = body.trim();
		if (body.length == 0) {
			alert('내용을 입력해주세요.');
			editor.focus();
			return false;
		}
		form.body.value = body;
		
		form.submit();
		submitWriteFormDone = true;
	}
</script>
<%@ include file="/jsp/part/foot.jspf"%>
