<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/typeahead.bundle.min.js"></script> <!-- ���� �Ϸ� -->
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
	<header>
		<span> <a href=""><img class="logo"
				src="../css/image/anesilogo.png" /> </a></span>

		<ul id="header_navi">
			<li><a><i class="fa fa-shopping-cart "></i></a></li>
			<li><a href="../login.do"><i class="fa-solid fa-door-open "></i></a><span class="fon">�α���</span></li>
			<li><a href="../join.do"><i class="fa-solid fa-user-plus "></i></a><span class="fon">ȸ������</span></li>
			<li><a href="../mypage.do"><i class="fa-solid fa-user "></i></a><span class="fon">����������</span></li>
			<li><a><i class="fa-solid fa-bookmark "></i></a><span></span></li>
			<li><a><i class="fa-solid fa-bell "></i></a><span></span></li>
			<li><a><i class="fa fa-shopping-cart "></i></a><span></span></li>
			<li><a href="" class="headerbtn" title="Button fade blue/green"
				class="button btnFade btnBlueGreen">Fade</a></li>
		</ul>
		<hr>
		   <span>
        <button class="category-toggle"> <span> <i class="fa-solid fa-grip-lines"></i>ī�װ���</button>
        <span class = "headerfont">
            <a class="href">��õ </a> <a class="href">��ŷ</a> <a class="href">Ư��</a> <a class="href">��ȹ��</a> <a class="href">�귣���</a>
        </span>
      <span>
         <input class="typeahead" type="text" placeholder="Search">
         <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" class="glasses">
         </span>
    </span>
		<hr>
		 </header>
	 <div class="category-list-container" style="display:none;">
    <ul class="category-list">
      
        <li>
            <a>����</a>
            <ul class="subcategory-list" style="display:none;">
                <li><a>ħ��</a></li>
                <li><a>����</a></li>
                <li><a>������</a></li>
                <li><a>����</a></li>
                <li><a>��Ź</a></li>
            </ul>
        </li>
        <li>
            <a>����</a>
            <ul class="subcategory-list" style="display:none;">
                <li><a>�彺�ٵ�</a></li>
                <li><a>�ܽ��ĵ�</a></li>
                <li><a>�����</a></li>
                <li><a>õ���</a></li>
            </ul>
        </li>
        <li>
            <a>�к긯</a>
            <ul class="subcategory-list" style="display:none;">
                <li><a>ħ��</a></li>
                <li><a>Ŀư</a></li>
                <li><a>����</a></li>
            </ul>
        </li>
        <li>
            <a>����</a>
            <ul class="subcategory-list" style="display:none;">
                <li><a>�����</a></li>
                <li><a>tv</a></li>
                <li><a>��Ź��</a></li>
                <li><a>����/������</a></li>
                <li><a>û�Ұ���</a></li>
            </ul>
        </li>
        <li>
            <a>����/�Ĺ�</a>
            <ul class="subcategory-list" style="display:none;">
                <li><a>��ȭ</a></li>
                <li><a>�ɴٹ�</a></li>
                <li><a>ȭ��</a></li>
                <li><a>�׸� ����</a></li>
                <li><a>ĵ�� ��ǻ��</a></li>
            </ul>
        </li>
        <li>
            <a>�ݷ�����</a>
            <ul class="subcategory-list" style="display:none;">
                <li><a>�Ͽ콺/�漮</a></li>
                <li><a>ĹŸ��/��ũ����</a></li>
                <li><a>������/��Ÿ��</a></li>
                <li><a>��׸�/�޽ı�</a></li>
                <li><a>������ǰ</a></li>
            </ul>
        </li>
    </ul>
</div>
  
 <script>
 $(document).ready(function() {
	    // ��ư Ŭ�� �̺�Ʈ �߰�
	    $('.category-toggle').click(function() {
	       $('.category-list-container').slideToggle('fast');
	    });
	    
	    // ���� ī�װ��� ��� �̺�Ʈ �߰�
	    $('.category-list > li > a').click(function(event) {
	      event.preventDefault();
	      $(this).siblings('.subcategory-list').slideToggle('fast');
	    });
	});
 $(document).ready(function() {
	  const countries = ["Apple", "Banana", "Cherry", "Date", "Elderberry"];

	  $('.typeahead').typeahead({
	    hint: true,
	    highlight: true,
	    minLength: 1
	  },
	  {
	    name: 'countries',
	    source: substringMatcher(countries)
	  });
	});

 
	function substringMatcher(strs) {
	  return function findMatches(q, cb) {
	    let matches, substringRegex;

	    matches = [];

	    substrRegex = new RegExp(q, 'i');

	    $.each(strs, function(i, str) {
	      if (substrRegex.test(str)) {
	        matches.push(str);
	      }
	    });

	    cb(matches);
	  };
	}
	$('.twitter-typeahead, .typeahead').attr('style',''); 
</script>