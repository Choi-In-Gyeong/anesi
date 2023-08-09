<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<link href="../css/mainCss.css" rel="stylesheet">
<title>Insert title here</title>
<style>
	#container {
		margin : 10px auto;
		width : 400px;
		line-height: 30px;
	}
	#logo{
		width : 200px;
		margin : 10px auto;
		margin-left : 100px;
	}
	.put{
	    border-radius: 4px;
	    border: 1px solid #ccc;
	    width: 380px;
	    height: 30px;
	    padding: 10px;
	}
	.email{
		border-radius: 4px;
	    border: 1px solid #ccc;
	    width: 167px;
	    height: 30px;
	    padding: 10px;
	}
	.email2{
		border-radius: 4px;
	    border: 1px solid #ccc;
	    width: 190px;
	    height: 52px;
	    padding: 8px;
	}
	#login{
		text-align: center;
	}
	hr{
		margin : 30px 0px;
	}
	.btn{
	    border: none;
	    color: white;
	    background-color: #A782C3;
	    border-radius: 7px;
	    padding: 0px 9px;
	    width: 400px;
	    height: 50px;
	    font-size: 20px;
	    margin: 10px 0px;
  		transition: background 0.3s;
  		cursor: pointer;
	}
	.btn:hover{
		background-color: #7c6191;
	}
	.clause1{
		color : #A782C3;
	}
	.clause2{
		color : #999;
	}
	.select{
		border-radius: 4px;
	    border: 1px solid #ccc;
	    width: 130px;
	    height: 50px;
	    padding: 8px;
	}
	input, select{
		margin-bottom : 20px;
	}
</style>
</head>
<body>
<div id="app">
	<div id="container">
	<div><img src="../css/image/footer_img.png" id="logo"></div>
	<div><h1>ȸ������</h1></div>
	<hr>
	<div>�̸���<span class="clause1"> *</span></div>
	<div><input class="email" type="text" v-model="user.userEmail1" @keyup="fnCheck" autofocus placeholder="�̸���"> @ 
	<select v-model="user.userEmail2" class="email2">
		<option value="">�����ϼ���</option>
		<option value="naver.com">naver.com</option>
		<option value="hanmail.net">hanmail.net</option>
		<option value="daum.net">daum.net</option>
		<option value="gmail.com">gmail.com</option>
		<option value="nate.com">nate.com</option>
		<option value="hotmail.com">hotmail.com</option>
		<option value="icloud.com">icloud.com</option>
	</select>
	</div>
	<div><span v-if="user.userEmail != ''">{{message}}</span></div>
	
	<div>��й�ȣ<span class="clause1"> *</span></div>
	<div><input class="put" type="password" v-model="user.pw1" placeholder="��й�ȣ"></div>
	
	<div>��й�ȣ Ȯ��<span class="clause1"> *</span></div>
	<div><input class="put" type="password" v-model="user.pw2" placeholder="��й�ȣ Ȯ��"></div>
	
	<div>�̸�<span class="clause1"> *</span></div>
	<div><input class="put" type="text" v-model="user.userName" placeholder="�̸�"></div>
	
	<div>�г���<span class="clause1"> *</span></div>
	<div><input class="put" type="text" v-model="user.nick" placeholder="�г���"></div>
	
	<div>�޴��� ��ȣ<span class="clause1"> *</span></div>
	<div><input class="put" type="text" v-model="user.phone" placeholder="�޴��� ��ȣ '-'���� ���ڸ� �Է����ּ���."></div>
	
	<div>�������</div>
	<div>
		<select v-model="user.bYear" class="select">
			<% for(int i=2009; i>=1950; i--){%>
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select> 
		<select v-model="user.bMonth" class="select">
			<% for(int i=1; i<=12; i++){%> 
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select> 
		<select v-model="user.bDay" class="select">
			<% for(int i=1; i<=31; i++){%> 
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select>
	</div>
	<div>����</div> 
	<div>
		���� <input type="radio" v-model="user.gender" value="F">������
		������ <input type="radio" v-model="user.gender" value="M">
	</div>
	
	<hr>
	<div>�������</div>
	<div><label><input type="checkbox" @click="fnAll" v-model="clause"> ��ü����</label></div>
	<div><label><input type="checkbox" v-model="clause"> �� 14�� �̻��Դϴ�<span class="clause1">(�ʼ�)</span></label></div>
	<div><label><input type="checkbox" v-model="clause"> �̿���<span class="clause1">(�ʼ�)</span></label></div>
	<div><label><input type="checkbox" v-model="clause"> ������������ �� �̿뵿��<span class="clause1">(�ʼ�)</span></label></div>
	<div><label><input type="checkbox" v-model="clause"> �̺�Ʈ, ����, Ư�� �˸� ���� �� SMS �� ����<span class="clause2">(����)</span></label></div>
	<hr>
	<div><button @click="fnJoin" class="btn">ȸ������</button></div>

	<div id="login">�̹� ���̵� �����Ű���? <a href="login.do">�α���</a></div>
	
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		user : {
			userEmail1 : "",
			userEmail2 : "",
			pw1 : "",
			pw2 : "",
			userName : "",
			phone : "",
			nick : "",
			bYear : "2009",
			bMonth : "1",
			bDay : "1",
			gender : "F"
		},
		list : [],
		clause : [],
		emailFlg : false,
		nickFlg : false,
		message : ""
	},// data
	methods : {
		fnJoin : function(){
			var self = this;
			if(self.user.userEmail1 == ""){
				alert("�̸����� �Է��ϼ���.");
				return;
			}
			if(self.user.userEmail2 == ""){
				alert("�̸����� �������ּ���.");
				return;
			}
			if(self.user.pw1 == ""){
				alert("��й�ȣ�� �Է��ϼ���.");
				return;
			}
			if(self.user.pw1 != self.user.pw2){
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				return;
			}
			if(self.user.userName == ""){
				alert("�̸��� �Է����ּ���.");
				return;
			}
			if(self.user.nick == ""){
				alert("�г����� �Է����ּ���.");
				return;
			}
			if(self.user.phone == ""){
				alert("�޴��� ��ȣ�� �Է����ּ���.");
				return;
			}
			var regType1 = /^[0-9]+$/;
			if(!regType1.test(self.user.phone) ){
				alert("�޴��� ��ȣ ���ڸ� �Է����ּ���.");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
                }
            });
		},
		fnCheck : function(){
			var self = this;
			var nparmap = {userId : self.user.userEmail};
            $.ajax({
                url : "check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		self.message = "�ߺ��� �̸����Դϴ�.";
                	} else {
                		self.message = "��� ������ �̸����Դϴ�.";
                		self.emailFlg = true;
                	}
                }
            });
		},
		fnNickCheck : function(){
			var self = this;
			var nparmap = {userId : self.user.nick};
            $.ajax({
                url : "nickCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		self.message = "�ߺ��� �г����Դϴ�.";
                	} else {
                		self.message = "��� ������ �г����Դϴ�.";
                		self.emailFlg = true;
                	}
                }
            });
		},
        fnAll : function(){
        	var self = this;
        	/* self.clause = []; */
        }
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>