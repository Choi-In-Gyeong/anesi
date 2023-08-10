<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/searchId.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>�н����� ã��</title>
<style>
</style>
<jsp:include page="header.jsp"></jsp:include>
</head>
<!-- ���̵�/�н����� ã�� -->
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="title">
					<span>
						������ ������ �Է����ּ���.
					</span>
				</div>
				<div class="email-input">
					<input @Click="reset" v-model="userEmail" placeholder="�̸���">
					<button id="hidden-btn" class="btn" @click="emailCheck">Ȯ��</button>
				</div>
				<div v-if="email == '0'">
					<span>��ϵ� �̸��� �ּҰ� �ƴմϴ�.</span>
				</div>								
				<div class="select-email">
					<a>������ �̸��� ã��</a>
				</div>
				<div id="hidden" v-if="email == '1'">
					<div class="user-input">
						<input v-model="userName"  placeholder="�̸�">
						<input v-model="userPhone" placeholder="��ȭ��ȣ">
					</div>
					<div class="select-btn">
						<button class="btn" @click="searchPwd">�н����� ã��</button>
					</div>
				</div>
				<div class="text-box">
					<span class="text1">ȸ������ �� �Է��� ������ ��ﳪ�� �ʴ´ٸ�?</span>
					<div class="text2">������ �����ϱ�(1010-4563)</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
$(document).ready(function(){
    $("#hidden-btn").click(function(){
    	
    		$("#hidden").slideToggle(400)
    	
        
    })
})
var app = new Vue({
	el : '#app',
	data : {
		userEmail : "",
		userName : "",
		userPhone : "",
		email : ""
	},// data
	methods : {
		emailCheck : function(){
			 var self = this;
	            var nparmap = {userEmail : self.userEmail};	            
	            $.ajax({
	                url : "emailSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.email = data.emailCheck;
	               		console.log(self.email);
	                }                
	            }); 
		},
		reset : function(){
			var self=this
			self.email="";
			console.log(self.email);
		},
		searchPwd : function(){
			var self = this;
            var nparmap = {userEmail : self.userEmail, userName : self.userName, userPhone : self.userPhone};           
            $.ajax({
                url : "pwdSearch.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		alert(data.message);
                }                
            }); 
		}
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>