<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../../css/mainCss.css" rel="stylesheet">
<link href="../../css/product_edit.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<div id="app">
		<div id="container">
			<div class="containerTitle">��ǰ ��ȸ/����</div>
			<div class="containerCheckList">
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-border-all fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>��ü</div>
						<div><span class="numText">{{productList.length}}</span>��</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>�Ǹ���</div>
						<div><span class="numText">{{productList.length - soldOut}}</span>��</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-cart-arrow-down fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>ǰ��</div>
						<div><span class="numText">{{soldOut}}</span>��</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-pause fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>�Ǹ�����</div>
						<div><span class="numText">{{stop}}</span>��</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-ban fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>�Ǹ�����</div>
						<div><span class="numText">{{end}}</span>��</div> 
					</div>
				</div>
			</div>
			<div class="containerProductList">
				<div class="productListTitle">
					<span>��ǰ��� (�� {{productList.length}}��)</span>
				</div>
				<div class="btnBox">
					<button class="btn1 btn2 btn3" @click="fnCheckStop">��������</button>
					<button class="btn1 btn2 btn3">��������</button>
				</div>
				<div class="tableBox">
					<div class="table-container">
						<table>
							<tr>
								<th><input type="checkbox" @click="fnAllCheck" v-model="allChecked"></th>
								<th>����</th>
								<th>��ǰ��ȣ</th>
								<th>��ǰ��</th>
								<th>�ǸŻ���</th>
								<th>���û���</th>
								<th>������</th>
								<th>����</th>
								<th>������</th>
								<th>���λ���</th>
								<th>���ΰ�</th>
								<th>ī�װ�</th>
								<th>������</th>
								<th>������</th>
								<th>�����</th>
								<th>������</th>
							</tr>
							<tr v-for="item in productList">
								<td><input type="checkbox" v-model="checkList" :value="item.productNo" @change="updateAllCheck"></td>
								<td><button class="btn1" @click="fnProductEdit(item.productNo)">����</button></td>
								<td>{{item.productNo}}</td>
								<td>{{item.productName}}</td>
								<td>{{item.deleteYn == 'N' ? '�Ǹ���' : '�Ǹ�����'}}</td>
								<td>������</td>
								<td>{{item.stock}}</td>
								<td>{{item.productPrice}}</td>
								<td>{{item.discount}}%</td>
								<td>{{item.discountYn == 'Y' ? '������' : '����'}}</td>
								<td v-if="item.discountYn == 'Y'">{{(item.productPrice * ((100-item.discount)/100))}}</td>
								<td v-else></td>
								<td>{{item.categoryName}}</td>
								<td>{{item.manufacturer}}</td>
								<td>{{item.country}}</td>
								<td>{{item.cdatetime}}</td>
								<td>{{item.udatetime}}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="modal" v-if="showScrapModal">
		        <div class="modal-card">
		        	<div class="modalTitle">��ǰ���� ����</div>
		        	<div class="modalStyle1">
		        		<span class="modalSpan1">��ǰ��ȣ</span>
		        		<span>{{producInfo[0].productNo}}</span>
		        	</div>
		        	<div class="modalStyle1">
		        		<span class="modalSpan1">��ǰ��</span>
		        		<span><input v-model="producInfo[0].productName" class="inputStyle inputStyle2"></span>
		        	</div>
		        	<div class="modalStyle1">
		        		<span class="modalSpan1">����</span>
		        		<span><input v-model="producInfo[0].productPrice" class="inputStyle inputStyle2"></span>
		        	</div>
		        	<div class="modalStyle1">
		        		<span class="modalSpan1">������</span>
		        		<span><input v-model="producInfo[0].discount" class="inputStyle inputStyle2"></span>
		        	</div>
		        	<div class="modalStyle1 modalStyle2">
		        		<span class="modalSpan1">�ɼ�</span>
	        			<div v-if="producInfo.length != 0">
	        				<table class="modalTable">
	        					<tr>
	        						<th class="modalTdTr">�ɼ��̸�</th>
	        						<th class="modalTdTr">�ɼ� ���� ������</th>
	        						<th class="modalTdTr">�ɼ� ��� ����</th>
	        					</tr>
	        					<tr v-for="item in producInfo">
	        						<td class="modalTdTr"><input v-model="item.optionName"  class="modalSpan2 inputStyle"></td>
	        						<td class="modalTdTr"><input v-model="item.optionPrice" class="modalSpan2 inputStyle"></td>
	        						<td class="modalTdTr"><input v-model="item.productStock" class="inputStyle"></td>
	        					</tr>
	        				</table>
	        			</div>
		        	</div>
	        		<div class="modalStyle4">
	        			<span>
	        				<button class="btn1 btn2 btn3" @click="fnOptionAdd">�ɼ�+</button>
	        				<button class="btn1 btn2" @click="fnOptionDel">�ɼ�-</button>
	        				<span>(�ּ� 1�� �ִ� 5��)</span>
	        			</span>
	        			<span>
		        			<button class="btn1 btn2" @click="fnUpdateProduct">����</button>
		        			<button @click="closeModal" class="btn1 btn2 btn3">���</button>
	        			</span>
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
		productList : [],
		soldOut : 0,
		stop : 0,
		end : 0,
		checkList : [],
		allChecked : false,
		showScrapModal : false,
		producInfo : [],
		optionCnt : 0,
		productNo : 0,
		addOptionCnt : 0
		
	},// data
	methods : {
		//��ǰ ��ü �˻�
		fnGetProduct(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "/admin/productList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.soldOut = 0;
                	self.stop = 0;
                	self.end = 0;
					self.productList = data.list;
					for(let i = 0; i < self.productList.length; i++){
						if(self.productList[i].stock == 0){
							self.soldOut++;
						} else if(self.productList[i].leleteYn == 'S'){
							self.stop++;
						} else if(self.productList[i].leleteYn == 'Y'){
							self.end++;
						}
						
					}
                }
            });
		},
		// ��üũ
		fnAllCheck(){
			var self = this;
		    if (self.checkList.length === self.productList.length) {
				self.checkList = [];
		    } else {
			    self.checkList = self.productList.map(item => item.productNo);
		    }
		},
		// üũ�ڽ� üũ
		updateAllCheck() {
			var self = this;
			if (self.checkList.length === self.productList.length) {
				self.allChecked = true;
			} else {
				self.allChecked = false;
			}
		},
		//��ǰ ��&�ɼ� ����
		fnProductEdit(productNo){
			var self = this;
			var nparmap = {productNo};
            $.ajax({
                url : "/admin/productInfo.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.producInfo = data.info;
                	self.optionCnt = data.info.length;
                	self.productNo = productNo;
                	
                	if(self.producInfo[0].optionNo == 0){
                		self.optionCnt--;
                		self.addOptionCnt++;
                	}
                	self.openScrapModal();
                }
            });
			
		},
		// ��޿���
		openScrapModal: function() {
			var self = this;
			self.showScrapModal = true;
		},
		// ��� �ݱ�
		closeModal: function() {
			var self = this;
			self.showScrapModal = false;
			self.fnGetProduct();
		},
		//���� ���� ������Ʈ
		fnUpdateProduct(){
			var self = this;
			var discountYn = '';
			if(self.producInfo[0].discount !='0'){
				discountYn = 'Y';
			} else{
				discountYn = 'N';
			}
			var nparmap = {productNo : self.productNo, productName : self.producInfo[0].productName, productPrice : self.producInfo[0].productPrice, discount : self.producInfo[0].discount, discountYn, };
			$.ajax({
                url : "/admin/productUpdate.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                }
            });
			for(let i = 0; i < self.optionCnt; i++){
				var nparmap2 = {optionNo : self.producInfo[i].optionNo, optionName : self.producInfo[i].optionName, optionPrice : self.producInfo[i].optionPrice, productStock : self.producInfo[i].productStock};
				$.ajax({
	                url : "/admin/optionUpdate.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap2,
	                success : function(data) {
	                }
	            });
			}
			for(let i=self.optionCnt; i < self.optionCnt+self.addOptionCnt; i++){
				var nparmap3 = {productNo : self.productNo, optionName : self.producInfo[i].optionName, optionPrice : self.producInfo[i].optionPrice, productStock : self.producInfo[i].productStock};
				$.ajax({
	                url : "/admin/optionInsert.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap3,
	                success : function(data) {
	                }
	            });
			}
			alert("���强��");
			self.closeModal();
			
		},
		//�ɼ� �߰�
		fnOptionAdd(){
			var self = this
			console.log();
			if(self.producInfo.length < 5){
				self.producInfo.push({productNo : self.productNo, optionName : '', productStock : 0, optionPrice : 0});
				self.addOptionCnt++;
			}
		},
		fnOptionDel(){
			var self = this;
			if(self.producInfo.length > 1){
				self.producInfo.pop();
				if(self.addOptionCnt > 0){
					self.addOptionCnt--;
				} else {
					self.optionCnt--;
				}
			}
		},
		fnCheckStop(){
			var self = this;
			var nparmap = {checkList : self.checkList};
			$.ajax({
                url : "/admin/productStop.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetProduct();
	}// created
});
</script>