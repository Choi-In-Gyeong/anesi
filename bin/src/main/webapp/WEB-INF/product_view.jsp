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
</style>
</head>
<!-- ��ǰ �� ������ -->
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="category-wrap">
					�̰� > ���� > ���
				</div>
				<div class="main-view">
					<div class="main-img-table">
						<ul>
							<li></li>
						</ul>
					</div>
					<div class="main-img">
						
					</div>
					<div class="main-box">
						<div class="main-title">
							{{list[0].productName}}
						</div>
						<div class="main-csat">
						
						</div>
						<div class="main-discount">
							
						</div>
						<div class="main-price">
							{{list[0].productPrice}}
						</div>
						<div class="main-option">
							<select >
								<option v-for="item in list">{{item.optionNo}}</option>
							</select>
						</div>
						<div class="main-btn-wrap">
							<button>��ٱ���</button>
							<button>�ٷα���</button>
						</div>
					</div> <!-- main-view-end -->
					<div class="nav-wrap">
						<button>��ǰ����</button>
						<button>����</button>
						<button>����</button>
					</div>
					<div class="content-view">
						
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
		productNo : 3,
		list : []
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
	               		self.list = data.list;
	               		console.log(self.list);
	                }                
	            }); 
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>