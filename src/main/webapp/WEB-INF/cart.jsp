<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/Cart.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>��ٱ���</title>
<style>
</style>
</head>
<body>
    <h2>��ٱ���</h2>
   	<div class="firstbox">
   	<input type="checkbox">��ü ����
   
    <table>
        <tr>
            <th>�����</th>
           <th>��ǰ ��ȣ</th>
            <th>��ǰ �̸�</th>
            <th>������</th>
            <th>������</th>
            <th>��ǰ ����</th>
        </tr>
        <tr v-for="(item, index) in cartItemList">
            <td><img :src="item.imgPath" alt="Product thumbnail" width="100"></td>
            <td>{{ item.productNo }}</td>
            <td>{{ item.productName }}</td>
            <td>{{ item.manufacturer }}</td>
            <td>{{ item.country }}</td>
            <td>{{ item.productPrice }}</td>
        </tr>
    </table>
    </div>
    <div class="firstbox2">
    <a><span>�ɼǺ���</span></a> <a><span>�ٷα���</span></a>
    </div>
</body>
</html>
<script>
var app = new Vue({
    el : '#app',
    data : {
        cartItemList: [
            { imgPath: "", productNo"", productName: "", manufacturer: "", country: "", productPrice: "",  },
        ]
    },// data
    methods : {
        
    }, // methods
    created : function() {
        var self = this;
        // ��ٱ��� ���� �������� ���� �߰�
        // ex) ��Ű, ���ý��丮��, ���� API ȣ�� ��
        // ...
    }// created
});
</script>