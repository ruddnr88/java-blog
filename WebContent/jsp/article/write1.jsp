<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 어바웃 미메인컨텐츠 -->
<div class="con article ">
	<div class="row1">
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">글작성</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control"
							placeholder="글 제목" name="bbsTitle" maxlength="50" /></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용"
								name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="con_butt">
			<div class="list-button butt">
				<a href="./list">목록</a>
			</div>
			<div class="de-mo_butt">
				<div class="doit-button butt">
					<input type="submit" class="btn btn-primary pull-right" value="등록">
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
				initialValue : "# 글을 작성해주세요",
				plugins : [ toastui.Editor.plugin.codeSyntaxHighlight ]
			});
		</script>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf"%>