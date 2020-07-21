<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.ArticleReply"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<ArticleReply> articleReplies = (List<ArticleReply>) request.getAttribute("articleReplies");
	Article article = (Article) request.getAttribute("article");
	String cateItemName = (String) request.getAttribute("cateItemName");
	int totalPage = (int) request.getAttribute("totalPage");
	int paramPage = (int) request.getAttribute("page");
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
	<h1 style="color: #6EAEA3;"><%=article.getTitle()%></h1>


	<table class="table detail-table">
		<colgroup>
			<col width="25%">
			<col width="75%">
		</colgroup>
		<tbody>
			<tr class="detail">
				<th>카테고리</th>
				<td>[<%=article.getCateItemId()%>]<%=cateItemName%></td>
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
				<th>조회수</th>
				<td><%=article.getHit()%></td>
			</tr>
			<tr class="detail">
				<td colspan="2"><script type="text/x-template" id="origin1"><%=article.getBodyForXTemplate()%></script>
					<div id="viewer1"></div></td>

			</tr>

			<!-- 두번째 줄 끝 -->

		</tbody>


	</table>

	<div class="detail_butt ">

		<div class="list-button butt">
			<a href="./list?cateItemId=<%=article.getCateItemId()%>">목록</a>
		</div>
		
		<%if (loginedMemberId == article.getMemberId()) { %>

		<div class="de-mo_butt">
			<div class="delete-button butt">
				<a
					href="modify?id=<%=article.getId()%>&cateItemId=<%=article.getCateItemId()%>">수정</a>
			</div>
			<div class="modify-button butt">

				<a href="delete?id=<%=article.getId()%>">삭제</a>
			</div>

		</div>
		<%} %>

	</div>

	<form action="doReply" method="POST" class="form1 reply_con"
		onsubmit="submitReplyForm(this); return false;">

		<div class="reply_box flex">
			<div class="label inline-block name_col">댓 글</div>
			<div class="inline-block replybody">
				<input type="hidden" name="articleId" value="${param.id}" /> <input
					name="body" type="text" placeholder="댓글을 작성해주세요." />
			</div>
			<div style="margin-top: 10px;">
				<div class="input">
					<input type="submit" value="전송" class="reply_bnt" />
				</div>
			</div>
		</div>
	</form>
	<table class ="re_table">
		<colgroup>
			<col width="5%">
			<col class="name_col" width="12%">
			<col width="65%">
			<col width="20%">
		</colgroup>
	
		<thead>
			<tr>
				<th>No.</th>
				<th>닉네임</th>
				<th style="font-weight: bold; margin:10px;">COMMENTS (<span style="color:red;">${replyCount}</span>)</th>
				<th class="mo_modi_date">날짜</th>
			</tr>
		</thead>
		<tbody>


			<%
				for (ArticleReply articleReplie : articleReplies) {
			%>
			<tr class="noti">
				<td><%=articleReplie.getId()%></td>
				<td><%=articleReplie.getExtra().get("writer")%></td>
				
				<td class="text-align-left">
				<%=articleReplie.getBody()%> &nbsp;
				<%if (loginedMemberId == articleReplie.getMemberId()) { %>
				<a href="dodelReply?id=<%=articleReplie.getId()%>">
					<i class="fas fa-trash-alt"></i></a>
				<a href="modifyReply?id=<%=articleReplie.getId()%>" onclick="window.open(this.href, '_blank', 'width=450px,height=200px,toolbars=no,scrollbars=no'); return false;"><i class="far fa-edit"></i></a>
				</td>	<%}%>
				<td class="mo_modi_date"><%=articleReplie.getRegDate()%></td>
			</tr>
				<%}%>
		</tbody>
	</table>
	
	<script>
		
		function submitReplyForm(form) {
			form.body.value = form.body.value.trim();
			if (form.body.value.length == 0) {
				alert('댓글내용을 입력해주세요.');
				form.body.focus();
				return;
			}
			form.body.value = source;
			form.submit();
		}
		function getForEditorBody(selector) {
			return $(selector).html().trim().replace(/<!--REPLACE:SCRIPT-->/gi,
					"script");
		}

		var editor1__initialValue = $('#origin1').html();
		var editor1 = new toastui.Editor({
			el : document.querySelector("#viewer1"),
			viewer : true,
			initialValue : editor1__initialValue,
			initialValue : getForEditorBody('#origin1'),
			plugins : [ toastui.Editor.plugin.codeSyntaxHighlight,
					youtubePlugin, replPlugin, codepenPlugin ]
		});
	</script>

	
	<script
		src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>


</div>
<%@ include file="/jsp/part/foot.jspf"%>