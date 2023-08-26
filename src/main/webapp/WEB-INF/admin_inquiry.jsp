<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/product_edit.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>���� ����</title>
<style>
.inquiry2{
	background: white;
	color: #5E503F;
	border-radius: 10px 0px 0px 10px;
}

</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="containerTitle cursorPointer" @click="fnReload">���� ����</div>
			<div class="containerCheckList">
				<div class="checkList cursorPointer" @click="fnChangeInquiryflg('�̴亯')">
					<div class="iconBack"><i class="fa-brands fa-quora fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>�̴亯</div>
						<div><span class="numText">{{inquiryCnt}}</span>��</div> 
					</div>
				</div>
				<div class="checkList cursorPointer" @click="fnChangeInquiryflg('�亯')">
					<div class="iconBack"><i class="fa-solid fa-check fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>�亯�Ϸ�</div>
						<div><span class="numText">{{completeCnt}}</span>��</div> 
					</div>
				</div>
			</div>
			<div class="containerInquiry">
				<div class="tableBox">
					<div class="table-container">	
						<table>
							<tr>
								<th>������</th>
								<th>ó������</th>
								<th>��������</th>
								<th>��ǰ��ȣ</th>
								<th>��ǰ����</th>
								<th>���ǳ���</th>
								<th>������</th>
								<th>ó����</th>
								<th>�亯</th>
							</tr>
							<tr v-for="(item,index) in inquiryList2" v-if="item.inquiryYn == inquiryflg || inquiryflg == ''">
								<td>{{item.cDateTime}}</td>
								<td>{{item.inquiryYn}}</td>
								<td>{{item.inquiryCategory}}</td>
								<td>{{item.productNo}}</td>
								<td @click="fnMoveProduct(item.productNo)" class="productName1">{{item.productName}}</td>
								<td>{{item.content}}</td>
								<td>{{item.userEmail}}</td>
								<td v-if="item.inquiryYn == '�亯'">{{item.udatetime}}</td>
								<td v-else>-</td>
								<td v-if="item.inquiryYn == '�亯'"><button class="btn1 btn2 btn3" @click="openScrapModal(index)">�亯����</button></td>
								<td v-else><button class="btn1 btn2" @click="openScrapModal(index)">�亯�ϱ�</button></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="modal" v-if="showScrapModal">
			        <div class="modal-card">
			        	<div class="modalTitle">���� �亯</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">���� ����</span>
			        		<span>{{inquiryList[inquiryIndex].inquiryCategory}}</span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">��ǰ����</span>
			        		<span>{{inquiryList[inquiryIndex].productName}}</span>
			        	</div>
	     			   	<div class="modalStyle1">
			        		<span class="modalSpan1">������</span>
			        		<span>{{inquiryList[inquiryIndex].userEmail}}</span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">���� ����</span>
			        		<span>{{inquiryList[inquiryIndex].content}}</span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">���� �亯</span>
			        		<span><textarea v-model="inquiryList[inquiryIndex].reply" cols="50" rows="10" class="inquiryReply"></textarea></span>
			        	</div>
		        		<div class="modalStyle4">
		        			<span>
			        			<button class="btn1 btn2" @click="fnUpdateInquiry">�亯</button>
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
		inquiryList : [],
		inquiryList2 : [],
		inquiryCnt : 0,
		completeCnt : 0,
		showScrapModal : false,
		inquiryIndex : 0,
		inquiryflg : '',
		
	},// data
	methods : {
		fnGetInquiryList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/searchInquiryList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.inquiryList = data.list;
                	self.inquiryList.forEach(item => {
                		if(item.reply == undefined ){
                			self.inquiryCnt++;
                		} else{
                			self.completeCnt++;
                		}
                	})
                	self.inquiryList2 = self.inquiryList.map(item => {
                		if(item.reply == undefined){
                			return {...item, inquiryYn : '�̴亯'};
                		} else{
                			return {...item, inquiryYn : '�亯'};
                		}
                	})
         

                }
			})
		},
		// ��޿���
		openScrapModal: function(index) {
			var self = this;
			self.inquiryIndex = index;
			self.showScrapModal = true;
		},
		// ��� �ݱ�
		closeModal: function() {
			var self = this;
			self.showScrapModal = false;
			self.fnGetInquiryList();
		},
		fnUpdateInquiry(){
			var self = this;
			var nparmap = self.inquiryList[self.inquiryIndex];
			$.ajax({
                url : "/admin/editInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert('�亯����');
                	self.closeModal();
                } 
			})
		},
		fnMoveProduct(productNo){
			 $.pageChange("/product/view.do",{no : productNo});
		},
		fnChangeInquiryflg(text){
			var self = this;
			self.inquiryflg = text;
		},
		fnReload(){
			location.reload();
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInquiryList();
	}// created
});
</script>