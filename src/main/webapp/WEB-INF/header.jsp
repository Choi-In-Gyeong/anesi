<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<!--�ڵ��˻����  -->
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">

<link href="../css/Header.css" rel="stylesheet">
<link href="../css/mainCss.css" rel="stylesheet">

<style>
/* ��Ӵٿ� �޴��� ������ ���� */

.category1{
	width: 150px;
	border-left: 1px solid #e8e8e8;
	border-right: 1px solid #e8e8e8;
	border-bottom: 1px solid #e8e8e8;
	background-color: #fff;
}
.category2{
	width: 150px;
	border-right: 1px solid #e8e8e8;
	border-bottom: 1px solid #e8e8e8;
	background-color: #fff;
}
.categoryAllBox{
	display: inline-block;
	width: 300px;
	position: absolute;
	top: 155px;
	z-index: 1000;
	position: fixed;
	
}
.categoryAllBox2{
	display: flex;
	
}
.category-box{
	font-size: 15px; 
	padding-bottom: 10px;
	padding-top: 10px;
}
.categoryBox{
	padding: 10px 40px 10px 0;
}
.categoryNo{
	margin-left: 10px;
	font-family:'Pretendard-Regular';
}
.nav1{
	width: 100%;
	height: 70px;
	border-bottom: 1px solid #e8e8e8;
	border-top: 1px solid #e8e8e8;
}
.nav-left{
	display: inline-block;
	float: left;
	height: 40px;
	margin-top: 5px;
}
.nav-left button{
	height: 100%;
}
.nav-mid{
	display: inline-block;
}
.search-container{
	display: inline-block;
	float: left;
}
.category-title{
	font-size: 16px;
	font-weight: 600;
	font-family:'Pretendard-Regular';
	margin-left: 4px;
	color: #424242;
}
.navi-wrap{
	position: relative;
	width: 500px;
	float: right;
	height: 100px;
}
.flow-container{
	margin-top: 52px;
	clear: both;
}
</style>
</head>
<body>
<% 
    boolean isLoggedIn = false;
    Object sessionNo = session.getAttribute("sessionNo");
    if (sessionNo != null) {
        isLoggedIn = true;
    }
%>
<div id="app1">
	<header>
	
		<span> <a href="/main.do"><img class="logo"
				src="../css/image/anesilogo.png" /> </a></span> <a class="aaa"
			href="/product/storemain.do">�����</a> <a class="bbb"
			href="/community/main.do">Ŀ�´�Ƽ</a> <a class="ccc" href="/used/main.do">�߰�����</a>
		<div class="navi-wrap"> 
			<ul id="header_navi">
				<li id="login-button">
					<a href="#" id="login-button-link">
						<i class="fa-solid fa-door-open"></i>
					</a>
					<span class="fon" id="login-button-text"></span>
				</li>
				<li>
					<a href="../join.do">
						<i class="fa-solid fa-user-plus "></i>
					</a>
					<span class="fon">ȸ������</span>
				</li>
				<li>
					<a href="../mypage.do">
						<i class="fa-solid fa-user "></i>
					</a>
					<span class="fon">����������</span>
				</li>
				<li>
					<a href="http://localhost:8080/scrapbook.do">
						<i class="fa-solid fa-bookmark "></i>
					</a>
					<span></span>
				</li>
				<li>
					<a>
						<i class="fa-solid fa-bell "></i>
					</a>
					<span></span>
				</li>
				<li>
					<a href="../product/cart.do">
						<i class="fa fa-shopping-cart "></i>
					</a>
					<span></span>
				</li>
				<li>
					<a href="" class="headerbtn" title="Button fade blue/green"class="button btnFade btnBlueGreen">Fade</a>
				</li>
			</ul>
		</div>
		<div class="nav1">
			<div class="nav-left">
				<button class="category-toggle" @mouseover="categoryFlg">
					<span> <i class="fa-solid fa-bars" style="color: #47608a; font-size : 20px;"></i> <span class="category-title">ī�װ�</span></span>
				</button> 
				<span class="headerfont">
					<a class="href">��õ </a>
					<a class="href">��ŷ</a>
					<a class="href">Ư��</a> 
					<a class="href">��ȹ��</a> 
					<a class="href">�귣���</a>
				</span>
			</div>
			<div class="search-container">
				 <input type="text" id="search_input" placeholder="��ǰ���� �Է��ϼ���">
				 <a id="glass" class="glass"><i class="fa-solid fa-magnifying-glass"></i></a>
				 <div id="recent_search" class="recent-search-container" style="display: none;"></div>
			</div>
			<div class="flow-container">
		        <div class="flow-text">
		            <div class="flow-wrap">Hello! Welcome to our ANESI </div>
		            <div class="flow-wrap">Hello! Welcome to our ANESI </div>
		            <div class="flow-wrap">Hello! Welcome to our ANESI </div>
		            <div class="flow-wrap">Hello! Welcome to our ANESI </div>
		            <div class="flow-wrap">Hello! Welcome to our ANESI </div>
		            <div class="flow-wrap">Hello! Welcome to our ANESI </div>
		            <div class="flow-wrap">Hello! Welcome to our ANESI </div>
		            <div class="flow-wrap">Hello! Welcome to our ANESI </div>
		
		
		        </div>
			</div>
		</div>
		
		
	</header>
	<div class="categoryAllBox" v-if="flg" @mouseleave="flgout">
			<div class="categoryAllBox2">
				<div class="category1">
					<div class="category-box" v-for="item in categoryList1" @mouseover="fnGetcategoryList2(item)">
						<a  class="categoryBox" >
							<span class="categoryNo">{{item.categoryName}}</span>
						</a>
					</div>
				</div>
				<div class="category2" v-if="categoryList2.length != 0" >
					<div class="category-box" v-for="item in categoryList2">
						<a class="categoryBox" @click="fnCategoryPage(item.categoryNo)">
							<span  class="categoryNo">{{item.categoryName}}</span>					
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script src="../js/jquery.js"></script>
<script>
	var app = new Vue({   
		el : '#app1',
		data : {
			flg : false,
			product : {	//��ǰ ��
				productName : "",
				productPrices : "",
				manufacturer : "",
				country : "",
				discount : "",
				category : "",
				discountYn  : ""
			},
			category1No : "",
			categoryList1 : [], //ī�װ� ��з�
			categoryList2 : [],
			category2Name : "",
		},// data
		methods : {
			fnGetcategoryList1(){
				var self = this;
				var nparmap = {};
	            $.ajax({
	                url : "../product/category.dox",
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
	                url : "../product/category2.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.categoryList2 = data.list;
	                	self.product.category = '';
	                	self.category2Name = '';
	                }
	            });
			},
			fnCategoryPage(item){
				console.log(item);
				$.pageChange("/category/product.do" , {categoryNo : item});
				
			},
			categoryFlg(){
				this.flg=true;
			},
			flgout(){
				this.flg=false;
			}
		}, // methods
		created : function() {
			var self = this;
			self.fnGetcategoryList1();
		}// created
	});
	   var isLoggedIn = <%= isLoggedIn %>;
	    console.log('isLoggedIn:', isLoggedIn);

	    console.log('sessionNo:', '<%= sessionNo %>');

	    $(document).ready(function(){
	        // �α��εǾ� ���� ���� ��� �α��� ��ư �� �������� �����մϴ�.
	        if(!isLoggedIn) {
	            $('#login-button-link').attr('href', '../login.do'); // �α��� ��ũ�� �����մϴ�.
	            $('#login-button-text').text('�α���'); // �α��� ��ư�� �ؽ�Ʈ�� "�α���"���� �����մϴ�.
	            $('.fa-door-open').removeClass('fa-door-open').addClass('fa-door-closed');
	            // �α��� �������� Ŭ������ �����Ͽ� ���� �� ������� �����մϴ�.
	        } else { // �α��εǾ� �ִ� ��� �α׾ƿ� ��ư �� ���������� �����մϴ�.
	            $('#login-button-link').attr('href', '../logout.do'); // �α׾ƿ� ��ũ�� �����մϴ�.
	            $('#login-button-text').text('�α׾ƿ�'); // �α��� ��ư�� �ؽ�Ʈ�� "�α׾ƿ�"���� �����մϴ�.
	            $('.fa-door-closed').removeClass('fa-door-closed').addClass('fa-door-open');
	            // �α��� �������� Ŭ������ �����Ͽ� ���� �� ������� �����մϴ�.
	        }
	    });
	
	
	function saveRecentSearch(search) {
		  if (!search) return;

		  // �˻��� ����� �����ɴϴ�.
		  var recentSearches = JSON.parse(localStorage.getItem("recentSearches")) || [];
		  
		  
		  // ������ �˻�� �ִ��� Ȯ���ϰ�, �ִٸ� �����մϴ�.
		  var index = recentSearches.indexOf(search);
		  if (index > -1) recentSearches.splice(index, 1);

		  // �ֱ� �˻��� ��Ͽ� ���ο� �˻�� �߰��մϴ�.
		  recentSearches.unshift(search);
		  
		  // �ֱ� �˻��� ����� �ִ� 10���� �����մϴ�.
		  recentSearches = recentSearches.slice(0, 6);

		  // ����� �˻��� ����� �����մϴ�.
		  localStorage.setItem("recentSearches", JSON.stringify(recentSearches));
		  
		  // ȭ�鿡 ����� �˻��� ����� ǥ���մϴ�.
		  showRecentSearches();
		}
	function showRecentSearches() {
		  // localStorage���� �ֱ� �˻�� �����ɴϴ�.
		  var recentSearches = JSON.parse(localStorage.getItem("recentSearches")) || [];

		  // �ֱ� �˻��� ����� ���ϴ�.
		  $('#recent_search').empty();
			
		  if (recentSearches.length === 0) {
			    // �ֱ� �˻�� ���ٸ� �޽����� ����մϴ�.
			    var message = $('<li>').text('�ֱ� �˻�� �����ϴ�.');
			    $('#recent_search').append(message);
			  } else {
		  // ����� ��ȸ�ϸ� ȭ�鿡 �ֱ� �˻�� �߰��մϴ�.
		  for (var i = 0; i < recentSearches.length; i++) {
		    var search = recentSearches[i];
		    var li = $('<li class="recent-search-item"></li>').text(search);
		    var deleteIcon = $('<i class="fa-solid fa-xmark"></i>');
		    li.append(deleteIcon);
		    $('#recent_search').append(li);
		  }
		  
		  $('.category-link').on('click', function () {
			  var categoryName = $(this).text();

			  $.ajax({
			      url: "/product/getProductsByCategory.dox",
			      type: "POST",
			      data: { categoryName: categoryName },
			      success: function (products) {
			          // ��ǰ ��� ó�� �ڵ� (��: ����Ʈ ������)
			      },
			      error: function (error) {
			          console.log("ī�װ� �� ��ǰ ����� �������µ� �����߽��ϴ�: ", error);
			      }
			  });
			});

		  function loadCategoryProducts(categoryName) {
			  // �������� ī�װ��� ��ǰ �����͸� �������� AJAX ��û
			  $.ajax({
			    method: "POST",
			    url: "/product/getProductsByCategory.dox",
			    data: {
			      categoryName: categoryName
			    },
			    success: function(response) {
			      console.log("Full response data:", response);
			      console.log("Products list:", response.list);

			      var data = response;

			      // testcate.do �������� �̵��ϸ鼭 category�� list �����͸� �����մϴ�.
			      var url = "/testcate.do";
			      var params = "categoryName=" + encodeURIComponent(categoryName) + "&list=" + encodeURIComponent(JSON.stringify(data.list));

			      window.location.href = url + "?" + params;
			    },
			    error: function(error) {
			      console.error("Error occurred while fetching category data:", error);
			    }
			  });
			}

			$(document).ready(function() {
			  $('.category-link').on('click', function() {
			    var categoryName = $(this).text();

			    loadCategoryProducts(categoryName); // �����͸� AJAX�� �����ͼ� ���ÿ��� ó��
			  });
			});


			  }
		}
		$('#search_input').focus(function() {
			  $('#recent_search').show();
			});

			$('#search_input').blur(function() {
			  setTimeout(function() {
			    $('#recent_search').hide();
			  }, 200);
			});
		
		$(document).ready(function() {
			  showRecentSearches();
			});
		$('body').on('click', '.recent-search-item', function() {
			  var search = $(this).text();
			  $('#search_input').val(search);
			  searchProduct(search);
			});
		$('body').on('click', '.recent-search-item .fa-xmark', function() {
			$(document).ready(function(){
		        var isLoggedIn = <%= isLoggedIn %>; // �α����� �Ǿ� �ִ��� ���θ� ��Ÿ���� �����Դϴ�.

		        // �α��εǾ� ���� ���� ��� �α��� ��ư �� �������� �����մϴ�.
		        if(!isLoggedIn) {
		            $('#login-button-link').attr('href', '../login.do'); // �α��� ��ũ�� �����մϴ�.
		            $('#login-button-text').text('�α���'); // �α��� ��ư�� �ؽ�Ʈ�� "�α���"���� �����մϴ�.
		            $('.fa-door-open').removeClass('fa-door-open').addClass('fa-door-closed');
		            // �α��� �������� Ŭ������ �����Ͽ� ���� �� ������� �����մϴ�.
		        } else { // �α��εǾ� �ִ� ��� �α׾ƿ� ��ư �� ���������� �����մϴ�.
		            $('#login-button-link').attr('href', '../logout.do'); // �α׾ƿ� ��ũ�� �����մϴ�.
		            $('#login-button-text').text('�α׾ƿ�'); // �α��� ��ư�� �ؽ�Ʈ�� "�α׾ƿ�"���� �����մϴ�.
		            $('.fa-door-closed').removeClass('fa-door-closed').addClass('fa-door-open');
		            // �α��� �������� Ŭ������ �����Ͽ� ���� �� ������� �����մϴ�.
		        }
		    });
			  // �̺�Ʈ ���� ���� ��ҿ� ������ ���� �ʵ��� �մϴ�.
			  return false;
			});
		
	
		// ī�װ� ���
		$('.category-toggle').click(function() {
			$('.category-list-container').slideToggle('fast');
		});

		// ���� ī�װ� ��� �̺�Ʈ
		$('.category-list > li > a').click(function(event) {
			event.preventDefault();
			$(this).siblings('.subcategory-list').slideToggle('fast');
		});
		function searchProduct(productName) {
			  if(!productName) return;
		    $.ajax({
		        url: "/product/searchProduct.dox",
		        method: "POST",
		        data: {
		            productName: productName,
		        },
		    }).done(function(response) {
		        console.log(response);

		        // ���� ������ �˻�� �Բ� �����մϴ�.
		        sessionStorage.setItem("searchResult", JSON.stringify(response));
		        sessionStorage.setItem("searchKeyword", productName);

		        // searchProduct.jsp�� �̵��մϴ�.
		        window.location.href = "/searchProduct.do?productName=" + encodeURIComponent(productName);
		    });
		    
		}
		// �˻� ������ Ŭ�� �� �˻�� ������ searchProduct �Լ��� �����մϴ�.
		$('#glass').click(function() {
		    var productName = $('#search_input').val();
			
		    console.log("productName:", productName);
		    saveRecentSearch(productName);
		    searchProduct(productName);
		});

		
		$("#search_input").on("keypress", function(e) {
		    if (e.keyCode === 13) {
		        var productName = $(this).val();

		        console.log("productName:", productName);
		        saveRecentSearch(productName);
		        searchProduct(productName);
		    }
		});

		


		/* //category �������� �޴����� �迭����
		 function fnMoveaa (item){
		 var self = this;
		 $.pageChange("storemain_byCategory.do",{no : item});//�����ʿ������ �Ķ���� ������{}
		 }
		 */
</script>