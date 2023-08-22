<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #2f3438;
}

.popup-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.popup {
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

.popup-title1 {
    font-size: 15px;
    font-weight: bold;
    margin-bottom: 10px;
    text-align : center;
}

.popup-title2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

.point {
   border-radius: 4px;
   font-size: 15px;
   font-weight: bold;
   text-shadow: -1px 0px yellow, 0px 1px yellow, 1px 0px yellow, 0px -1px yellow;
    
   

}
.popup-text1 {
    font-size: 16px;
    margin-bottom: 20px;
    font-weight:bold;
}
.popup-text2 {
    font-size: 20px;
}

.popup-button {
    background-color: #A782C3;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
}

.popup-button:hover {
    background-color: #8C5FAC;
}

.popup-checkbox {
    display: flex;
    align-items: center;
}

.popup-checkbox input {
    margin-right: 5px;
}



</style>
</head>
<body style="width : 600px;">
	 <div id="pop" class="popup-wrapper">
        <div class="popup">
            <div class="popup-title1">��! 7�� ����</div>
            <div class="popup-title2">ANESI  2�ֳ� ���� ���</div>
            <div class="popup-text">ȸ���Ե鸸 ���� �� �� �־��~</div>
            <div class="popup-text2"><span class="point">����1 </span>��ǰ�� 30% ���� ����</div>
            <div class="popup-text1">10000�� �̻� ���Ű�, �ִ� 100��������</div>
            <button class="popup-button" @click="fnCoupon">�����ޱ�</button>

            <div class="popup-text2"><span class="point">����2 </span> 3000�� ���� ����</div>
            <div class="popup-text1">10000�� �̻� ���Ű�</div>
            <button class="popup-button" @click="fnCoupon2">�����ޱ�</button>

            <div class="popup-text">��, �߱��Ϸκ��� ���갣�� ��� ����</div>
            <div class="popup-checkbox">
                <input type="checkbox" id="check" onclick="closePopup()">
                <label for="check">�� �̻� ���� �ʱ�</label>
            </div>
        </div>
    </div>
</body>
</html>
<script>
var app = new Vue({
	el : '#pop',
	data : {
		userNo : '${sessionNo}',

	},// data
	methods : {
			fnCoupon(){
				var self = this;
				if(self.userNo!=''){
				var nparmap = {userNo:self.userNo};
				   $.ajax({
		                url : "coupon.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) { 
		        			alert("�������");
		                }
		            }); 
				} else{
					alert("�α��� �� �̿밡���մϴ�.");
					window.close();
				}
				
			},
			fnCoupon2(){
				var self = this;
				if(self.userNo!=''){
				var nparmap = {userNo:self.userNo};
				   $.ajax({
		                url : "coupon2.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) { 
		        			alert("�������");
		                }
		            }); 
				} else{
					alert("�α��� �� �̿밡���մϴ�.");
					window.close();
				}
				
			},
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});

</script>
