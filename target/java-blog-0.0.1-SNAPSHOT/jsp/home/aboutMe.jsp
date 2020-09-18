<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<!-- 어바웃 미메인컨텐츠 -->
<div class="con about">
	<h1>WHO AM I?</h1>
	<img src="http://kyky1211.dothome.co.kr/img/icon.png"
		class="width-30p imm" alt="이미지" />
	<ul class="conme ">
		<li>이름 : 노경욱</li>
		<li></li>
		<li></li>
	</ul>

	<h1>MY SKILL!</h1>

	<div class="wrapper">
		<div class="pie-charts">
			<div class="pieID--micro-skills pie-chart--wrapper">
				<h2>WebDesign</h2>
				<div class="pie-chart">
					<div class="pie-chart__pie"></div>
					<ul class="pie-chart__legend">
						<li><em>Adobe Photoshop</em><span>70</span></li>
						<li><em>Adobe illustrator</em><span>50</span></li>
						<li><em>HTML/CSS</em><span>50</span></li>
					</ul>
				</div>
			</div>
			<div class="pieID--categories pie-chart--wrapper">
				<h2>Programmer</h2>
				<div class="pie-chart">
					<div class="pie-chart__pie"></div>
					<ul class="pie-chart__legend">
						<li><em>JAVA</em><span>50</span></li>
						<li><em>JavaScript</em><span>20</span></li>
						<li><em>MySQL</em><span>30</span></li>
					</ul>
				</div>
			</div>
			<div class="pieID--operations pie-chart--wrapper">
				<h2>ETC-Skills</h2>
				<div class="pie-chart">
					<div class="pie-chart__pie"></div>
					<ul class="pie-chart__legend">
						<li><em>autoCAD</em><span>30</span></li>
						<li><em>Premiere/AE</em><span>30</span></li>
						<li><em>Word/Excel</em><span>40</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>



</div>
<script>
	function sliceSize(dataNum, dataTotal) {
		return (dataNum / dataTotal) * 360;
	}

	function addSlice(id, sliceSize, pieElement, offset, sliceID, color) {
		$(pieElement).append(
				"<div class='slice "+ sliceID + "'><span></span></div>");
		var offset = offset - 1;
		var sizeRotation = -179 + sliceSize;

		$(id + " ." + sliceID).css({
			"transform" : "rotate(" + offset + "deg) translate3d(0,0,0)"
		});

		$(id + " ." + sliceID + " span").css({
			"transform" : "rotate(" + sizeRotation + "deg) translate3d(0,0,0)",
			"background-color" : color
		});
	}

	function iterateSlices(id, sliceSize, pieElement, offset, dataCount,
			sliceCount, color) {
		var maxSize = 179, sliceID = "s" + dataCount + "-" + sliceCount;

		if (sliceSize <= maxSize) {
			addSlice(id, sliceSize, pieElement, offset, sliceID, color);
		} else {
			addSlice(id, maxSize, pieElement, offset, sliceID, color);
			iterateSlices(id, sliceSize - maxSize, pieElement,
					offset + maxSize, dataCount, sliceCount + 1, color);
		}
	}

	function createPie(id) {
		var listData = [], listTotal = 0, offset = 0, i = 0, pieElement = id
				+ " .pie-chart__pie"
		dataElement = id + " .pie-chart__legend"

		color = [ "cornflowerblue", "olivedrab", "orange", "tomato", "crimson",
				"purple", "turquoise", "forestgreen", "navy" ];

		color = shuffle(color);

		$(dataElement + " span").each(function() {
			listData.push(Number($(this).html()));
		});

		for (i = 0; i < listData.length; i++) {
			listTotal += listData[i];
		}

		for (i = 0; i < listData.length; i++) {
			var size = sliceSize(listData[i], listTotal);
			iterateSlices(id, size, pieElement, offset, i, 0, color[i]);
			$(dataElement + " li:nth-child(" + (i + 1) + ")").css(
					"border-color", color[i]);
			offset += size;
		}
	}

	function shuffle(a) {
		var j, x, i;
		for (i = a.length; i; i--) {
			j = Math.floor(Math.random() * i);
			x = a[i - 1];
			a[i - 1] = a[j];
			a[j] = x;
		}

		return a;
	}

	function createPieCharts() {
		createPie('.pieID--micro-skills');
		createPie('.pieID--categories');
		createPie('.pieID--operations');
	}

	createPieCharts();
</script>


<%@ include file="/jsp/part/foot.jspf"%>