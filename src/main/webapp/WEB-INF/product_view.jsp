<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>��ǰ �� ������</title>
<style>
	.content{
		position: relative;
    	min-height: 1px;
		width: 1300px;
		margin: 0 auto;
		margin-top : 170px;
	}
	.content-box{
		height: 700px;
	}
	.main-left{
		width: 60%;
		display: inline-block;
		position: relative;
	}
	.main-box{
		position : absolute;
		top : 50px;
		width: 400px;
		display: inline-block;
		margin-top: 0;
	}
	.category-wrap{
		margin-top: 20px;
		font-size: 15px;
		color: #424242;
	}
	.main-img-table{
	}
	.main-ul{
		list-style-type: none;
		padding-left: 0px;
	}
	.main-li{
		margin-bottom: 5px;
		margin-top: 0px;
		
	}
	.main-li img{
		width: 100px;
		height: 100px;
		border-radius: 10px;
	}
	.main-img{
		position : absolute;
		left : 110px;
		top : 51px;
		width: 600px;
		height: 600px;
		
	}
	.main-img img{
		width: 600px;
		height: 600px;
		border-radius: 10px;	
	}
	.main-title{
		font-size: 40px;
		margin-top: 0;
		
	}
	.main-csat{
		font-size : 20px;
		margin-top: 20px;
	}
	.main-discount{
		margin-top: 20px;
		font-size: 20px;
	}
	.main-price{
		height : 50px;
		border-bottom: 1px solid;
		font-size: 30px;
	}
	.main-option{
		margin-top: 30px;
	}
	.option-box{
		width: 100%;
		height: 40px;
		font-size: 18px;
	}
	.main-btn-wrap{
		margin-top: 298px;
	}
	.main-btn-wrap button{
		width: 198px;
		height: 50px;
		border-radius: 5px;
		font-size: 17px;
	}
	.btn1{
		border: 1.5px solid #A782C3;
		color: #A782C3;
		background-color: #fff;
		font-weight: bold;
	}
	.btn2{
		border: 0;
		color: #fff;
		background-color: #A782C3;
	}
	.nav-box{
		overflow: auto;
		position: sticky;
		top: 185px;
	}
	.nav-wrap{
    	
		height: 50px;
		background-color: #fafafa;
		border-bottom: 1px solid #ededed;
		border-top: 1px solid #ededed;
	}
	.nav-wrap div{
		font-size : 16px;
		font-weight : bold;
		line-height : 50px;
		text-align : center;
		width: 430px;
		height : 50px;
		display: inline-block;
	}
	.content-img{
		margin-left: 30px;
	}
	.content-img img{
		width: 800px;
	}
	.content-title{
		font-size: 20px;
		font-weight: bold;
		margin-left: 30px;
		margin-top: 20px;
		
	}
	.content-text-box{
		background-color: #FDF4F5;
		text-align: center;
		width: 800px;
		height : 200px;
		font-size: 20px;
		margin-top: 20px;
		margin-bottom: 50px;
	}
	.text1{
		color: #F54644;
		line-height: 80px;
		font-weight: bold;
		font-size: 30px;
	}
</style>
</head>
<!-- ��ǰ �� ������ -->
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="content-box">
					<div class="main-left">
						<div class="category-wrap">
							�̰� > ���� > ���
						</div>
						<div class="main-view">
							<div class="main-img-table">
								<ul class="main-ul">
									<li class="main-li" v-for="item in imgList">
										<a href="javascript:;">
											<img alt="������ �̹���" :src="item.imgPath+'/'+item.imgName">
										</a>
									</li>
								</ul>
							</div>
							<div class="main-img" v-for="item in img">
								<img alt="�����" :src="item.imgPath+'/'+item.imgName">
							</div>
						</div>
					</div>
						<div class="main-box">
							
							<div class="main-title" >
								{{product.productName}}
							</div>
							<div class="main-csat">
								{{csat.csatAvg}}({{csat.csatCnt}})
							</div>
							<div class="main-discount">
								{{product.discount}}%
							</div>
							<div class="main-price">
								{{product.productPrice}}��
							</div>
							<div class="main-option">
								<select class="option-box">
									<option v-for="item in option">{{item.optionName}}+({{item.optionPrice}}��)</option>
								</select>
							</div>
							<div class="main-btn-wrap">
								<button class="btn1">��ٱ���</button>
								<button class="btn2">�ٷα���</button>
							</div>
						</div>
					</div>
					<div class="nav-box">
						<div class="nav-wrap">
							<div class="product-a"><a href="#product">��ǰ����</a></div>
							<div class="reeview-a"><a href="#review">����{{csat.csatCnt}}</a></div>
							<div class="inquiry-a"><a>����</a></div>
						</div>
					</div>
					<div class="content-view">
						<div class="content-title" id="product">
							��ǰ ����
							<div class="content-text-box">
								<div class="text1">�Ǹ��� ���ŷ� ���� �ȳ�</div>
								<div>�Ǹ��ڸ� ��Ī�Ͽ� ���� �Ա� �����ϴ� �Һ��� ���� ��ʰ� �ð� �ֽ��ϴ�.</div>
								<div>�Ǹ��ڿ� ����/ī������ �����Ͻ� ��, ���е��� ���Ǹ� ��Ź�帮��,</div>
								<div>�ǽɵǴ� ��� �Ƴ׽� �����ͷ� �Ű��� �ֽñ� �ٶ��ϴ�.</div>
							</div>
						</div>
						<div class="content-img" v-for="item in imgList2">
							<img alt="�������̹���" :src="item.imgPath+'/'+item.imgName">
						</div>
					</div>
					<div class="content-review">
						<div class="review-title" id="review">
							���� <span>{{csat.csatCnt}}</span>
						</div>
						<div class="csat-box">
							<div class="csat1">
								
							</div>
							<div class="csat2">
							
							</div>
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
		productNo : 4,
		product : {},
		csat : {},
		option : [],
		imgList : [],
		img : [],
		imgList2 : []
	},// data
	methods : {
		fnGetList : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/productSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.product = data.product;
	               		console.log(self.product);
	                }                
	            }); 
		},
		fnAvg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/csatSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.csat = data.csat;
	               		console.log(self.csat);
	                }                
	            }); 
		},
		fnOption : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/optionSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.option = data.option;
	               		console.log(self.option);
	                }                
	            }); 
		},
		fnImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.imgList = data.imgList;
	               		console.log(self.imgList);
	                }                
	            }); 
		},
		fnThumbnailImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgThumbnailSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.img = data.img;
	               		console.log(self.img);
	                }                
	            }); 
		},
		fnContentImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgSearch2.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.imgList2 = data.imgList2;
	               		console.log(self.imgList2);
	                }                
	            }); 
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnAvg();
		self.fnOption();
		self.fnImg();
		self.fnThumbnailImg();
		self.fnContentImg();
	}// created
});
</script>