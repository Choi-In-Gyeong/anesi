<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/scrapbook.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>

	<div id="app">
		<div id="container">
			<h2>��ũ����</h2>
			<div id="inner">
				<div><img alt="������" src="../css/image/pfimgG2.png" class="pfSytle"></div>
				<div class="nickStyle">{{userNick}}</div>
				<div class="allTextBox">
					<div class="allText">��ǰ({{list.length}})</div>
				</div>
				<div class="editText">����</div>
				
				<div v-if="list.length == '0'" class="nonList">
					<div>���� ��ũ����</div>
					<div>��ǰ�� �����ϴ�.</div>
					<div class="nonListText">������ ��� ��ǰ�� �߰��ϸ� ��ũ���غ�����.</div>
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
		userNo : '${sessionNo}',
		userId : '${sessionId}',
		userNick : '${sessionNick}',
		list : []
	},// data
	methods : {
		getSbList(){
			var self = this;
			var nparmap = {userNo : self.userNo};
            $.ajax({
                url : "scrapbook/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		self.getSbList();
	}// created
});
</script>