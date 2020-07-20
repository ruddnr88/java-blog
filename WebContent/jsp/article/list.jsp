<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.CateItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%-- --%>
<%
	List<CateItem> cateItems = (List<CateItem>) request.getAttribute("cateItems");
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	Article article1 = (Article) request.getAttribute("article");
	String cateItemName = (String) request.getAttribute("cateItemName");
	int totalPage = (int) request.getAttribute("totalPage");
	int paramPage = (int) request.getAttribute("page");
%>
<!-- 리스트 미메인컨텐츠 -->

<div class="con article">
	<div class="select-box">
		<select class="cete-select"
			onchange="if(this.value) location.href=(this.value);">
			<option selected>카테고리 선택</option>
			<%
				for (CateItem cateItem : cateItems) {
			%>
			<option value="./list?cateItemId=<%=cateItem.getId()%>" class="block">[<%=cateItem.getId()%>]<%=cateItem.getName()%></option>
			<%
				}
			%>
		</select>
	</div>

	<ul class="cate-menu flex">
		<%
			for (CateItem cateItem : cateItems) {
		%>

		<li class="flex flex-as-c"><a
			href="./list?cateItemId=<%=cateItem.getId()%>" class="block">[<%=cateItem.getId()%>]<%=cateItem.getName()%></a></li>

		<%
			}
		%>
	</ul>





	<h1 class="list-h1" style="margin-top: 10px;">
		<%=cateItemName%></h1>
	<div class="search-count">
		<div class="text-align-left countValue">총 게시물 수 : ${totalCount}</div>
		<div class="search-bar">
			<form action="${pageContext.request.contextPath}/s/article/list">
				<input type="hidden" name="page" value="1" /> <input type="hidden"
					name="cateItemId" value="${param.cateItemId}" /> <input
					type="hidden" name="searchKeywordType" value="title" /> <input
					type="text" name="searchKeyword" value="${param.searchKeyword}"
					placeholder="검색어를 입력하세요" class="search"
					style="border-bottom: 1px solid;">
				<button>
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>

	</div>


	<table class="table notice-table">
		<colgroup>
			<col width="5%">
			<col width="5%">
			<col width="50%">
			<col class="name_col" width="10%">
			<col width="15%">
			<col width="15%">

		</colgroup>

		<thead>
			<tr>
				<th>CA</th>
				<th>NO.</th>
				<th>제 목</th>
				<th>작성자</th>
				<th class="mo_modi_date">날짜</th>
				<th class="mo_modi_date">수정날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Article article : articles) {
			%>
			<tr class="noti">
				<td><%=article.getCateItemId()%></td>
				<td><%=article.getId()%></td>
				<td class="text-align-left"><a
					href="./detail?id=<%=article.getId()%>&cateItemId=<%=article.getCateItemId()%>"><%=article.getTitle()%></a></td>
				<td><%=article.getExtra().get("writer")%></td>
				<td class="mo_modi_date"><%=article.getRegDate()%></td>
				<td class="mo_modi_date"><%=article.getUpdateDate()%></td>
				<%
					}
				%>
			</tr>
		</tbody>
	</table>

	<div class="con page-box">
		<ul class="flex flex-jc-c">
			<li style="color: #609E93">◀</li>
			<%
				for (int i = 1; i <= totalPage; i++) {
			%>
			<li class="<%=i == paramPage ? "current" : ""%>"><a
				href="?cateItemId=${param.cateItemId}&page=<%=i%>" class="block"><%=i%></a></li>
			<%
				}
			%>
			<li style="color: #609E93">▶</li>

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
