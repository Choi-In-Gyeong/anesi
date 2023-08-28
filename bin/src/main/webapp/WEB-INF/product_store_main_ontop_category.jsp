<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>��������ī�װ�</title>
<style>
#product-main-category__total{
	padding : 0px 0px 0px 0px;
    margin-top: -25px;

}
#store-main-ontop-category__container{
	margin-top: 200px;
}
#product-main-category__total > li {
        display: inline-block;
        position: relative;
        top: 10px;
}
#product-main-category__total > li > a {
	display: block;
    position: relative;
    padding-bottom: 30px;
    margin: 33px 58px;
    width: 100px;
    height: 130px;
}
#product-main-category__total > li > a > span {
	position: absolute;
    bottom: 19px;
    left: 50%;
    color: #666;
    line-height: 1.462em;
    white-space: nowrap;
    transform: translate(-50%, 0);
    font-size: 15px;
}
.aaa {
  color: #A782C3; 
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); 
}
.category_name{

    font-size: 20px;
    font-weight: bold;
    color: #A782C3; /* ���ϴ� ���� */
}
#c_name1:hover,
#c_name2:hover,
#c_name3:hover,
#c_name4:hover,
#c_name5:hover,
#c_name6:hover{

  color: #A782C3;
}
.title1{
	margin-left: 35px;
}
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
<div id="store-main-ontop-category__container">
	<div class="title1"><h1>ī�װ�</h1></div>
	<ul id ="product-main-category__total">
	 <li v-for="(category, index) in categories" :key="category.id" @click="fnMoveaa(category.id)">
        <a @click="addPulseAnimation(index)">
          <img :src="category.image" :class="{ 'animate__animated': category.animated, 'animate__pulse' : category.animated}" @mouseover="addPulseAnimation(index)" @mouseleave="removePulseAnimation(index)">
          <span :class="{ 'aaa': category.animated }">{{ category.name }}</span>
        </a>
      </li>
	</ul>
</div>
</body>
</html>
<script>

$(document).ready(function() {
    // ��ǰ���� ��ư Ŭ�� �̺�Ʈ �߰�
    $('.category-order_toggle').click(function() {
       $('.category-order-list-container').slideToggle('fast');
    });
});


var app = new Vue({
	el : '#store-main-ontop-category__container',
	data : {
		list : [],
		item : "",
		showCartModal: false,
		showScrapModal: false,
		userId : '${sessionId}',
		userNick : '${sessionNick}',
		categories : [
			{ id: '10', name: '����', image: '../css/image/productMain/furniture.png', animated: false },
			{ id: '20', name: '����', image: '../css/image/productMain/light.png', animated: false },
			{ id: '30', name: '�к긯', image: '../css/image/productMain/pillows.png', animated: false },
			{ id: '40', name: '����', image: '../css/image/productMain/washing-machine2.png', animated: false },
			{ id: '50', name: '����/�Ĺ�', image: '../css/image/productMain/plant2.png', animated: false },
			{ id: '60', name: '�ݷ�����', image: '../css/image/productMain/pet.png', animated: false },
		]
		

	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {categoryOrderBar : self.categoryOrderBar};
            /* $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            });  */
		},
		


	      
	    //�̹��� ���콺 ���������� pulse �ִϸ��̼�
        addPulseAnimation: function(index) {
        	 this.categories[index].animated = true;
        },
        removePulseAnimation: function(index) {
        	 this.categories[index].animated = false;
        },
        

    	//�̹��� ���콺 ���������� pulse �ִϸ��̼�
       addPulseAnimation: function(index) {
       	 this.categories[index].animated = true;
       },
       removePulseAnimation: function(index) {
       	 this.categories[index].animated = false;
       },
       
       
     
   	 	//category �������� �޴����� �迭����
      fnMoveaa : function(item){
            var self = this;
         $.pageChange("/product/storemain_byCategory.do",{no : item});//�����ʿ������ �Ķ���� ������{}
      }

    
 
        
    
        
    }, // methods
	created : function() {
		var self = this;
		self.fnGetList();

	}// created
});
</script>