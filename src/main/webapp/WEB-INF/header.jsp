<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

	<header>
		<span> <a href="/main.do"><img class="logo"
				src="../css/image/anesilogo.png" /> </a></span> <a class="aaa"
			href="/product/storemain.do">�����</a> <a class="bbb"
			href="/community/main.do">Ŀ�´�Ƽ</a> <a class="ccc" href="javascript:;">�߰�����</a>

		<ul id="header_navi">
			<li id="login-button"><a href="#" id="login-button-link"><i class="fa-solid fa-door-open"></i></a><span
				class="fon" id="login-button-text"></span></li>
			<li><a href="../join.do"><i class="fa-solid fa-user-plus "></i></a><span
				class="fon">ȸ������</span></li>
			<li><a href="../mypage.do"><i class="fa-solid fa-user "></i></a><span
				class="fon">����������</span></li>
			<li><a href="http://localhost:8080/scrapbook.do"><i class="fa-solid fa-bookmark "></i></a><span></span></li>
			<li><a><i class="fa-solid fa-bell "></i></a><span></span></li>
			<li><a href="../product/cart.do"><i
					class="fa fa-shopping-cart "></i></a><span></span></li>
			<li><a href="" class="headerbtn" title="Button fade blue/green"
				class="button btnFade btnBlueGreen">Fade</a></li>
		</ul>
		<hr>
		<span>
			<button class="category-toggle">
				<span> <i class="fa-solid fa-grip-lines"></i>ī�װ� 
			</button> <span class="headerfont"> <a class="href">��õ </a> <a
				class="href">��ŷ</a> <a class="href">Ư��</a> <a class="href">��ȹ��</a> <a
				class="href">�귣���</a>
		</span> <span>
	<div class="search-container">
  <input type="text" id="search_input" placeholder="��ǰ���� �Է��ϼ���">
  <a id="glass" class="glass"><i class="fa-solid fa-magnifying-glass"></i></a>
  <div id="recent_search" class="recent-search-container" style="display: none;"></div>
</div>

		</span>
		</span>

		<hr>

		<div class="category-list-container" style="display: none;">
			<ul class="category-list">

				<li><a onclick="fnMoveaa('10')">����</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">ħ��</a></li>
						<li><a class="category-link">����</a></li>
						<li><a class="category-link">������</a></li>
						<li><a class="category-link">����</a></li>
						<li><a class="category-link">��Ź</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('20')">����</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">�彺�ٵ�</a></li>
						<li><a class="category-link">�ܽ��ĵ�</a></li>
						<li><a class="category-link">�����</a></li>
						<li><a class="category-link">õ���</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('30')">�к긯</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">ħ��</a></li>
						<li><a class="category-link">Ŀư</a></li>
						<li><a class="category-link">����</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('40')">����</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">�����</a></li>
						<li><a class="category-link">tv</a></li>
						<li><a class="category-link">��Ź��</a></li>
						<li><a class="category-link">����/������</a></li>
						<li><a class="category-link">û�Ұ���</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('50')">����/�Ĺ�</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">��ȭ</a></li>
						<li><a class="category-link">�ɴٹ�</a></li>
						<li><a class="category-link">ȭ��</a></li>
						<li><a class="category-link">�׸� ����</a></li>
						<li><a class="category-link">ĵ�� ��ǻ��</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('60')">�ݷ�����</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">�Ͽ콺/�漮</a></li>
						<li><a class="category-link">ĹŸ��/��ũ����</a></li>
						<li><a class="category-link">������/��Ÿ��</a></li>
						<li><a class="category-link">��׸�/�޽ı�</a></li>
						<li><a class="category-link">������ǰ</a></li>
					</ul></li>
			</ul>
		</div>
	</header>
	<script>
	   var isLoggedIn = <%= isLoggedIn %>;
	    console.log('isLoggedIn:', isLoggedIn);

	    console.log('sessionNo:', '<%= sessionNo %>');

	    $(document).ready(function() {
	    	  $(".subcategory-list > li > a").click(function() {
	    	    // Ŭ���� a ����� �θ� li ��ҿ� ���� �θ� li ����� ��з� a ��ҿ��� �����͸� �����ɴϴ�.
	    	    var $parent_li = $(this).closest("li");
	    	    var $category_a = $parent_li.parents(".category-list > li").find("> a");
	    	    var category_no = $category_a.data("category-no");
	    	    var category_name = $category_a.data("category-name");
	    	    var subcategory_name = $(this).text();
	    	    loadSubcategoryProducts(category_no, category_name, subcategory_name);
	    	  });
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
		function loadCategoryProducts(categoryName) {
			  // �������� ī�װ��� ��ǰ �����͸� �������� AJAX ��û
			  $.ajax({
			    method: "POST",
			    url: "/product/getProductsByCategory.dox",
			    data: {
			      category: categoryName
			    },
			    success: function(response) {
			    	 console.log("Full response data:", response); // 'data' ��� 'response' ���
			         console.log("Products list:", response.list); // 'data' ��� 'response' ���
			    	// ���� �����͸� �ٷ� ����Ͻʽÿ� (JSON.parse ������� ����)
			        var data = response;

			        // ������ ��ǰ �����͸� �������� ����ϴ� ����
			        var productContainer = $("#product-container");
			        productContainer.empty(); // ���� ��ǰ ������ ����
			                                
			        // ��ǰ �����͸� �߰�
			        $.each(data.list, function(index, product) {
			            // ���⿡ �� ��ǰ�� ǥ���ϴ� HTML �ڵ带 �ۼ��ϼ���.
			            // ���� ���, �Ʒ��� ���� ������ div�� ����� �� �ֽ��ϴ�.
			            var productDiv = $("<div>").text(product.name).appendTo(productContainer);
			        });
			    },
			    error: function(error) {
			      console.error("Error occurred while fetching category data:", error);
			    }
			  });
			}
			
		$(document).ready(function() {
			  $(".subcategory-list > li > a").click(function() {
			    // Ŭ���� a ����� �θ� li ��ҿ� �� �θ��� ��з��� ã�� ���� �ڵ�
			    var $parent_li = $(this).closest("li");
			    var $category_a = $parent_li.parents(".category-list > li").find("> a");

			    // ��з� ī�װ� ��ȣ�� �̸��� ã�� ���� �ڵ�
			    var category_no = $category_a.attr("onclick").match(/'(\d+)'/)[1];
			    var category_name = $category_a.text();

			    // �Һз� ī�װ� �̸�
			    var subcategory_name = $(this).text();

			    // Ŭ���� �Һз� ī�װ� ���� ����� Ȯ���� �� �� �ִ� �ڵ�
			    console.log("category_no:", category_no);
			    console.log("category_name:", category_name);
			    console.log("subcategory_name:", subcategory_name);

			    // ���� ����: �ε��ϴ� ��ǰ�̳� �ٸ� �۾� ����
			    // ����) loadSubcategoryProducts(category_no, category_name, subcategory_name);
			  });
			});
		


		/* //category �������� �޴����� �迭����
		 function fnMoveaa (item){
		 var self = this;
		 $.pageChange("storemain_byCategory.do",{no : item});//�����ʿ������ �Ķ���� ������{}
		 }
		 */
	</script>