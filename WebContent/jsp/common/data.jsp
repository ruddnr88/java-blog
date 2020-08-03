<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${jsAlertMsg != null}">
	<script>
		alert('${jsAlertMsg}');
	</script>
</c:if>
<c:if test="${jsHistoryBack}">
	<script>
		history.back();
	</script>
</c:if>
<c:if test="${jsLocationReplace != null}">
	<script>
		location.replace('${jsLocationReplace}');
	</script>
</c:if>
<c:if test="${jsLocationHref != null}">
	<script>
		location.href = '${jsLocationHref}';
	</script>
</c:if>
<c:if test="${redirectUrl != null}">
	<script>
		location.replace('${redirectUrl}');
	</script>
</c:if> 