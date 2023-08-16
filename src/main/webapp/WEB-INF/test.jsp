<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<button onclick="setCookie()">
	ADD TO CART
	
	</button>
</body>
</html>

<script>
//��Ű �����ϴ� �Լ�
function setCookie(key, value, unixTime) {
    var todayDate = new Date();
    todayDate.setTime(todayDate.getTime() + unixTime);
    document.cookie = key + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

//��Ű �� �������� �Լ�
function getCookie(key) {
    var result = null;
    var cookie = document.cookie.split(';');
    cookie.some(function (item) {
        // ������ ����
        item = item.replace(' ', '');
 
        var dic = item.split('=');
 
        if (key === dic[0]) {
            result = dic[1];
            return true;    // break;
        }
    });
    return result;
}

//��Ű �����ϴ� �Լ�
function delete_cookie(name) {
    document.cookie = encodeURIComponent(name) + '=; expires=Thu, 01 JAN 1999 00:00:10 GMT';
}



//�˾��� �������ִ� ������ (parent)
var popup = getCookie("eventpopup");
if (popup != "false") {
    // �˾� ����
}
 
// �˾� ������
function closeWindow() {
    var check = document.getElementById("check");
    if (check.checked) {
        setCookie("eventpopup", "false", 1);
    }
    self.close();
}




</script>