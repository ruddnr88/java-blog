<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	Article article = (Article) request.getAttribute("article");
%>

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
	src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<!-- 어바웃 미메인컨텐츠 -->
<div class="con article">
	<h1 style="color:#6EAEA3;"><%=article.getTitle()%></h1>


	<table class="table detail-table">
		<colgroup>
			<col width="25%">
			<col width="75%">
		</colgroup>
		<tbody>
			<tr class="detail">
				<th>카테고리</th>
				<td><%=article.getcateItemId()%></td>
			</tr>
			<tr class="detail">
				<th>번호</th>
				<td><%=article.getId()%></td>
			</tr>
			<tr class="detail">
				<th>작성자</th>
				<td><%=article.getExtra().get("writer")%></td>
			</tr>
			<tr class="detail">
				<th>등록날짜</th>
				<td><%=article.getRegDate()%></td>
			</tr>
			<tr class="detail">
				<th>수정날짜</th>
				<td><%=article.getUpdateDate()%></td>
			</tr>
			<tr class="detail">
				<td colspan="2"><div id="origin1"><%=article.getBody()%></div>
					<div id="viewer1"></div></td>

			</tr>

			<!-- 두번째 줄 끝 -->

		</tbody>


	</table>
	<div class="con_butt">
		
		<div class="list-button butt">
			<a href="./list?cateItemId=<%=article.getcateItemId()%>">목록</a>
		</div>
	
		<div class="de-mo_butt">
			<div class="delete-button butt">
				<a href="#">수정</a>
			</div>
			<div class="modify-button butt">
				<a href="#">삭제</a>
			</div>

		</div>

	</div>
	<script>
		var editor1__initialValue = $('#origin1').html();
		var editor1 = new toastui.Editor({
			el : document.querySelector('#viewer1'),
			height : '600px',
			initialValue : editor1__initialValue,
			viewer : true,
			plugins : [ toastui.Editor.plugin.codeSyntaxHighlight ]
		});
	</script>


</div>
<%@ include file="/jsp/part/foot.jspf"%>
