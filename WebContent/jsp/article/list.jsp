<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="${cateItemName}"></c:set>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<!-- 리스트 미메인컨텐츠 -->

<div class="con article">
	<div class="select-box">
		<select class="cete-select"
			onchange="if(this.value) location.href=(this.value);">
			<option selected>카테고리 선택</option>
				<c:forEach items ="${cateItems}" var="cateItem">
					<option value="./list?cateItemId=${cateItem.id}" class="block">
						[${cateItem.id}] ${cateItem.name}
					</option>
				</c:forEach>	
		</select>
	</div>

	<ul class="cate-menu flex">
		<c:forEach items="${cateItems}" var="cateItem">
			<li class="flex flex-as-c"><a
					href="./list?cateItemId=${cateItem.id}" class="block">[${cateItem.id}] ${cateItem.name}</a></li>
		</c:forEach>
	</ul>

	<h1 class="list-h1" style="margin-top: 10px;">${cateItemName}</h1>
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
			<col width="55%">
			<col class="name_col" width="10%">
			<col width="15%">
			<col width="10%">

		</colgroup>

		<thead>
			<tr>
				<th>CA</th>
				<th>NO.</th>
				<th>제 목</th>
				<th>작성자</th>
				<th class="mo_modi_date">날짜</th>
				<th><i class="fas fa-eye"></i></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articles}" var="article">
			<tr class="noti">
				<td>${article.cateItemId}</td>
				<td>${article.id}</td>
				<td class="text-align-left">
				<a href="./detail?id=${article.id}&cateItemId=${article.cateItemId}">${article.title}</a></td>
				<td>${article.getExtra().get("writer")}</td>
				<td class="mo_modi_date">${article.regDate}</td>
				<td>${article.hit}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="con page-box">
		<ul class="flex flex-jc-c">
			<li style="color: #609E93">◀</li>
			<c:forEach var="i" begin="1" end="${totalPage}" step="1">
			<li class="${i == cPage ? 'current' : ''}"><a
				href="?cateItemId=${param.cateItemId}&page=${i}" style="font-weight: bold" >${i}</a></li>
			</c:forEach>
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
