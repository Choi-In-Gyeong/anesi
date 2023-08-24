<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/myCoupon.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="couponTitle">����</div>
			<div v-if="couponList.length == 0" class="nonCoupon">��� ������ ������ �����ϴ�.</div>
			<div class="couponList">
				<div v-for="item in couponList" class="coupon">
					<div>{{item.couponName}}</div>
					<div>
						<span>{{item.discount}}</span><span>{{item.disFlg == 'A' ? '��' : '%'}}</span>
					</div>
					<div>��{{item.eDate.substring(0, 4)}}�� {{item.eDate.substring(5, 7)}}�� {{item.eDate.substring(8, 10)}}�� ����</div>
					<div>��{{formatCurrency(item.minPrice)}}�� �̻� ���Ž�</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		userNo : '${sessionNo}',
		couponList : [],
		
	},// data
	methods : {
		fnGetCouponList(){
			var self = this;
			var nparmap = {userNo : self.userNo};
			$.ajax({
                url : "/order/getCoupon.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.couponList = data.list;
                	console.log(self.couponList);
                }
			})
		},
		formatCurrency(value) {
            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetCouponList();
	}// created
});
</script>