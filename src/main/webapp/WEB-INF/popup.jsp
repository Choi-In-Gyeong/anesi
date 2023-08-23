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

.popup-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.popup {
    padding: 40px;
    padding-bottom: 20px;
    background-color: #424242;
    color : #fff;
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
    margin-left : 20px;
    color: #A782C3;
}


.cp_wrapper{
	border-radius: 10px;
    background-color: #ffffff;
    color : #424242;
    margin-bottom:15px;
    padding : 10px;
}
.point {
   border-radius: 4px;
   font-size: 15px;
   font-weight: bold;
   text-shadow: -1px 0px yellow, 0px 1px yellow, 1px 0px yellow, 0px -1px yellow;
}
.popup-text {
    margin-bottom : 10px;
}
.popup-text1 {
    font-size: 13px;
   
}
.popup-text2 {
    font-size: 20px;
    font-weight:bold;
    padding : 3px;
    
    
}
.popup-button {
    background-color: #A782C3;
    color: white;
    border: none;
    padding: 7px 15px;
    border-radius: 5px;
    cursor: pointer;
    font-family: 'Pretendard-Regular';
    margin-left : 160px;
    

}
.popup-button:hover {
    background-color: #8C5FAC;
}
.popup-checkbox {
    display: flex;
    align-items: center;
    margin-top : 16px;
    margin-left: 148px;
}
.popup-checkbox input {
    margin-right: 5px;
}

</style>
</head>
<body style="width :600px;">
	 <div id="pop" class="popup-wrapper">
        <div class="popup">
            <div class="popup-title1">��! 7�� ����</div>
            <div class="popup-title2">ANESI  2�ֳ� ���� ���</div>
            <div class="popup-text">ȸ���Ե鸸 ���� �� �� �־��~</div>
            
            <div class="cp_wrapper">
	            <div class="popup-text2"><span class="point">����1 </span>��ǰ�� 30% ���� ����</div>
	            <div class="popup-text1">10,000�� �̻� ���Žû�밡��, �ִ� 100��������</div>
	            <button class="popup-button" @click="fnCoupon('2�ֳ� ���� ��������','B','30')">�����ޱ�</button>
			</div>
			<div class="cp_wrapper">
	            <div class="popup-text2"><span class="point">����2 </span> 3000�� ���� ����</div>
	            <div class="popup-text1">10,000�� �̻� ���Ž� ��밡��</div>
	            <button class="popup-button" @click="fnCoupon('2�ֳ� ���� 3000�� ��������','A','3000')">�����ޱ�</button>
			</div>
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
			fnCoupon(couponName, disFlg, discount){
				var self = this;
				if(self.userNo!=''){
					var nparmap = {userNo:self.userNo,
								   couponName,
								   disFlg,
								   discount};
					   $.ajax({
			                url : "coupon.dox",
			                dataType:"json",	
			                type : "POST", 
			                data : nparmap,
			                success : function(data) {
			                	if(data.success){
				        			alert(data.success.message);
			                	}else{
				        			alert(data.message);
			                	}
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

<script type="text/javascript">
    function closePopup(){
      if(document.getElementById("check").value){
        Cookies.set('popupCheck', 'no', { expires: 24 });
      }
      //�ڱ� �ڽ��� �ݴ� dom method
      self.close();
    }
</script>
       
