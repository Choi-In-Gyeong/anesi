<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/product_edit.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>���� ����</title>
<style>


.review2{
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
			<div class="containerInquiry">
				<div class="btnBox">
					<button class="btn1 btn2 btn3" @click="fnRemoveReview">���û���</button>
				</div>
				<div class="tableBox">
					<div class="table-container">	
						<table>
							<tr>
								<th><input type="checkbox" @click="fnAllCheck" v-model="allChecked"></th>
								<th>�����ȣ</th>
								<th>��ǰ��(�ɼǸ�)</th>
								<th>����</th>
								<th><div>���� �̹���</div>(Ŭ��)</th>
								<th>�ۼ���</th>
								<th>������</th>
								<th>����</th>
								<th>�ۼ���</th>
							</tr>
							<tr v-for="(item,index) in reviewList">
								<td><input type="checkbox" v-model="checkList" :value="item.rNo" @change="updateAllCheck"></td>
								<td>{{item.rNo}}</td>
								<td @click="fnMoveProduct(item.productNo)" class="cursorPointer"><div>{{item.productName}}</div>{{item.optionName}}</td>
								<td>{{item.content}}</td>
								<td v-if="item.rImgPath != undefined" class="cursorPointer"><img alt="" :src="item.rImgPath+'/'+item.rImgName" class="imgSize" @click="openScrapModal(item.rImgPath+'/'+item.rImgName)"></td>
								<td v-else>-</td>
								<td>{{item.nick}}</td>
								<td>{{item.csat}}</td>
								<td>{{item.help}}</td>
								<td>{{item.createDate}}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="modal cursorPointer" v-if="showScrapModal" @click="closeModal">
        	<img alt="" :src="imgPath" >
        </div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		reviewList : [],
		showScrapModal : false,
		imgPath : '',
		checkList : [],
		allChecked : false,
		
	},// data
	methods : {
		fnGetReviewList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/searchReviewList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.reviewList = data.list;
                	console.log(self.reviewList);
                } 
			})
		},
		fnReload(){
			location.reload();
		},
		// ��޿���
		openScrapModal: function(imgPath) {
			var self = this;
			self.imgPath = imgPath;
			self.showScrapModal = true;
		},
		// ��� �ݱ�
		closeModal: function() {
			var self = this;
			self.showScrapModal = false;
		},
		// ��üũ
		fnAllCheck(){
			var self = this;
		    if (self.checkList.length === self.reviewList.length) {
				self.checkList = [];
		    } else {
			    self.checkList = self.reviewList.map(item => item.rNo);
		    }
		},
		// üũ�ڽ� üũ
		updateAllCheck() {
			var self = this;
			if (self.checkList.length === self.reviewList.length) {
				self.allChecked = true;
			} else {
				self.allChecked = false;
			}
		},
		fnRemoveReview(){
			var self = this;
			if(!confirm("���� �����Ͻðڽ��ϱ�?")){
				return;
			}
			var checkList = JSON.stringify(self.checkList);
			var nparmap = {	checkList};
			$.ajax({
                url : "/admin/removeReview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.fnReload();
                }
            });
		},
		fnMoveProduct(productNo){
			 $.pageChange("/product/view.do",{no : productNo});
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetReviewList();
	}// created
});
</script>