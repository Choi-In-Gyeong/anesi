<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>


.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* �������� ������ ��� */
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal-card {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
}
</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
	<div id="app">
	<button @click="openModal" class="modal-toggle-button">��� ����</button>

	
		<div class="modal" v-if="showModal">
		  <div class="modal-card">
		    <h2>��� ����</h2>
		    <p>��� ������ ���⿡ �߰��մϴ�.</p>
		    <button @click="closeModal">�ݱ�</button>
		  </div>
		</div>
	
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		showModal: false

	},// data
	methods : {
		
		
		 // ��� ����
	    openModal: function() {
	      this.showModal = true;
	    },
	    // ��� �ݱ�
	    closeModal: function() {
	      this.showModal = false;
	    }
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>