<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>

#container {
  color:#555;
  text-transform: uppercase;
  font-size:50px;
  font-weight:bold;
  padding-top:200px;  
  position:fixed;
  width:100%;
  bottom:45%;
  display:block;
}

#flip {
  height:60px;
  overflow:hidden;
}

#flip > div > div {
  color:#fff;
  padding:4px 12px;
  height:45px;
  margin-bottom:45px;
  display:inline-block;
}

#flip div:first-child {
  animation: show 5s linear infinite;
}

#flip div div {
  background:#42c58a;
}
#flip div:first-child div {
  background:#4ec7f3;
}
#flip div:last-child div {
  background:#DC143C;
}

@keyframes show {
  0% {margin-top:-270px;}
  5% {margin-top:-180px;}
  33% {margin-top:-180px;}
  38% {margin-top:-90px;}
  66% {margin-top:-90px;}
  71% {margin-top:0px;}
  99.99% {margin-top:0px;}
  100% {margin-top:-270px;}
}

</style>

<!-- 메인컨텐츠 -->
<div class="con main-con">
	<img src="http://kyky1211.dothome.co.kr/img/main.png" alt="Image">
	<div id=container>
		HELLO!  MY
		<div id=flip>
			<div>
				<div>BLOG</div>
			</div>
			<div>
				<div>HOMEPAGE</div>
			</div>
			<div>
				<div>portfolio!</div>
			</div>
		</div>
		WELCOME!! 
	</div>


</div>



<%@ include file="/jsp/part/foot.jspf"%>