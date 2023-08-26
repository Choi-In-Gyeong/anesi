<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/myShopping.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>���� ����</title>
<style>
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a href="/mypage.do" class="my_a1_ch" style="color : #A782C3;">������</a></li>
				<li class="my_li1"><a href="/mypage/myShopping.do" class="my_a1">���� ����</a></li>
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage/myReview.do'">���� ����</a></li>
				<li class="my_li1"><a href="/mypage/user_edit.do" class="my_a1">���� </a></li>
			</ul>
		</div>
		<ul class="my_menu1">
			<li class="my_li2"><a href="/mypage.do" class="my_a2">��� ����</a></li>
			<li class="my_li2"><a class="my_a2_ch">���� ����</a></li>
			<li class="my_li2"><a href="/mypage/myBoard.do" class="my_a2">���� �Խñ�</a></li>
			<li class="my_li2"><a href="/scrapbook.do" class="my_a2">��ũ����</a></li>
		</ul>
		<div id="container2">
			<div v-if="inquiryList.length == 0" class="nonInquiry">���� ������ ������ �����ϴ�.</div>
			<div>
				<div v-for="item in inquiryList" class="inquiryBox">
					<div class="replyBox1">
						<span class="replyflgBox">{{item.reply == undefined ? '�̴亯' : '�亯�Ϸ�'}}</span>
						<span class="cDateTime">{{item.cDateTime.substring(0,11)}}</span>
					</div>
					<div class="productNameBox">
						<span>��ǰ</span>
						<span @click="fnMoveView(item.productNo)">{{item.productName}}</span>
					</div>
					<div class="inquiryContent">
						<div class="iconBack"><i class="fa-solid fa-q fa-sm" style="color: #A782C3;"></i></div>
						<span>{{item.content}}</span>
					</div>
					<div v-if="item.reply != undefined" class="replyBox2">
						<div>{{item.reply}}</div>
						<span>������ �� {{item.udatetime.substring(0,11)}}</span>
					</div>
					<div>
						<button class="btn4 btn5 btn6 btn7" @click="fnRemoveInquiry(item.enquiryNo)">����</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		userNo : '${sessionNo}',
		inquiryList : [],
		
	},// data
	methods : {
		fnGetInquiry(){
			var self = this;
			var nparmap = {userNo : self.userNo};
			$.ajax({
                url : "searchInquiryList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.inquiryList = data.list;
                }
			})
		},
		fnMoveView(productNo){
			$.pageChange("/product/view.do", {no : productNo} );
		},
		fnRemoveInquiry(enquiryNo){
			var self = this;
			if(!confirm("���� �����Ͻðڽ��ϱ�?")){
				return;
			}
			var nparmap = {enquiryNo};
			$.ajax({
                url : "removeInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.fnGetInquiry();
                }
			})
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInquiry();
	}// created
});
</script>