<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">
<link href="../css/admin_delivery.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>�����ڼ��� :: ��۰���</title>
<style>

</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="containerTitle" @click="fnReload">��� ����</div>
			<div class="containerCheckList">
				<div class="checkList" @click="fnChangeList('1')">
					<div class="iconBack"><i class="fa-solid fa-credit-card fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>�����Ϸ�</div>
						<div><span class="numText">{{paymentList.length}}</span>��</div> 
					</div>
				</div>
				<div class="checkList" @click="fnChangeList('2')">
					<div class="iconBack"><i class="fa-solid fa-truck-ramp-box fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>��۴��</div>
						<div><span class="numText">{{waitList.length}}</span>��</div> 
					</div>
				</div>
				<div class="checkList" @click="fnChangeList('3')">
					<div class="iconBack"><i class="fa-solid fa-truck fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>�����</div>
						<div><span class="numText">{{shippingList.length}}</span>��</div> 
					</div>
				</div>
				<div class="checkList" @click="fnChangeList('4')">
					<div class="iconBack"><i class="fa-solid fa-circle-check fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>��ۿϷ�</div>
						<div><span class="numText">{{completeList.length}}</span>��</div> 
					</div>
				</div>
			</div>
			<div class="deliverySearchBox">
				<div>
					<span>�������</span>
					<select v-model="selectListNo" class="selectStyle">
						<option value="0">��ü</option>
						<option value="1">�����Ϸ�</option>
						<option value="2">��۴��</option>
						<option value="3">�����</option>
						<option value="4">��ۿϷ�</option>
					</select>
					<span @mouseover="showhint" @mouseleave="hidehint"><i class="fa-solid fa-circle-question fa-2xs"></i></span>
					<span class="hint" v-if="hihtflg">��ü ���¿����� ��ۻ��¸� ������ �� �����ϴ�.</span>
				</div>
				<div>
					<span>������</span>
					<select v-model="searchOption" class="selectStyle">
						<option value="PAYMENT_NO">�ֹ���ȣ</option>
						<option value="PRODUCT_NAME">��ǰ�̸�</option>
						<option value="RECEIPT_NAME">������</option>
					</select>
					<span><input v-model="searchText" class="inputStyle" @keyup.enter="fnSearch"></span>
					<button class="btn1 btn2 btn3" @click="fnSearch">�˻�</button>
				</div>
			</div>
			<div class="deliveryListBox">
				<div class="buttonBox">
					<button class="btn1 btn2" v-if="listNo == 1" @click="fnUpdateDelivery('2')">���ù�ǰ<br>����Ȯ��</button>	
					<button class="btn1 btn2" v-if="listNo == 2" @click="fnUpdateDelivery('3')">���ù�ǰ ���</button>
					<button class="btn1 btn2" v-if="listNo == 3" @click="fnUpdateDelivery('4')">���ù�ǰ<br>��ۿϷ�</button>
				</div>
				<div class="tableBox">
						<div class="table-container">
							<table>
								<tr>
									<th><input type="checkbox" @click="fnAllCheck" v-model="allChecked"></th>
									<th>�ֹ���ȣ</th>
									<th>��ǰ��(�ɼǸ�)</th>
									<th>���ż���</th>
									<th>������</th>
									<th>�����(�����ȣ)</th>
									<th>������ ����ó</th>
									<th>������</th>
									<th>�������(����ó����)</th>
								</tr>
								<tr v-for="item in orderList2" v-if="item.deliverySit == listNo || listNo == 0">
									<td><input type="checkbox" v-model="checkList" :value="item.paymentNo" @change="updateAllCheck"></td>
									<td>{{item.paymentNo}}</td>
									<td>{{item.productName}}({{item.optionName}})</td>
									<td>{{item.cnt}}</td>
									<td>{{item.receiptName}}</td>
									<td>{{item.addr}} {{item.addr2}}({{item.zipcode}})</td>
									<td>{{item.receiptPhone}}</td>
									<td>{{item.createDate}}</td>
									<td>{{item.deliveryName}}</td>
								</tr>
							</table>
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		orderList : [],
		orderList2 : [],
		paymentList : [],
		waitList : [],
		shippingList : [],
		completeList : 0,
		checkList : [],
		allChecked : false,
		listNo : 0,
		selectListNo : 0,
		hihtflg : false,
		searchOption : 'PAYMENT_NO',
		searchText : '',
	},// data
	methods : {
		fnGetOrderList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/orderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                	self.paymentList = self.orderList.filter(item => item.deliverySit == 1);
                	self.waitList = self.orderList.filter(item => item.deliverySit == 2);
                	self.shippingList = self.orderList.filter(item => item.deliverySit == 3);
                	self.completeList = self.orderList.filter(item => item.deliverySit == 4);
                	self.orderList2 = self.orderList.map(item => {
                		if(item.deliverySit == 1){
                			 return { ...item, deliveryName: '�����Ϸ�' };
                		} else if(item.deliverySit == 2){
                			 return { ...item, deliveryName: '����غ�' };
                		} else if(item.deliverySit == 3){
                			 return { ...item, deliveryName: '�����' };
                		} else if(item.deliverySit == 4){
                			 return { ...item, deliveryName: '��ۿϷ�' };
                		}
                	})
                	
                }
            });
		},
		fnAllCheck(){
			var self = this;
		    if (self.checkList.length === self.orderList2.length) {
				self.checkList = [];
		    } else {
			    self.orderList2.forEach(item => {
			    	if(self.listNo == item.deliverySit || self.listNo == ''){
			    		self.checkList.push(item.paymentNo);
			    	}
		    	});
		    }
		},
		// üũ�ڽ� üũ
		updateAllCheck() {
			var self = this;
			if (self.checkList.length === self.orderList2.length) {
				self.allChecked = true;
			} else {
				self.allChecked = false;
			}
		},
		fnChangeList(num){
			var self = this;
			self.listNo = Number(num);
			self.selectListNo = Number(num);
			self.checkList = [];
			self.allChecked = false;
		},
		fnReload(){
			location.reload();
		},
		fnUpdateDelivery(sit){
			var self = this;
			var checkList = JSON.stringify(self.checkList);
			var nparmap = {	checkList, sit};
			$.ajax({
                url : "/admin/editDelivery.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("����");
                	self.fnGetOrderList();
                	self.checkList = [];
            		self.allChecked = false;
                }
			});
		},
		showhint(){
			var self = this;
			self.hihtflg = true;
		},
		hidehint(){
			var self = this;
			self.hihtflg = false;
		},
		fnSearch(){
			var self = this;
			self.listNo = self.selectListNo;
			var nparmap = {searchOption : self.searchOption, searchText : self.searchText};
			$.ajax({
                url : "/admin/searchList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                	self.orderList2 = [];
                	self.orderList2 = self.orderList.map(item => {
                		if(item.deliverySit == 1){
                			 return { ...item, deliveryName: '�����Ϸ�' };
                		} else if(item.deliverySit == 2){
                			 return { ...item, deliveryName: '����غ�' };
                		} else if(item.deliverySit == 3){
                			 return { ...item, deliveryName: '�����' };
                		} else if(item.deliverySit == 4){
                			 return { ...item, deliveryName: '��ۿϷ�' };
                		}
                	})
                }
			});
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetOrderList();
	}// created
});
</script>