<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
%>
<!-- 어바웃 미메인컨텐츠 -->
<div class="con article">
	<h1>게시물 상세보기</h1>


	<table border="1" class="table detail-table">
		<colgroup>
			<col width="25%">
			<col width="75%">
		</colgroup>
		<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr class="detail">
				<th>번호</th>
				<td><%=article.getId()%></td>
			</tr>
			<tr class="detail">
				<th>제목</th>
				<td><%=article.getTitle()%></td>
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
				<th>내용</th>
				<td><div id="origin1"><%=article.getBody()%></div>
					<div id="viewer1"></div></td>


			</tr>
			<%
				}
			%>
			<!-- 두번째 줄 끝 -->

		</tbody>

	</table>
	<div class="list-button">
		<a href="${pageContext.request.contextPath}/s/article/list">목록</a>
	</div>



</div>
<%@ include file="/jsp/part/foot.jspf"%>
