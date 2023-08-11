<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
						<div class="allTerms">
							<div class="custom-checkbox" @click="fnAllCheck" :class="checkAm.length == 2 ? 'checked' : ''">
					            <div class="checkbox-icon">
					              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
					            </div>
							</div>
							<span>�Ʒ� ���뿡 ��� �����մϴ�.(�ʼ�)</span>
						</div>
						<div class="orAgreement">
							<div class="agreementBox">
								<div class="textBox">
									<div class="custom-checkbox1" :class="{ 'checked': checkAm.includes('privacy') }" @click="fnInsertCheckAm('privacy')">
							            <div class="checkbox-icon" :class="flg ? 'checked' : ''">
							              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
							            </div>
									</div>
									<input type="checkbox" v-model="checkAm" value="privacy">
									<span>�������� ���� �̿� �� �� 3�� ���� ���� (�ʼ�)</span>
								</div>
								<div class="textBox">
									<div class="custom-checkbox1" :class="{ 'checked': checkAm.includes('paymentAgent') }" @click="fnInsertCheckAm('paymentAgent')">
							            <div class="checkbox-icon" :class=" flg ? 'checked' : ''">
							              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
							            </div>
									</div>
									<input type="checkbox" v-model="checkAm" value="paymentAgent">
									<span>�������� ������ �̿��� ���� (�ʼ�)</span>
								</div>	
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
		checkAm : [],
		flg : false
	},// data
	methods : {
		fnAllCheck(){
			var self =this;
			if(self.checkAm.length == 2){
				self.checkAm = [];
			} else{
				self.checkAm = ['privacy', 'paymentAgent'];
			}
		},
		fnInsertCheckAm(text){
			var self = this;
			self.checkAm.push(text);
			for(let i=0; i<self.checkAm.length; i++){
				
			}
		}
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>