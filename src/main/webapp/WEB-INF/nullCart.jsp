<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.footerCssStyle {
	margin-top: 710px;
}
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<link href="../css/nullCart.css" rel="stylesheet">
<link href="../css/mainCss.css" rel="stylesheet">
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<span> <img class="nullCart" src="../css/image/nullCart.png" />
		</span>

		<button class="nullCartBtn" @click="goToStoreMain">
			<span><i class="fa-solid fa-grip-lines"></i>��ǰ����������</span>
		</button>
	</div>
	<div class="footerCssStyle"></div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {

	},// data
	methods : {
		
		 goToStoreMain() {
		      window.location.href = '/product/storemain.do'; // ���� ��η� ��ü���ּ���
		    }
	}, // methods
	created : function() {
		var self = this;

		
	}// created
});
</script>