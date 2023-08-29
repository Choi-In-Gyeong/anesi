<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet">
<link href="../css/productView.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.main-img-table{
	margin-top: 51px;
}
.main-btn-wrap button {
    width: 405px;
    height: 50px;
    border-radius: 5px;
    font-size: 17px;
}
.usedText1{
	margin-top: 10px;
	font-size: 17px;
	
}
.a-wrap{
	margin-bottom: 20px;
}
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="content-box">
					<div class="main-left">
						<div class="main-view">
							<div class="main-img-table">
								<ul class="main-ul">
									<li class="main-li" v-for="item in list">
										<a href="javascript:;">
											<img alt="������ �̹���" :src="item.pImgPath+'/'+item.pImgName" @mouseover="clickImg(item.pImgPath, item.pImgName)">
										</a>
									</li>
								</ul>
							</div>
							<div class="main-img">
								<img alt="�����" :src="mainImg">
							</div>
						</div>
					</div>
						<div class="main-box">
							<div class="main-title" >
								<span class="product-title">{{usedName}}</span>
							</div>
							<div class="main-price2">
									{{price | formatPrice}}��
							</div>
							<div class="usedText1">
								���� : {{usedGrade}}
							</div>
							<div class="usedText1" v-if="usedtime > 0">
								���Ⱓ : {{usedtime}} ��
							</div>
							<div class="usedText1" v-if="usedtime == 0">
								���Ⱓ : �̻��
							</div>
							<div class="usedText1">
								��ۺ� : ��ۺ� ����
							</div>
							<div class="total-price">
							    <div class="total-title">�ֹ��ݾ�</div>
							    <div class="total-price1">
							    	<span class="total-price2">{{price | formatPrice}}��</span>
							    </div>
							</div>
							<div class="main-btn-wrap">
								<button class="btn2" @click="fnPay">�ٷα���</button>
							</div>
						</div>
					</div>
					<div class="content-box2">
						<div class="content-view">
							<div class="content-title">
								��ǰ ����
								<div class="content-text-box">
									<div class="text1">�Ǹ��� ���ŷ� ���� �ȳ�</div>
									<div>�Ǹ��ڸ� ��Ī�Ͽ� ���� �Ա� �����ϴ� �Һ��� ���� ��ʰ� �ð� �ֽ��ϴ�.</div>
									<div>�Ǹ��ڿ� ����/ī������ �����Ͻ� ��, ���е��� ���Ǹ� ��Ź�帮��,</div>
									<div>�ǽɵǴ� ��� �Ƴ׽� �����ͷ� �Ű��� �ֽñ� �ٶ��ϴ�.</div>
								</div>
								<div>
									<pre v-html="content"></pre>
								</div>
							</div>
						</div>
						</div>
						<div class="modal noneDisplay" v-if="showScrapModal3" :class="{'showDisplay' : showScrapModal3}">
							<div class="container">
							<div class="review-back">
								<button class="back-btn" @click="closeScrapModal3()"><i  class="fa-solid fa-x fa-2x" style="color: #bdbdbd;"></i></button>
							</div>
								<div class="content1">
									<div class="logo2">
										<a href="main.do"><img alt="logo" src="../css/image/footer_img.png" ></a>
									</div>
									<div class="login-wrap">
										<div class="login-title">
											<span class="title1">�α���</span>
										</div>
										<div class="login-box"> <!-- �α��� �Է� �ڽ� -->
											<input class="login-input" v-model="userEmail" placeholder="�̸���" @keyup.enter="fnLogin">
											<input class="login-input" type="password" v-model="pwd" placeholder="�н�����" @keyup.enter="fnLogin">
										</div>
										<div class="login-btn">
											<button class="loginBtn btn" @click="fnLogin">�α���</button>
										</div>
									</div>
									<div class="a-wrap"> <!-- ��Ÿ��� -->
										<a href="/selectEmail.do" class="a a1">���̵�ã��</a>
										<a href="/join.do" class="a a2">ȸ������</a>
									</div>
									<div class="non-user-wrap1"> <!-- ��ȸ�� �ֹ� ��ȸ -->
										<button class="loginBtn1 btn" @click="closeScrapModal3()">���� ����ϱ�</button>
									</div>
								</div>
							</div>		
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
<script>
var app = new Vue({
	el : '#app',
	data : {
		usedPNo : '${map.usedPNo}',
		userNo : '${sessionNo}',
		list : [],
		mainImg : "",
		price : 0,
		usedName : "",
		usedGrade : "",
		showScrapModal3 : false,
		content : "",
		usedtime : "",
		pwd : "",
		userEmail : "",
	},// data
	filters: {
	    formatPrice(price) {
	      return price.toLocaleString('ko-KR');
	    },
	  },
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {usedPNo : self.usedPNo};
            $.ajax({
                url : "/usedProduct.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		self.list = data.list
               		self.mainImg = self.list[0].pImgPath + "/" + self.list[0].pImgName;
               		self.price = self.list[0].uSellPrice;
               		self.usedName = self.list[0].usedPName;
               		self.usedGrade = self.list[0].grade;
               		self.content = self.list[0].sellContent;
               		self.usedtime = self.list[0].usedtime;
               		console.log(self.list);
                }                
            }); 
        },
        fnLogin : function(){
            var self = this;
            var nparmap = {userEmail : self.userEmail, pwd : self.pwd};
            if(self.userEmail == ""){
            	alert("�̸����� �Է��ϼ���.");
            	return;
            }
            if(self.pwd == ""){
            	alert("��й�ȣ�� �Է��ϼ���.");
            	return;
            }
            $.ajax({
                url : "../login.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		if(data.success){                		
               			location.reload();	                	
                   	} else {	
                   		alert(data.message);
                   	}
                }                
            }); 
        },
        clickImg(path , name){
        	var self = this;
        	self.mainImg = path + "/" + name;
        },
        fnPay(){
        	var self = this;
        	if(self.userNo==null || self.userNo==""){
				self.showScrapModal3 = true;
				return;
			}
        	if(self.userNo !=null || self.userNo !=""){
				 $.pageChange("../order/used.do" , {usedPNo : self.usedPNo});
			 }
        },
        closeScrapModal3: function() {
			var self = this;
			self.showScrapModal3 = false;
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>