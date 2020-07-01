<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
%>
<!-- 리스트 미메인컨텐츠 -->
<div class="con article">
	<ul class="cate-menu flex">
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?cateItemId=1">[1]Dairy</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?cateItemId=2">[2]IT/JAVA</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?cateItemId=3">[3]IT/정보</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?cateItemId=4">[4]IT/ETC</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?cateItemId=5">[5]HTML/CSS</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?cateItemId=6">[6]Design</a></li>
	</ul>


	<h1 class = "list-h1">List</h1>

	<table border="1" class="table notice-table">
		<colgroup>
			<col width="5%">
			<col width="5%">
			<col width="50%">
			<col width="20%">
			<col width="20%">

		</colgroup>
		<thead>
			<tr>
				<th>CA</th>
				<th>NO.</th>
				<th>제목</th>
				<th>날짜</th>
				<th class="mo_modi_date">수정날짜</th>
			</tr>
		</thead>
		<tbody>


			<%
				for (Article article : articles) {
			%>
			<tr class="noti">
				<td><%=article.getcateItemId()%></td>
				<td><%=article.getId()%></td>
				<td><a
					href="${pageContext.request.contextPath}/s/article/detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				<td><%=article.getRegDate()%></td>
				<td class="mo_modi_date"><%=article.getUpdateDate()%></td>
			</tr>
			<%
				}
			%>
			<!-- 두번째 줄 끝 -->


		</tbody>

	</table>
	<ul class="flex">
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list">◀</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?page=1">1</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?page=2">2</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?page=3">3</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?page=4">4</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list?page=5">5</a></li>
		<li class="flex flex-as-c"><a
			href="${pageContext.request.contextPath}/s/article/list">▶</a></li>
	</ul>
	<div class="con_butt">
		<div class="list-button butt">
			<a href="${pageContext.request.contextPath}/s/article/list">목록</a>
		</div>
		<div class="de-mo_butt">
			<div class="write-button butt">
				<a href="${pageContext.request.contextPath}/s/article/write">글쓰기</a>
			</div>


		</div>
	</div>

</div>
<%@ include file="/jsp/part/foot.jspf"%>
