<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css">
<meta charset="EUC-KR">
<title>Footer</title>
<style>
</style>
</head>
<!-- �ּ� �� �����ּ��� �� -->
<body>
	<div id="app">
    <img id="f_img" src="img.png">
    
    <div id="f_part1">
       <div class="����">���ڱ����ŷ� ����ó��</div>
       <div class="����">
           <div>��ȭ 1588-XXXX</div>
           <div><a href="javascript:;">1:1 ���� �ٷΰ���</a></div>
       </div>
   </div>
   
   <div id="f_part1">
       <div class="����">������</div>
       <div class="����">
           <div>������ ��õ�� ���� 89 ���������Ǽ�ȸ��</div>
           <div>wjsghk 1588-XXXX</div>
           <div>��������Ű� 1588-XXXX</div>
           <div><a href="javascript:;">1:1���� �ٷΰ���</a></div>
       </div>
   </div>
   
   <div id="f_part1">
       <div class="����"> ���̹���</div>
       <div class="����">
           <div>����ڵ�Ϲ�ȣ 220-81-62517</div>
           <div>����Ǹž��Ű��ȣ 2006-��õ-0692ȣ</div>
           <div>��ǥ�̻� ���ΰ�</div>
           <span class="rborder">��ȭ 1533-XXXX</span>
           <span>�̸��� XXX@naver.com</span>
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