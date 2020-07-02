
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<!-- 어바웃 미메인컨텐츠 -->
<div class="con article ">
	<h1>글 작성하기</h1>
	<div id="editor1" class="write_editor"></div>

	<div class="con_butt">
		<div class="list-button butt">
			<a href="${pageContext.request.contextPath}/s/article/list">목록</a>
		</div>
		<div class="de-mo_butt">
			<div class="doit-button butt">
				<a href="#">등록</a>
			</div>
			<div class="cencle-button butt">
				<a href="#">취소</a>
			</div>

		</div>

	</div>
	<script>
		var editor1 = new toastui.Editor({
			el : document.querySelector('#editor1'),
			height : '600px',
			initialEditType : 'markdown',
			previewStyle : 'vertical',
			initialValue : "# 안녕",
			plugins : [ toastui.Editor.plugin.codeSyntaxHighlight ]
		});
	</script>


</div>
<%@ include file="/jsp/part/foot.jspf"%>