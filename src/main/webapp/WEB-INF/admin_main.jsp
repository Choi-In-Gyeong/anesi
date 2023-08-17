<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

.admin_header {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 10px 20px;
  background-color: #e0d4c6;
}

.admin_header span {
  margin-left: 10px;
}
.side_menu{
  display : inline-block;
  width : 200px;
  height: 856px;
  background-color: #cec9c3;
  
}
.side_menu div{
 font-size : 15px;
 margin : 10px 45px ;
}
.side_menu div:hover{
 font-weight:bold;
}

.delivery{
  width : 400px;
  height: 200px;
  border-radius : 8px;
  border : 1px solid #424242;
  padding : 7px;
}
.delivery span{
  font-size : 20px;
}
.change{
  width : 400px;
  height: 200px;
  border-radius : 8px;
  border : 1px solid #424242;
  padding : 7px;
}
.change span{
  font-size : 20px;
}
.review{
  width : 400px;
  height: 200px;
  border-radius : 8px;
  border : 1px solid #424242;
  padding : 7px;
}
.review span{
  font-size : 20px;
}
.review span span{
  font-size : 14px;
}
.customer{
  width : 400px;
  height: 200px;
  border-radius : 8px;
  border : 1px solid #424242;
  padding : 7px;
}
.customer span{
  font-size : 20px;
}
.customer span span{
  font-size : 14px;
}

.flex-container1,
.flex-container2{
   display: flex;
   
}

</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<div id="app">
		<header class="admin_header">
		  <h1>�����ڼ���</h1>
			<span>�α���</span>
			<span>�α׾ƿ�</span>
			<span>����</span>
			<span>�Ƴ׽� Ȩ������</span>
		</header>
	
		
    <div class="flex-container1">
		<div class="side_menu">
			<div>��ǰ����</div>
			<div>�Ǹ����</div>
			<div>�������</div>
			<div>���ǰ���</div>
			<div>��۰���</div>
			<div>������</div>
			<div>���ð���</div>
			<div>�˸�����</div>
		</div>
		
		
		<div class="delivery">
			<span>�ֹ�/���</span>
			<hr>
		</div>
		<div class="change">
			<span>��ҿ�û/��ǰ/��ȯ</span>
			<hr>
		</div>
		
		<div class="review">
			<span>����<span>�ֱ� 1���ϱ���</span></span>
			<hr>
		</div>
		<div class="customer">
			<span>����Ȳ<span>�ֱ� 1���ϱ���</span></span>
			<hr>
		</div>
		
    </div>
 
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {

	},// data
	methods : {
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>