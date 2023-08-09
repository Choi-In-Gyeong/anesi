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
			<div class="productTitleAdd"><h1>��ǰ ���</h1></div> 
			<div class="box"><!-- ī�װ� ���� -->
				<div>ī�װ�</div>
				<div>
					<div></div>
					<div v-if=""></div>
				</div>
			</div>
			<div class="box"><!-- ��ǰ ���� -->
				<div><h3>��ǰ ����</h3> <span class="err"> {{errMsg1}}</span></div>
				<div>
					<div>��ǰ �̸�</div>
					<input v-model="product.productName">
				</div>
				<div>
					<div>������</div>
					<input v-model="product.manufacturer">
				</div>
				<div>
					<div>������</div>
					<input v-model="product.country">
				</div>
				<div>
					<div>��ǰ ����</div>
					<input v-model="product.productPrice">
				</div>
			</div>
			<div class="box"><!-- �ɼ� �߰� -->
				<div><h3>�ɼ�</h3></div>
				<button @click="fnOptionAdd" class="btn">�ɼ� �߰�</button>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">�ɼǸ�</th>
						<th class="tdthsy">����</th>
						<th class="tdthsy">���</th>
						<th class="tdthsy">����</th>
					</tr>
					<tr v-if="optionList.length == 0">
						<td colspan="4" class="tdthsy">�ɼ��� �߰��� �ּ���</td>
					</tr>
					<tr v-for="(item, index) in optionList">
						
						<td class="tdthsy"><input v-model="optionList[index].optionName"></td>
						<td class="tdthsy"><input v-model="optionList[index].productStock"></td>
						<td class="tdthsy"><input v-model="optionList[index].optionPrice"></td>
						<td class="tdthsy"><button @click="fnOptionDelete(index)" class="delBtn">����</button></td>
				</table>
			</div>
			<div class="box"> <!-- ��ǰ �̹��� ��� -->
				<div><h3>��ǰ �̹���<span class="guide"> ��ǰ �̹����� �ִ� 5�� �Դϴ�.</span></h3></div>
				<button @click="fnProductImgAdd" class="btn">�̹��� �߰�</button><span class="err">{{errMsg2}}</span>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">��ǥ �̹���</th>
						<th class="tdthsy">�̹��� �̸�</th>
						<th class="tdthsy">�̹��� ����</th>
						<th class="tdthsy">����</th>
					</tr>
					<tr v-if="productImgList.length == 0">
						<td colspan="4" class="tdthsy">�̹����� �߰��� �ּ���</td>
					</tr>
					<tr v-for="(item, index) in productImgList">
						<td class="tdthsy"><input type="radio" v-model="item.thumbnail" value="Y" name="thumbnail"></td>
						<td class="tdthsy"><input v-model="item.orgName"></td>
						<td class="tdthsy"><label class="fileBox">���ϼ���<input type="file" @change="fnOnFileChange" class="fileBtn"></label></td>
						<td class="tdthsy"><button @click="fnProductImgDel(index)" class="delBtn">����</button></td>
					</tr>
				</table>
				<div class="imgDiv">
					<span v-for="item in imageList"><img v-if="item" :src="item" alt="Image preview" class="pvImg"></span>
				</div>
			</div>
				<div class="box"> <!-- ��ǰ �󼼼��� �̹��� ��� -->
				<div><h3>��ǰ �󼼼��� �̹���</h3><span class="guide"></span></div> 
				<button @click="fnContentImgAdd" class="btn">�̹��� �߰�</button>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">�̹��� ����</th>
						<th class="tdthsy">����</th>
					</tr>
					<tr v-if="contentImgList.length == 0">
						<td colspan="4" class="tdthsy">�̹����� �߰��� �ּ���</td>
					</tr>
					<tr v-for="(item, index) in contentImgList">
						<td class="tdthsy"><input type="file"></td>
						<td class="tdthsy"><button @click="fnContentImgDel(index, event)" class="delBtn">����</button></td>
					</tr>
				</table>
			</div>
			<button @click="" class="addBtn">�Ǹŵ��</button>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		errMsg1 : "", // �����޽���1
		errMsg2 : "", // �����޽���1
		product : {	//��ǰ ��
			productName : "",
			productPrices : "",
			manufacturer : "",
			country : ""
		},
		optionList : [], // �ɼ� ����Ʈ
		productImgList : [], // ��ǰ �̹��� ����Ʈ
		contentImgList : [], // ��ǰ ���̹��� ����Ʈ
		imageList : [], // ��ǰ �̹�������Ʈ
		categoryList1 : [],
		categoryList2 : []
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
			self.imageList.splice(index,1);
			self.errMsg2 = "";
		},
		fnProductImgAdd(){
			var self = this;
			if(self.productImgList.length < 5){
				self.productImgList.push({orgName : "", thumbnail : "N"});
			} else {
				self.errMsg2 = '��ǰ �̹����� �ִ� 5������ �Դϴ�.';
			}
		},
		fnContentImgAdd(){
			var self = this;
			self.contentImgList.push({orgName : "", thumbnail : "D"});
		},
		fnContentImgDel(index){
			var self = this;
			self.contentImgList.splice(index,1);
		},
		fnOnFileChange(event, index) {
			var self = this;
			self.errMsg2 = "";
		    const file = event.target.files[0];	
		    if (file) {
		      self.imageList.splice(index,1)
		      self.imageList.push(URL.createObjectURL(file));
		    }
		},
		fnGetcategoryList1(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "category.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.categoryList1 = data.list;
                	console.log(self.categoryList1)
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetcategoryList1();
	}// created
});
</script>