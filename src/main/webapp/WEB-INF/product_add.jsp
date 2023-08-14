<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
				<div><h3>ī�װ�</h3><span class="err"> {{errMsg5}}</span></div>
				<div class="categoryAllBox">
					<div class="category1">
						<a v-for="item in categoryList1" class="categoryBox" @click="fnGetcategoryList2(item)">
						    <span v-if="category1No == item.categoryNo" class="categoryNo">{{item.categoryName}}</span>
						    <span v-else>{{item.categoryName}}</span>
							<span><i class="fa-solid fa-greater-than fa-2xs icon1" style="color: #ccc"></i></span>
						</a>
					</div>
					<div class="category2" v-if="categoryList2.length != 0">
						<a v-for="item in categoryList2" class="categoryBox" @click="fnSetCategory(item)">
							<span v-if="product.category == item.categoryNo" class="categoryNo">{{item.categoryName}}</span>
							<span v-else>{{item.categoryName}}</span>
						</a>
					</div>
				</div>
				<div>������ ī�װ� : {{category1Name}} > {{category2Name}}</div>
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
					<input v-model="product.productPrices">
				</div>
				<div>
					<div>������</div>
					<input v-model="product.discount">
				</div>
			</div>	
			<div class="box"><!-- �ɼ� �߰� -->
				<div><h3>�ɼ�<span class="guide"> ��ǰ �ɼ��� �ִ� 5�� �Դϴ�.</span></h3></div>
				<button @click="fnOptionAdd" class="btn">�ɼ� �߰�</button><span class="err">{{errMsg3}}</span>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">�ɼǸ�</th>
						<th class="tdthsy">����������</th>
						<th class="tdthsy">���</th>
						<th class="tdthsy">����</th>
					</tr>
					<tr v-if="optionList.length == 0">
						<td colspan="4" class="tdthsy">�ɼ��� �߰��� �ּ���</td>
					</tr>
					<tr v-for="(item, index) in optionList">
						
						<td class="tdthsy"><input v-model="optionList[index].optionName"></td>
						<td class="tdthsy"><input v-model="optionList[index].optionPrice"></td>
						<td class="tdthsy"><input v-model="optionList[index].productStock"></td>
						<td class="tdthsy"><button @click="fnOptionDelete(index)" class="delBtn">����</button></td>
				</table>
			</div>
			<div class="box"> <!-- ��ǰ �̹��� ��� -->
				<div id="productImgT"><h3>��ǰ �̹���<span class="guide"> ��ǰ �̹����� �ִ� 5�� �Դϴ�.</span></h3></div>
				<button @click="fnProductImgAdd" class="btn">�̹��� �߰�</button><span class="err">{{errMsg2}}</span>
				<table class="tableStyle productImg">
					<tr>
						<th class="tdthsy">��ǥ �̹���</th>
						<th class="tdthsy">�̹��� ����</th>
						<th class="tdthsy">����</th>
						<th class="tdthsy">�̹���</th>
					</tr>
					<tr v-if="productImgList.length == 0">
						<td colspan="4" class="tdthsy">�̹����� �߰��� �ּ���</td>
					</tr>
					<tr v-for="(item, index) in productImgList">
						<td class="tdthsy"><input type="radio" v-model="item.thumbnail" value="Y" name="thumbnail"></td>
						<td class="tdthsy"><label class="fileBox">���ϼ���<input type="file" @change="fnOnFileChange($event, index)" class="fileBtn" name="file1"></label></td>
						<td class="tdthsy"><button @click="fnProductImgDel(index)" class="delBtn">����</button></td>
						<td class="imgDiv"><img v-if="imageList[index]" :src="imageList[index]" alt="Image preview" class="pvImg"></td>
					</tr>
				</table>
			</div>
				<div class="box"> <!-- ��ǰ �󼼼��� �̹��� ��� -->
				<div><h3>��ǰ �󼼼��� �̹���<span class="guide"> ��ǰ �� �̹����� �ִ� 5�� �Դϴ�.</span></h3><span class="guide"></span></div> 
				<button @click="fnContentImgAdd" class="btn">�̹��� �߰�</button><span class="err">{{errMsg4}}</span>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">�̹��� ����</th>
						<th class="tdthsy">����</th>
						<th class="tdthsy">�̹���</th>
					</tr>
					<tr v-if="contentImgList.length == 0">
						<td colspan="4" class="tdthsy">�̹����� �߰��� �ּ���</td>
					</tr>
					<template v-for="(item, index) in contentImgList">
						<tr>
							<td class="tdthsy"><label class="fileBox">���ϼ���<input type="file" @change="fnOnFileChange2($event, index)" class="fileBtn"></label></td>
							<td class="tdthsy"><button @click="fnProductImgDel2(index)" class="delBtn">����</button></td>
							<td class="imgDiv content"><img v-if="imageList2[index]" :src="imageList2[index]" alt="Image preview" class="pvImg" ref="image" required></td>
						</tr>
					</template>
				</table>
			</div>
			<button @click="fnProductAdd" class="addBtn">�Ǹŵ��</button>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		errMsg1 : "", // ��ǰ ���� �����޼���
		errMsg2 : "", // ��ǰ �̹��� ���� �޼���
		errMsg3 : "", // ��ǰ �ɼ� ���� �޼���
		errMsg4 : "", // ��ǰ �� �̹��� ���� �޼���
		errMsg5 : "", // ī�װ� ���� �޼���
		product : {	//��ǰ ��
			productName : "",
			productPrices : "",
			manufacturer : "",
			country : "",
			discount : "",
			category : "",
			discountYn  : ""
		},
		optionList : [], // �ɼ� ����Ʈ
		productImgList : [], // ��ǰ �̹��� ����Ʈ
		contentImgList : [], // ��ǰ ���̹��� ����Ʈ
		imageList : [], // ��ǰ �̹�������Ʈ
		imageList2 : [], // ��ǰ �� �̹��� ����Ʈ
		categoryList1 : [], //ī�װ� ��з�
		categoryList2 : [], //ī�װ� ��з�
		category1Name : "",
		category2Name : "",
		category1No : "",
		fileList : [],
		fileList2 : [],
		productInfo : {},
	},// data
	methods : {
		fnTest(){

		},
		fnOptionAdd(){ //�ɼ� �߰� �޼���
			var self = this;
			if(self.optionList.length < 5){
				self.optionList.push({optionName : "", productStock : "", optionPrice : "",});
			} else{
				self.errMsg3 = '��ǰ �ɼ��� �ִ� 5������ �Դϴ�.';
			}
		},
		fnOptionDelete(index){ //�ɼ� ����
			var self = this;
			self.optionList.splice(index,1);
		},
		fnProductImgDel(index){
			var self = this;
			self.fileList.splice(index,1);
			self.productImgList.splice(index,1);
			self.imageList.splice(index,1);
			self.errMsg2 = "";
		},
		fnProductImgDel2(index){
			var self = this;
			self.contentImgList.splice(index,1);
			self.imageList2.splice(index,1);
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
			if(self.contentImgList.length < 5){
				self.contentImgList.push({orgName : "", thumbnail : "D"});
			} else {
				self.errMsg4 = '��ǰ �� �̹����� �ִ� 5������ �Դϴ�.';
			}
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
	    	  self.fileList.splice(index,1);
		      self.fileList.splice(index,0,file);
		      self.imageList.splice(index,1);
		      self.imageList.splice(index,0,URL.createObjectURL(file));
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
                }
            });
		},
		fnGetcategoryList2(item){
			var self = this;
			var nparmap = {no : item.categoryNo};
			self.category1Name = item.categoryName;
			self.category1No = item.categoryNo;
            $.ajax({
                url : "category2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.categoryList2 = data.list;
                }
            });
		},
		fnSetCategory(item){
			var self = this;
			self.category2Name = item.categoryName;
			self.product.category = item.categoryNo;
		},
		fnOnFileChange2(event, index) {
			var self = this;
			self.errMsg2 = "";
		    const file = event.target.files[0];	
		    if (file) {
	    	  self.fileList2.splice(index,1);
		      self.fileList2.splice(index,0,file);
		      self.imageList2.splice(index,1)
		      self.imageList2.splice(index,0,URL.createObjectURL(file));
		    }
		},
		fnProductAdd(){
			var self = this;
			if(self.product.category == ''){
				self.errMsg5 = 'ī�װ��� �������ּ���';
				window.scrollTo({
			        top: 0,
			        behavior: 'smooth',
			      });
				return;
			}
			self.errMsg5 = '';
			if(self.product.productName == '' || self.product.productPrices == '' || self.product.manufacturer == '' || self.product.country == '' || self.product.discount == ''){
				self.errMsg1 = '��� ������ �Է����ּ���';
				var box = document.querySelector(".box");
				var top = box.offsetTop;
			  	window.scrollTo({
			    	top: 200,
			        behavior: 'smooth',
			      });
				return;
			}
			self.errMsg1 = '';
			if(self.imageList.length == 0){
				self.errMsg2 = '�̹����� �ּ� 1�� �߰����ּ���'
					return;
			}
			self.errMsg2 = '';
			if(self.imageList2.length == 0){
				self.errMsg4 = '�� �̹����� �ּ� 1�� �߰����ּ���'
					return;
			}
			self.errMsg4 = '';
			if(self.productImgList.length != self.fileList.length){
				self.errMsg2 = '�̹����� ä���ּ���.';
				return;
		    }
			self.errMsg2 = '';
			if(self.contentImgList.length != self.fileList2.length){
				self.errMsg4 = '�� �̹����� ä���ּ���.';
				return;
			}
			self.errMsg4 = '';
			self.fnAdd();
		},
		addProductAsync() {
			return new Promise((resolve, reject) => {
				var self = this;
				self.product.discountYn = self.product.discount == 0 ? 'N' : 'Y';
				var nparmap = self.product;
				
				$.ajax({
		    		url : "/addProduct.dox",
	                dataType:"json",	
	                type : "POST",
			      	data: nparmap,
			      	success: function (response) {
			      		resolve(response);
			      	},
			      	error: function (error) {
			      		reject(error);
			      	}
		    	});
			});
		},
		insertSearchProductAsync() {
			return new Promise((resolve, reject) => {
				var self = this;
				var nparmap = self.product;
				
				$.ajax({
			    		url : "../insertSearchProduct.dox",
		                dataType:"json",	
		                type : "POST",
				      	data: nparmap,
				      	success: function (response) {
				      		resolve(response);
				      	},
				      	error: function (error) {
				      		reject(error);
				      	}
		      	});
			});
		},
		async fnAdd() {
			try {
				var addProductResponse = await this.addProductAsync();
				var insertSearchResponse = await this.insertSearchProductAsync();
				
				this.productInfo = insertSearchResponse.info;
				
				for(let i=0; i<this.optionList.length; i++){
					this.fnAddOption(this.productInfo.productNo, this.optionList[i]);
				}
				
				for(let i=0; i<this.productImgList.length; i++){
					var form = new FormData();
					form.append("file1", this.fileList[i]);
					form.append("productNo", this.productInfo.productNo);
					form.append("thumbnailYn", this.productImgList[i].thumbnail);
					await this.upload(form);
				}
				
				for(let i=0; i<this.contentImgList.length; i++){
					var form = new FormData();
					form.append("file1", this.fileList2[i]);
					form.append("productNo", this.productInfo.productNo);
					form.append("thumbnailYn", this.contentImgList[i].thumbnail);
					await this.upload(form);
				}
				
				// ��� �۾��� �Ϸ�Ǿ��� ���� ó��
			} catch (error) {
				// ���� ó��
			}
		},
		upload(form) {
			return new Promise((resolve, reject) => {
				$.ajax({
			      	url: "../fileUpload.dox",
			      	type: "POST",
			      	processData: false,
			      	contentType: false,
			      	data: form,
			      	success: function (response) {
			      		resolve(response);
			      	},
			      	error: function (error) {
			      		reject(error);
			      	}
		    	});
			});
		},
	    fnAddOption(productNo, info){
	    	var self = this;
	    	var nparmap = {productNo, productStock : info.productStock, optionPrice : info.optionPrice, optionName : info.optionName}
	    	$.ajax({
		       url: "../addOption.dox",
		       dataType: "json",
		       type: "POST",
		       data: nparmap,
		       success: function (response) {
		      	},
	    	});
	    },
	}, // methods
	created : function() {
		var self = this;
		self.fnGetcategoryList1();
	}// created
});
</script>