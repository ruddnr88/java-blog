<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<CateItem> cateItems = (List<CateItem>) request.getAttribute("cateItems");
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	Article article = (Article) request.getAttribute("article");
	String cateItemName = (String) request.getAttribute("cateItemName");
	
%>
<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">
<!-- 하이라이트 라이브러리, 언어 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>
<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<!-- 어바웃 미메인컨텐츠 -->
<div class="con write-form-box">
	<h1>글 수정하기</h1>
	<form action="doModify" name="update" method="POST"
		class="write-form form1"
		onsubmit="submitWriteForm(this); return false;">
		<input type="hidden" name="id" value="<%=article.getId()%>"> <input
			type="hidden" name="body">
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
				<input name="title" type="text" value="<%=article.getTitle()%>" />
			</div>

		</div>
		<div class="form-row">
			<div class="label">내용</div>
			<div class="input">
				<script type="text/x-template" id="origin1"><%=article.getBodyForXTemplate()%></script>
				<div id="editor1" style="text-align: left;"></div>
			</div>
		</div>

		<div class="con_butt" style="margin-top: 10px;">
			<div class="input">
				<input type="submit" value="수정" class="login_but input_but" /> <a
					class="login_but lb_3" href="list">취소</a>
			</div>
		</div>
	</form>
</div>
<script>
	function check() {

	}
	function submitWriteForm(form) {

		form.title.value = form.title.value.trim();
		if (form.title.value.length == 0) {
			alert('제목을 입력해주세요.');
			form.title.focus();
			return;
		}
		var source = editor1.getMarkdown().trim();
		if (source.length == 0) {
			alert('내용을 입력해주세요.');
			editor1.focus();
			return;
		}
		form.body.value = source;
		form.submit();
	}
</script>
<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>
<%@ include file="/jsp/part/foot.jspf"%>
