<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/order.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<h1 class="orTitle">�ֹ�/����</h1>
			<div class="amount">
				<div class="payment">
					<div class="amountBox">
						<h2 class="moneyText">���� �ݾ�</h2>
						<div>
							<div class="orNameText">�� ��ǰ �ݾ�<span class="allMoneyText">0000��</span></div>
							<div class="orNameText">��ۺ�<span class="allMoneyText">3000��</span></div>
							<div class="orNameText">���� ���<span class="allMoneyText">0000��</span></div>
						</div>
						<div class="FinalPaymentAmount">���� ���� �ݾ�<span class="allMoneyText"><span>0000</span> ��</span></div>
					</div>
					<div class="orTerms">
						<div>
							<input type="checkbox">
							<span>�Ʒ� ���뿡 ��� �����մϴ�.(�ʼ�)</span>
						</div>
						<div>
							<div>
								<input type="checkbox">
								<span>�������� ���� �̿� �� �� 3�� ���� ���� (�ʼ�)</span>
							</div>
							<div>
								<input type="checkbox">
								<span>�������� ������ �̿��� ���� (�ʼ�)</span>
							</div>							
						</div>
					</div>
				</div>
				<button class="orBtuStyle">00,000�� �����ϱ�</button>
			</div>
			<div class="test"></div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>	
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