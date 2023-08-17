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
<!-- ����� ���� CSS-->
<link href="../css/store_main.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>ī�װ��� ��ǰ����������</title>
<style>
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="product_store_main_ontop_category.jsp"></jsp:include>

  <div class="flex-container">
      <span class="main-category__title"></span>
    
     <div class="selectBox2 ">
		  <button class="label">����</button>
		  <ul class="optionList">
		    <li value="LowestPrice"class="optionItem" >���ݳ�����</li>
		    <li value="HighestPrice" class="optionItem">���ݳ�����</li>
		    <li value="NewArrival" class="optionItem">�ֽż�</li>
		    
		    <li class="optionItem">--�������ԡ�--</li>
            <li value="HighestPurchase" class="optionItem">���ų�����</li>
            <li value="HighestScrap" class="optionItem">��ũ��������</li>
            <li value="ManyReview" class="optionItem" >���丹����</li>
		  </ul>
		</div>
	 </div>
	   



	<div id="store_main_byCategory">
	

		<div class="production-item__content" v-for="item in list" >
            <a @click="fnProductView(item.productNo)" class="production-item-thumnail">
                <div class="production-item-thumnail__overlay"></div>
			    <img class="production-item-thumnail__image"
			         alt="�����" :src="item.imgPath + '/' + item.imgName">
		    </a>
		    <div class="production-item-header"  >
			    <span class="production-item-header__brand">{{item.manufacturer}}</span>
			    <span class="production-item-header__name">{{item.productName}}</span>
			    <div class="production-item-header__kind">{{item.categoryName}} 
			    <span class="production-item-header__country">{{item.country}}</span>
			    </div>
		    </div>
			 
		         <span class="production-item-price">
		    
			       	<span class="production-item-price__orginal" v-if="item.discountPrice!=''">
				    ����
				    <span class="won_icon">��</span>
					<span class="production-item-price__orginal2">{{ formatPrice(item.productPrice) }}</span>
			   </span>
			    <!-- production-item-price__sell  : �Ĵ� ���� -->
		       	<div class="production-item-price__sell">
				    <span class="won_icon">��</span>
				    <span class="production-item-price__sell2" v-if="item.discountPrice!=''">{{formatPrice(item.discountPrice)}}</span>
				    <span class="production-item-price__sell2" v-else>{{ formatPrice(item.productPrice) }}</span>
			    </div>
	        </span>
		    <!--  production-item-rating : ����-->
	       <div class="production-item-rating">
	       	<!-- �����-->
		   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
		    <span class="production-item-rating__score">4.5</span>
		   </div>
		   
		  	<!-- ��ٱ��Ϲ�ư-->
            <a v-if="userId!=''">
                <i @click="fnInsertUserCart(item)" v-if="!(cartList.includes(item.productNo))" class="fa fa-shopping-cart modal-toggle-button" ></i>
                <i @click="fnUpdateUserCart(item)" v-if="cartList.includes(item.productNo)" class="fa fa-shopping-cart modal-toggle-button" ></i>
            </a>
            <!-- ������ȣ�� ������, �α���ȭ������ ��ȯ-->
            <a v-else>
                <i @click="fnAddNonUserCart(item)" v-if="!(nonuserCartList.includes(item.productNo))" class="fa fa-shopping-cart modal-toggle-button" ></i>
                <i @click="fnUpdateUserCart(item)" v-if="nonuserCartList.includes(item.productNo)" class="fa fa-shopping-cart modal-toggle-button" ></i>
            </a>
            <!-- �����ϱ��ư-->
            <a><i class="fa-solid fa-share-nodes"></i></a>
            <!-- ��ũ����ư-->
            <a v-if="userId!=''">
                <i @click="fnInsertScrapbook(item)" v-if="!(scrapbookList.includes(item.productNo))" class="fa-regular fa-bookmark modal-toggle-button"></i>
                <i @click="fnDeleteScrapbook(item)" v-if="scrapbookList.includes(item.productNo)"class="fa-regular fa-solid fa-bookmark"></i>
            </a>
            <a v-else>
                <i @click="openScrapModal"class="fa-regular fa-bookmark modal-toggle-button"></i>
            </a>
    	    </div> <!-- class="production-item__content" ��-->
	    
	    
    	<div class="modal" v-if="showCartModal" >
		  <div class="modal-card">
		    <h2>��ٱ��Ͽ� �߰�</h2>
		    <p>��ǰ�� ��ٱ��Ͽ� ��ҽ��ϴ�.��ٱ��Ϸ� �̵��Ͻðڽ��ϱ�?</p>
		    <button @click="closeModal">���ΰ���ϱ�</button>
		    <button @click="fnMoveCart" >��ٱ��Ϸ� �̵��ϱ�</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModal">
		  <div class="modal-card"  v-if="userId!=''">
		    <h2>��ũ���Ͽ� ���</h2>
		    <p>��ǰ�� ��ũ���Ǿ����ϴ�.</p>
		    <button @click="closeModal">���ΰ���ϱ�</button>
		    <button @click="fnMoveScrapbook">��ũ�������� �̵��ϱ�</button>
		  </div>
		  
		  <div class="modal-card"  v-else>
		    <h2>�α����� ��� �����մϴ�.</h2>
		    <p>�α����Ͻðڽ��ϱ�?</p>
		    <button @click="closeModal">���ΰ���ϱ�</button>
		    <button @click="fnMoveLoginPage">�α����������� �̵��ϱ�</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapDeleteModal">
		  <div class="modal-card">
		    <h2>��ũ���Ͽ��� �����Ǿ����ϴ�.</h2>
		    <button @click="closeModal">���ΰ���ϱ�</button>
		    <button @click="fnMoveScrapbook">��ũ�������� �̵��ϱ�</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModalBan">
		  <div class="modal-card">
		    <h2>�̹� ����ǰ�Դϴ�.</h2>
		    <p>��ũ������ Ȯ�����ּ���</p>
		    <button @click="closeModal">���ΰ���ϱ�</button>
		    <button @click="fnMoveMyPage">��ũ�������� �̵��ϱ�</button>
		  </div>
		</div>
	
	    
    </div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
<script>

$(document).ready(function() {
    // ��ǰ���� ��ư Ŭ�� �̺�Ʈ �߰�
    var isListOpen = false; // Flag to track the state of the list container

    $('.category-order_toggle').click(function() {
        if (!isListOpen) { // ���� ����� �����ִ� ��쿡�� ����
            $('.category-order-list-container').slideDown('slow');
            isListOpen = true;
        }
    });

    // ��� �׸� Ŭ�� �̺�Ʈ �߰�
    $('.category-order-list a').click(function() {
        // ��� �׸��� Ŭ���ϸ� ����� �ݽ��ϴ�.
        $('.category-order-list-container').slideUp('slow');
        isListOpen = false;
    });
});

var app = new Vue({
	el : '#store_main_byCategory',
	data : {
		list : [],
		list2 : [],
		item : "",
		item2 : "",
		showCartModal: false,
		showScrapModal: false,
		showScrapModalBan: false,
		showScrapDeleteModal: false,
		userId : '${sessionId}',
		userNick : '${sessionNick}',
		userNo : '${sessionNo}',
		categoryNo : '${map.no}',
		categoryName : "",
		productNo : "",
		scrapbookList : [],
		cartList : [],
		nonuserCartList : []
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {categoryOrderBar : self.categoryOrderBar, 
		            		categoryNo : self.categoryNo, 
		            		categoryName : self.categoryName,
		            		productNo : self.productNo};
            $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	self.list2 = data.list2;
                	console.log(self.list2.categoryNo);
                }
            }); 
		},
	     fnOrderBy: function (orderBy) {
            var self = this;
            self.categoryOrderBar = orderBy; // ī�װ� ���İ� ����
            self.fnGetList(); // AJAX ��û ������
	     },
	     formatPrice: function(price) {
	            // 100�� �ڸ����� �����Ͽ� ǥ���ϸ� õ �������� ��ǥ(,)�� �߰��մϴ�.
	            const truncatedPrice = Math.floor(price / 100) * 100;
	            return truncatedPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
	    openScrapDeleteModal: function() {
          var self = this;
          self.showScrapDeleteModal = true;
	    },
	    // ��� �ݱ�
	    closeModal: function() {
	      this.showCartModal = false;
	      this.showScrapModal = false;
	      this.showScrapModalBan = false;
	      this.showScrapDeleteModal = false;
	      location.reload();
	    },
	    //��޿��� �������̵� �Լ�
	    fnMoveCart : function() {
        	location.href = "/product/cart.do";
	    },
	    fnMoveMyPage : function() {
        	location.href = "/mypage.do";
	    },
	    fnMoveLoginPage : function() {
        	location.href = "/login.do";
	    },
	    
	    fnCheckCart : function(item) {
	    	var self = this;
            var nparmap = {userNo: self.userNo};           
            $.ajax({
                url : "/product/selectCartList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	for(let i=0; i<data.list.length;i++){
	                	if(self.userNo != '' && self.userNo != null) {
	                        self.cartList.push(data.list[i].productNo.toString());
	                	}else{
	                        self.nonuserCartList.push(data.list[i].productNo.toString());
	                	}
                     }
                   }
            }); 
		},
		
	   fnInsertUserCart : function(item) {
	    	var self = this;
            var nparmap = { userNo: self.userNo, productNo: item.productNo};
            $.ajax({
                url : "/product/insertCart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	/* alert("��Ͽ�"); */
                   console.log(self.userNo);
                }
            }); 
            self.openCartModal();
            console.log(self.showCartModal);
		}, 
	    fnUpdateUserCart : function(item) {
	    	var self = this;
            var nparmap = { userNo: self.userNo, productNo: item.productNo};
            $.ajax({
                url : "/product/addCartCnt.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 

                }
            }); 
            self.openCartModal();
            console.log(self.showCartModal);

		}, 
		fnCheckScrap : function(item) {
	    	var self = this;
            var nparmap = {userNo: self.userNo};
            $.ajax({
                url : "/product/selectScrapList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	for(let i=0; i<data.list.length;i++){
                        self.scrapbookList.push(data.list[i].productNo.toString());
                     }
                }
            }); 
            
		},
	    fnInsertScrapbook : function(item) {
	    	var self = this;
            var nparmap = { userNo: self.userNo, productNo: item.productNo};
           
            $.ajax({
                url : "/product/insertScrap.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
                }
            }); 
            self.openScrapModal();
            console.log(self.showScrapModal);
		},
	    fnDeleteScrapbook : function(item) {
	    	var self = this;
            var nparmap = { userNo: self.userNo, productNo: item.productNo};
           
            $.ajax({
                url : "/product/deleteScrap.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                }
            }); 
            self.openScrapDeleteModal();
            console.log(self.showScrapModal);
		},
		//'��ǰ�󼼺���' ������ �̵�
		fnProductView : function(productNo){
	    	var self = this;
	    	   $.pageChange("/product/view.do",{no : productNo});//�����ʿ������ �Ķ���� ������{}
		},
		
		//��ȸ�� ��ȣ ��Ű�ҷ����� �� 
		fnaaa : function(item){
			var self = this;
            var nparmap = '';
            //{ nonuserNo: self.nonuserNo, productNo: item.productNo};
			 $.ajax({
	                url : "/nonUserCookie.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.nonuserNo = data.value;
	                    console.log(self.nonuserNo);
	                }
	            }); 
		},
		//��ȸ�� ��ٱ��� �߰�
		fnAddNonUserCart : function(item) {
	    	var self = this;
            var nparmap = 
            	{nonuserNo: self.nonuserNo, productNo: item.productNo}
            console.log(self.nonuserNo);
            $.ajax({
                url : "/product/addNonUserCart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                }
            }); 
            self.openCartModal();
            console.log(self.showCartModal);
		}

     }, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnCheckCart();
		self.fnCheckScrap();
		self.fnaaa();
	}// created
});




</script>