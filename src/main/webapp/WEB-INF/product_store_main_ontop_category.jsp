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
<title>��ǰ����������</title>
<style>




.product-main-category__image{
	width:100px;
	height:100px;
}


.production-item-thumnail__image{
	width:250px;
	height:250px;
}

.product-main-category__name{
	font-size : 15px;
}
.won_icon,.production-item-price__orginal2{
	text-decoration: line-through;
}

.production-item__content{
	width:220px;
	height:338px;
  	float : left;
	  margin : 50px;
}

#product-main-category__total > li {
        display: inline-block;
        position: relative;
        top: 10px;
      }
#product-main-category__total > li > a {
  display:block; position:relative; padding-bottom:19px;
  margin: 40px;
}
#product-main-category__total > li > a > img {
  width:100px; height:100px;
}
#product-main-category__total > li > a > span {
  position:absolute; bottom:0; left:50%; color:#666; line-height:1.462em; white-space:nowrap; transform:translate(-50%, 0)
}
      
.category-order_toggle{
	float : right;
	margin-right : 100px;
	background-color:#A782C3;
	border: #fff;
	text-align: center;
	border-radius:10px; 
	padding:8px;
	height:35px; 
	width: 100px;
	font-family: 'Pretendard-Regular';
	color :  #fff;
	
	
	
  }
.category-order_toggle:hover {
    background-color:rgb(235, 236, 237);
    transition: 0.7s;
    
}  
.category-order-list {

  list-style-type: none;
  padding: 0;
  margin: 0;
}

.category-order-list li {

  /* ī�װ� ��Ÿ�ϸ� */
  padding: .5em;
  border-bottom: 1px solid #ccc;
}
.category-order-list-container {
	background :  #fff;
   	width: 100px;
   	float : right;
    

}

.aaa {
  color: #A782C3; /* ���ϴ� ���� */
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* �׸��� �߰� */
  font-size: 18px; /* ���ϴ� ũ�� */
  /* �ٸ� ��Ÿ�� �Ӽ��� �߰� ���� */
}


.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* �������� ������ ��� */
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal-card {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
}




</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>

	<div><h1>ī�װ�</h1></div>
	<ul id ="product-main-category__total">
	
		<li>
			<a href="javascript:;">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span>����</span>
	    	</a>
    	</li>
		<li>
			<a href="javascript:;">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span>����</span>
	    	</a>
    	</li>
		<li>
			<a href="javascript:;">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span>�к긯</span>
	    	</a>
    	</li>
		<li>
			<a href="javascript:;">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span>����</span>
	    	</a>
    	</li>
		<li>
			<a href="javascript:;">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span>����/�Ĺ�</span>
	    	</a>
    	</li>
		<li>
			<a href="javascript:;">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span>�ݷ�����</span>
	    	</a>
    	</li>
		
	</ul>
	

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
	el : '#store_main',
	data : {
		list : [],
		item : "",
		showCartModal: false,
		showScrapModal: false,
		userId : '${sessionId}',
		userNick : '${sessionNick}'
		
		

	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {categoryOrderBar : self.categoryOrderBar};
            $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
		},
		


	     fnOrderBy: function (orderBy) {
            var self = this;
            self.categoryOrderBar = orderBy; // ī�װ� ���İ� ����
            self.fnGetList(); // AJAX ��û ������
	     },
	      
	      
	    //�̹��� ���콺 ���������� pulse �ִϸ��̼�
        addPulseAnimation: function(event) {
            event.currentTarget.classList.add('animate__animated', 'animate__pulse');
        },
        removePulseAnimation: function(event) {
            event.currentTarget.classList.remove('animate__animated', 'animate__pulse');
        },
        

        formatPrice: function(price) {
            // õ �������� ��ǥ(,)�� �߰��ϴ� ���Խ� ó��
            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
        
        
        
        // ��� ����
	    openCartModal: function() {
          var self = this;
          self.showCartModal = true;
	    },
	    openScrapModal: function() {
          var self = this;
          self.showScrapModal = true;
	    },
	    // ��� �ݱ�
	    closeModal: function() {
	      this.showCartModal = false;
	      this.showScrapModal = false;
	    },
	    
	    fnMoveCart : function() {
        	location.href = "/product/cart.do";
	    },
	    fnMoveMyPage : function() {
        	location.href = "/mypage.do";
	    }
	        
	        
     }, // methods
	created : function() {
		var self = this;
		self.fnGetList();

	}// created
});
</script>