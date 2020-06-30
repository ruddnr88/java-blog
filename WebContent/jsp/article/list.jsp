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
	<h1>LiSt</h1>


	<table border="1" class="table notice-table">
		<colgroup>
			<col width="10%">
			<col width="40%">
			<col width="25%">
			<col width="25%">

		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>수정날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr class="noti">
				<td><%=article.getId()%></td>
				<td><a
					href="${pageContext.request.contextPath}/s/article/detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				<td><%=article.getRegDate()%></td>
				<td><%=article.getUpdateDate()%></td>
			</tr>
			<%
				}
			%>
			<!-- 두번째 줄 끝 -->


		</tbody>

	</table>
	<div class="con_butt">
		<div class="list-button butt">
			<a href="${pageContext.request.contextPath}/s/article/list">목록</a>
		</div>
	</div>

</div>
<%@ include file="/jsp/part/foot.jspf"%>
