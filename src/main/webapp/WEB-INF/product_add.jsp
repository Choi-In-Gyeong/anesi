<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/product_add.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<div id="app">
		<div id="container">
			<div>��ǰ ���</div>
			<div><!-- ī�װ� ���� -->
				<div>ī�װ�</div>
				<div>
					<div></div>
					<div v-if=""></div>
				</div>
			</div>
			<div><!-- ��ǰ ���� -->
				<div>��ǰ ����</div>
				<div>
					<label>
						<span>��ǰ �̸�</span>
						<input v-model="productName">
					</label>
				</div>
				<div>
					<label>
						<span>������</span>
						<input v-model="productPrice">
					</label>
				</div>
				<div>
					<label>
						<span>��ǰ ����</span>
						<input v-model="productPrice">
					</label>
				</div>
			</div>
			<div><!-- �ɼ� �߰� -->
				<div>�ɼ�</div>
				<table>
					<tr>
						<th>�ɼǸ�</th>
						<th>����</th>
						<th>���</th>
					</tr>
					<tr v-for="">
						<td><input v-mode="option.optionName"></td>
						<td><input v-mode="option.optionName"></td>
						<td><input v-mode="option.optionName"></td>
					</tr>
					<tr v-if="">
					
					</tr>
				</table>
				<button @click="fnOptionAdd">�ɼ� �߰�</button>
			</div>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		productName : ""
		option : {
			optionName : "", //�ɼ� �̸�
			productStock : "", // ���
			optionPrice : "",  // �ɼ� ����
		}
		selectOption
	},// data
	methods : {
		fnOptionAdd(){ //�ɼ� �߰� �޼���
			var self = this;
			var param = {};
			$.ajax({
                url : "option/add.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 

                }
            }); 
		}
		fnProduct(){
			var self = this;
			var param = {};
			$.ajax({
                url : "product/add.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
					
                }
            }); 
		}
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>