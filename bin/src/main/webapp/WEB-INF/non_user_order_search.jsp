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
<!-- ��ȸ�� �ֹ� ��ȸ������ -->
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="table-wrap">
					<table>
						<tr>
							<td>�ֹ��� ����</td>
							<td></td>
						</tr>
						<tr>
							<td>�޴��� ��ȣ</td>
							<td></td>
						</tr>
						<tr>
							<td>�ּ�</td>
							<td>
								<input type="text" v-model="zipNo" placeholder="�����ȣ">
								<button @click="fnSearchAddr">�ּ� �˻�</button><br>
								<input type="text" v-model="addr" placeholder="�ּ�"><br>
								<input type="text" v-model="addrDetail" placeholder="���ּ�">
						
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
		addr : "",
		addrDetail : "",
		zipNo : ""
	},// data
	methods : {
		fnSearchAddr : function (){
			var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
		},
		fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.user.addr = roadAddrPart1;
    		self.user.addrDetail = addrDetail;
    		// �ܼ� ���� �� ���� �� ���� �ʿ��Ѱ� ������ ���� �˴ϴ�.
    		console.log(zipNo);
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    	}
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>