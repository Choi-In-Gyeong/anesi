<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/myShopping.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a class="my_a1_ch" onclick="location.href='../mypage.do'">������</a></li>
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage/myShopping.do'">���� ����</a></li>
				<li class="my_li1 on"><a class="my_a1" onclick="location.href='../mypage/myReview.do'">���� ����</a></li>
				<li class="my_li1"><a href="../mypage/user_edit.do" class="my_a1">���� </a></li>
			</ul>
		</div>
		<div id="container2">
			<div class="rBtnBox">
				<button class="btn4 btn5 btn6" :class="{'on2' : !onflg}">����Ʈ��</button>
				<button class="btn4 btn5 btn6" :class="{'on2' : onflg}">�ֽż�</button>
			</div>	
			<div class="reviewListBox">
				<div v-for="item in reviewList" class="reviewBox">
					<div>
						<div>{{item.productName}}</div>
						<div>{{item.optionName}}</div>
						<div>{{item.content}}</div>
					</div>
					<div class="">
						<img alt="" :src="item.rImgPath+'/'+item.rImgName" v-if="item.rImgPath != 0" class="imgBox">
						<div><button>�����ϱ�</button></div>
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
		reviewList : [],
		onflg : true,
	},// data
	methods : {
		fnGetMyReview(){
			var self = this;
			var nparmap = {userNo : self.userNo};
			$.ajax({
                url : "searchMyReview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.reviewList = data.list;
                	console.log(self.reviewList);
                }
			})
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetMyReview();
	}// created
});
</script>