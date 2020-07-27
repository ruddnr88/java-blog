<%@ page import="com.sbs.java.blog.util.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="게시물 상세내용"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>
<style>
 .prev , .next {
	 cursor: pointer;
    width: auto;
    padding: 16px;
    margin-top: -22px;
    font-weight: bold;
    font-size: 15px;
    }
</style>
<!-- 어바웃 미메인컨텐츠 -->
<div class="con article">
	<h1 style="color: #6EAEA3;">${article.title}</h1>
	<table class="table detail-table">
		<colgroup>
			<col width="25%">
			<col width="75%">
		</colgroup>
		<tbody>
			<tr class="detail">
				<th>카테고리</th>
				<td>[${article.cateItemId}]${cateItemName}</td>
			</tr>
			<tr class="detail">
				<th>번호</th>
				<td>${article.id}</td>
			</tr>
			<tr class="detail">
				<th>작성자</th>
				<td>${article.getExtra().get("writer")}</td>
			</tr>
			<tr class="detail">
				<th>등록날짜</th>
				<td>${article.regDate}</td>
			</tr>
			<tr class="detail">
				<th>수정날짜</th>
				<td>${article.updateDate}</td>
			</tr>
			<tr class="detail">
				<th>조회수</th>
				<td>${article.hit}</td>
			</tr>
			<tr class="detail">
				<td colspan="2"><script type="text/x-template">${article.bodyForXTemplate}</script>
					<div class="toast-editor toast-editor-viewer"></div>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="detail_butt ">

		<div class="list-button butt">
			<a href="./list?cateItemId=${article.cateItemId}">목록</a>
		</div>
		
		<c:if test="${loginedMemberId == article.memberId}">
		<div class="de-mo_butt">
			<div class="delete-button butt">
				<a
					href="modify?id=${article.id}&cateItemId=${article.cateItemId}">수정</a>
			</div>
			<div class="modify-button butt">

				<a href="delete?id=${article.id}">삭제</a>
			</div>

		</div>
		</c:if>

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


			<c:forEach items="${articleReplies}" var="articleReply">
			<tr class="noti">
				<td>${articleReply.id}</td>
				<td>${articleReply.getExtra().get("writer")}</td>
				
				<td class="text-align-left">
				${articleReply.body} &nbsp;
				<c:if test="${loginedMemberId == articleReply.memberId}">
					<a href="dodelReply?id=${articleReply.id}">
						<i class="fas fa-trash-alt"></i></a>
					<a href="modifyReply?id=${articleReply.id}" onclick="window.open(this.href, '_blank', 'width=450px,height=200px,toolbars=no,scrollbars=no'); return false;"><i class="far fa-edit"></i></a>
				</c:if>
				</td>	
				<td class="mo_modi_date">${articleReply.regDate}</td>
			</tr>
			</c:forEach>
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

	</script>



</div>
<%@ include file="/jsp/part/foot.jspf"%>