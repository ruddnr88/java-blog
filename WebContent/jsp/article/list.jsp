<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	int totalPage = (int) request.getAttribute("totalPage");
	int paramPage = (int) request.getAttribute("page");
%>
<!-- 리스트 미메인컨텐츠 -->

<div class="con article">
	<ul class="cate-menu flex">
		<li class="flex flex-as-c"><a href="./list?cateItemId=1">[1]Dairy</a></li>
		<li class="flex flex-as-c"><a href="./list?cateItemId=2">[2]IT/JAVA</a></li>
		<li class="flex flex-as-c"><a href="./list?cateItemId=3">[3]IT/정보</a></li>
		<li class="flex flex-as-c"><a href="./list?cateItemId=4">[4]IT/ETC</a></li>
		<li class="flex flex-as-c"><a href="./list?cateItemId=5">[5]HTML/CSS</a></li>
		<li class="flex flex-as-c"><a href="./list?cateItemId=6">[6]Design</a></li>
	</ul>


	<h1 class="list-h1">List</h1>

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
				<td class="text-align-left"><a
					href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
				<td><%=article.getRegDate()%></td>
				<td class="mo_modi_date"><%=article.getUpdateDate()%></td>
			</tr>
			<%
				}
			%>
			<!-- 두번째 줄 끝 -->


		</tbody>

	</table>


	<div class="con page-box">
		<ul class="flex flex-jc-c">
			<li>◀</li>
			<%
				for (int i = 1; i <= totalPage; i++) {
			%>
			<li class="<%=i == paramPage ? "current" : ""%>"><a
				href="?cateItemId=${param.cateItemId}&page=<%=i%>" class="block"><%=i%></a></li>
			<%
				}
			%>
			<li>▶</li>
		</ul>
	</div>
	<div class="con_butt">
		<div class="list-button butt">
			<a href="./list">전체목록</a>
		</div>
		<div class="de-mo_butt">
			<div class="write-button butt">
				<a href="./write">글쓰기</a>
			</div>


		</div>
	</div>

</div>
<%@ include file="/jsp/part/foot.jspf"%>
