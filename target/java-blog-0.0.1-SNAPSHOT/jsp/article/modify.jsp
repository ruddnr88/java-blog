<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="게시물 수정"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>

<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 어바웃 미메인컨텐츠 -->
<div class="con write-form-box">
	<h1>글 수정하기</h1>
	<form action="doModify" name="update" method="POST"
		class="write-form form1"
		onsubmit="submitWriteForm(this); return false;">
		<input type="hidden" name="id" value="${article.id}">
		 <input	type="hidden" name="body">
		<div class="form-row">
			<div class="label">카테고리</div>
			<div class="input" style="text-align: left;">
				<select name="cateItemId">
					<c:forEach items="${cateItems}" var="cateItem">
						<option ${article.cateItemId == cateItem.id ? 'selected' : ''} value="${cateItem.id}">${cateItem.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-row">

			<div class="label">제목</div>
			<div class="input">
				<input name="title" type="text" value="${article.title}" />
			</div>

		</div>
		<div class="form-row">
			<div class="label">내용</div>
			<div class="input">
				<script type="text/x-template">${article.bodyForXTemplate}</script>
				<div class="toast-editor" style="text-align: left;"></div>
			</div>
		</div>

		<div class="con_butt" style="margin-top: 10px;">
			<div class="input">
				<input onclick="if ( confirm('수정하시겠습니까?') == false ) return false;" type="submit" value="수정" class="login_but input_but" /> <a
					class="login_but lb_3" onclick="if ( confirm('취소하시겠습니까?') == false ) return false;"href="list">취소</a>
			</div>
		</div>
	</form>
</div>
<script>
	var submitModifyFormDone = false;
	function submitWriteForm(form) {
		if (submitModifyFormDone) {
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
	}
</script>
<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>
<%@ include file="/jsp/part/foot.jspf"%>
