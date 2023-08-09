<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	
</style>
</head>
<!-- 비회원 주문 조회페이지 -->
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="nUser-title">
					<span>비회원 주문 조회</span>
				</div>
				<div class="table-wrap">
					<table>
						<tr>
							<td>받으시는 분</td>
							<td><input v-model="user.nUserName"></td>
						</tr>
						<tr>
							<td>휴대폰 번호</td>
							<td><input v-model="user.nUserPhone"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<input type="text" v-model="user.zipNo" placeholder="우편번호">
								<button @click="fnSearchAddr">주소 검색</button><br>
								<input type="text" v-model="user.addr" placeholder="주소"><br>
								<input type="text" v-model="user.addrDetail" placeholder="상세주소">
						
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
} 
var app = new Vue({
	el : '#app',
	data : {
		user : {
			nUserName : "",
			nUserPhone : "",
			addr : "",
			addrDetail : "",
			zipNo : ""	
		}
		
	},// data
	methods : {
		fnGetList : function(){
			
			
		},
		fnSearchAddr : function (){
			var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
		},
		fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.user.addr = roadAddrPart1;
    		self.user.addrDetail = addrDetail;
    		self.user.zipNo = zipNo;
    	}
	}, // methods
	created : function() {
		var self = this;
		
	}// created
});
</script>