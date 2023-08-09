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
						<input v-model="product.productName">
					</label>
				</div>
				<div>
					<label>
						<span>������</span>
						<input v-model="product.manufacturer">
					</label>
				</div>
				<div>
					<label>
						<span>��ǰ ����</span>
						<input v-model="product.productPrice">
					</label>
				</div>
			</div>
			<div><!-- �ɼ� �߰� -->
				<div>�ɼ�</div>
				<table>
					<tr>
						<th class="tdthsy">�ɼǸ�</th>
						<th class="tdthsy">����</th>
						<th class="tdthsy">���</th>
						<th class="tdthsy">����</th>
					</tr>
					<tr v-if="optionList.length == 0">
						<td colspan="4" class="tdthsy">�ɼ��� �־��ּ���</td>
					</tr>
					<tr v-for="(item, index) in optionList">
						
						<td class="tdthsy"><input v-model="optionList[index].optionName"></td>
						<td class="tdthsy"><input v-model="optionList[index].productStock"></td>
						<td class="tdthsy"><input v-model="optionList[index].optionPrice"></td>
						<td class="tdthsy"><button @click="fnOptionDelete(index)">����</button></td>
					</tr>
					
					</tr>
				</table>
				<button @click="fnOptionAdd">�ɼ� �߰�</button>
			</div>
			<div> <!-- ��ǰ �̹��� ��� -->
				<div>��ǰ �̹��� ���</div>
				<table>
					<tr>
						<th class="tdthsy">��ǥ�̹���</th>
						<th class="tdthsy">�̹����̸�</th>
						<th class="tdthsy">ø������ ������</th>
						<th class="tdthsy">����</th>
					</tr>
					<tr v-for="(item, index) in productImgList">
						<td class="tdthsy"><input type="radio" v-model="item.thumbnail" value="Y" name="thumbnail"></td>
						<td class="tdthsy"><input v-model="item.orgName"></td>
						<td class="tdthsy"><input type="file"></td>
						<td class="tdthsy"><button @click="fnProductImgDel(index)">����</button></td>
					</tr>
				</table>
				<button @click="fnProductImgAdd">�̹��� �߰�</button>
			</div>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		product : {	//��ǰ ��
			productName : "",
			productPrices : "",
			manufacturer : ""
		},
		optionList : [], // �ɼ� ����Ʈ
		productImgList : [] // ��ǰ �̹��� ����Ʈ
	},// data
	methods : {
		fnOptionAdd(){ //�ɼ� �߰� �޼���
			var self = this;
			self.optionList.push({optionName : "", productStock : "", optionPrice : "",});
		},
		fnOptionDelete(index){
			var self = this;
			self.optionList.splice(index,1);
		},
		fnProductImgDel(index){
			var self = this;
			self.productImgList.splice(index,1);
		},
		fnProductImgAdd(){
			var self = this;
			self.productImgList.push({orgName : "", thumbnail : "N"});
		}
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>