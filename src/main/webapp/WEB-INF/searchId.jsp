<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/searchId.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
<jsp:include page="header.jsp"></jsp:include>
</head>
<!-- ���̵�/�н����� ã�� -->
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="title">
					<span>
						������ ������ �Է����ּ���.
					</span>
				</div>
				<div class="email-input">
					<input v-midel="email" placeholder="�̸���">
					<button class="btn" @click="emailCheck">Ȯ��</button>
				</div>
				<div class="select-email">
					<a>������ �̸��� ã��</a>
				</div>
				<div class="user-input">
					<input placeholder="�̸�">
					<input placeholder="��ȭ��ȣ">
				</div>
				<div class="select-btn">
					<button class="btn">�н����� ã��</button>
				</div>
				<div class="text-box">
					<span class="text1">ȸ������ �� �Է��� ������ ��ﳪ�� �ʴ´ٸ�?</span>
					<div class="text2">������ �����ϱ�(1010-4563)</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {

	},// data
	methods : {
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>