<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/order.css" rel="stylesheet">
<link href="../css/checkbox.css" rel="stylesheet">
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
			<h1 class="orTitle">�ֹ�/����</h1>
			<div class="amount">
				<div class="payment">
					<div class="amountBox">
						<h2 class="moneyText">���� �ݾ�</h2>
						<div>
							<div class="orNameText">�� ��ǰ �ݾ�<span class="allMoneyText">0000��</span></div>
							<div class="orNameText">��ۺ�<span class="allMoneyText">3000��</span></div>
							<div class="orNameText">���� ���<span class="allMoneyText">0000��</span></div>
						</div>
						<div class="FinalPaymentAmount">���� ���� �ݾ�<span class="allMoneyText"><span>0000</span> ��</span></div>
					</div>
					<div class="orTerms">
						<div class="allTerms">
							<div class="custom-checkbox" @click="fnAllCheck" :class="checkAm.length == 2 ? 'checked' : ''">
					            <div class="checkbox-icon">
					              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
					            </div>
							</div>
							<span>�Ʒ� ���뿡 ��� �����մϴ�.(�ʼ�)</span>
							<div class="err">{{errMsg}}</div>
						</div>
						<div class="orAgreement">
							<div class="agreementBox">
								<div class="textBox">
									<div class="custom-checkbox1" :class="{ 'checked': checkAm.includes('privacy') }" @click="fnInsertCheckAm('privacy')">
							            <div class="checkbox-icon" :class="flg ? 'checked' : ''">
							              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
							            </div>
									</div>
									<input type="checkbox" v-model="checkAm" value="privacy">
									<span>�������� ���� �̿� �� �� 3�� ���� ���� (�ʼ�)</span>
								</div>
								<div class="textBox">
									<div class="custom-checkbox1" :class="{ 'checked': checkAm.includes('paymentAgent') }" @click="fnInsertCheckAm('paymentAgent')">
							            <div class="checkbox-icon" :class=" flg ? 'checked' : ''">
							              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
							            </div>
									</div>
									<input type="checkbox" v-model="checkAm" value="paymentAgent">
									<span>�������� ������ �̿��� ���� (�ʼ�)</span>
								</div>	
							</div>						
						</div>
					</div>
				</div>
				<button class="orBtuStyle" @click="fnOrder">00,000�� �����ϱ�</button>
			</div>
			<div class="orInformation">
				<div class="subheading">�ֹ���</div>
				<div class="orderer">
					<label>
					    <span :class="!flgName ? '' : 'orRed'">�̸�</span>
					    <div class="orInputBox">
					        <input v-model="order.name" @input="fnCheck('name')" :class="!flgName ? '' : 'orRed'">
					    </div>
					</label>
					<label>
					    <span :class="!flgEmail1 ? '' : 'orRed'">�̸���</span>
					    <div class="orInputBox">
					        <input v-model="order.email1" placeholder="�̸���" @input="fnCheck('email1')" :class="!flgEmail1 ? '' : 'orRed'"> @
					    </div>
					    <div class="orInputBox">
					        <select v-model="order.email2" class="email2" ref="emailInput2" @change="fnCheck('email2')" :class="!flgEmail2 ? '' : 'orRed'">
					            <option value="">�������ּ���.</option>
					            <option value="naver.com">naver.com</option>
					            <option value="hanmail.net">hanmail.net</option>
					            <option value="daum.net">daum.net</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="nate.com">nate.com</option>
					            <option value="hotmail.com">hotmail.com</option>
					            <option value="icloud.com">icloud.com</option>
					        </select>
					    </div>
					</label>
					<label>
					    <span :class="!flgPhone ? '' : 'orRed'">�޴���ȭ</span>
					    <div class="orSelectBox">
					        <select v-model="order.phone1">
					            <option value="010">010</option>
					            <option value="011">011</option>
					            <option value="016">016</option>
					            <option value="017">017</option>
					            <option value="018">018</option>
					            <option value="019">019</option>
					        </select>
					    </div>
					    <div class="orInputBox">
					        <input v-model="order.phone2" placeholder="�Է����ּ���" @input="fnCheck('phone')" :class="!flgPhone ? '' : 'orRed'">
					    </div>
					</label>
				</div>
				<div class="subheading address">�����<span class="sameButton" @click="fnSameVal">���� �����ϰ� ä���</span></div>
				<div class="addr">
					<label>
					    <div class="orInputBox3">
					        <select @change="fnAddrChange">
					        	<option v-for="item in addrList" >{{item.addrKind}} : {{item.addr}}</option>
					        </select>
					    </div>
					</label>
					<label>
					    <span :class="!flgAddrName ? '' : 'orRed'">�������</span>
					    <div class="orInputBox">
					        <input v-model="addr.addrName" @input="fnCheck('addrName')" :class="!flgAddrName ? '' : 'orRed'">
					    </div>
					</label>
					<label>
					    <span :class="!flgAdName ? '' : 'orRed'">�޴� ���</span>
					    <div class="orInputBox">
					        <input v-model="addr.name" @input="fnCheck('adName')" :class="!flgAdName ? '' : 'orRed'">
					    </div>
					</label>
					<label>
					    <span :class="!flgAdPhone ? '' : 'orRed'">�޴���ȭ</span>
					    <div class="orSelectBox">
					        <select v-model="addr.phone1">
					            <option value="010">010</option>
					            <option value="011">011</option>
					            <option value="016">016</option>
					            <option value="017">017</option>
					            <option value="018">018</option>
					            <option value="019">019</option>
					        </select>
					    </div>
					    <div class="orInputBox">
					        <input v-model="addr.phone2" placeholder="�Է����ּ���" @input="fnCheck('adPhone')" :class="!flgAdPhone ? '' : 'orRed'">
					    </div>
					</label>
					<label>
						<span :class="!flgAddr ? '' : 'orRed'">�ּ�</span>
						<button class="addrButton" @click="openAddressSearch">�ּ�ã��</button>
						<div class="orInputBox">
					        <input v-model="addr.zip" readonly class="inpRead" :class="!flgAddr ? '' : 'orRed'">
					    </div>
					</label>
					<label>
						<div class="orInputBox addr2">
					        <input v-model="addr.addr1" readonly class="inpRead" :class="!flgAddr ? '' : 'orRed'">
					    </div>
					</label>
					<label>
						<div class="orInputBox addr2">
					        <input v-model="addr.addr2" placeholder="���ּ� �Է�" :class="!flgAddr ? '' : 'orRed'">
					    </div>
					</label>
					<div class='addr3'>
						<div class="custom-checkbox1" :class="{ 'checked': addr.addrDefault == 'Y' }" @click="fnDefaultAddr">
				            <div class="checkbox-icon" :class="flg ? 'checked' : ''">
				              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
				            </div>
						</div>
						<span class="defaultAddrText">�⺻ ������� ����</span>
					</div>
					<div>
						<section class="sectionSelect">
						    <select v-model="addr.deliveryRq" class="orSelectBox2">
						    	<option value="0">��۽� ��û������ �������ּ���</option> 
						        <option value="1">����� ���տ� �����ּ���</option>
						        <option value="2">����� ���ǿ� �ð��ּ���</option>
						        <option value="3">����� �� �տ� �����ּ���</option>
						        <option value="4">��� ���� �����ּ���</option>
						        <option value="5">���� �Է�</option>
						    </select>
						    <input type="text" v-if="addr.deliveryRq == '5'" v-model="addr.customDeliveryRq" class="orSelectBox2">
						</section>
					</div>
				</div>
				<div class="orProductList">
					<div class="subheading">�ֹ���ǰ <span class="text">1��</span></div>
					<div>
						<div class="orProduct">
							<img alt="" src="../css/image/product/singlebed.png">
							<div>
								<div class="prProductName">��ǰ�̸�</div>
								<div class="prProductOption">��ǰ �ɼ�</div>
								<div class="prProductPrice">���� <span>| 1��</span></div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="subheading address">��ٱ��� ����
						<span class="text2" v-if="couponList.length == 0">��� ������ ������ �����ϴ�.</span>
					</div>
					<div>
						<div v-for="item in couponList" class="orCoupon el-radio">
							<input type="radio" v-model="order.couponNo" name="coupon" :value="item.couponNo" :id="item.couponNo">
							<label class="el-radio-style" :for="item.couponNo"></label>
							<div>
								<div class="coupon1">
									<span v-if="item.disFlg=='A'">{{item.discount}}�� ����</span>
									<span v-else>{{item.discount}}% ����</span>
								</div>
								<div>{{item.couponName}}<span v-if="item.maxDi != '0'" class="coupon2">(�ִ� {{item.maxDi}}�� ����)</span></div>
							</div>
						</div>
						<div class="orCoupon  el-radio" v-if="couponList.length != 0">
							<input type="radio" v-model="order.couponNo" name="coupon" value="" id="nonCoupon">
							<label class="el-radio-style" for="nonCoupon"></label>
							<div class="coupon1">
								<span>���� �� ��</span>
							</div>
						</div>
					</div>	
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
		order : {
			name : "",
			email1 : "",
			email2 : "",
			phone1 : "010",
			phone2 : "",
			couponNo : "" 
		},
		addr : {
			userNo : '${sessionNo}',
			name : "",
			addrName : "",
			phone1 : "010",
			phone2 : "",
			addr1 : "",
			addr2 : "",
			zip : "",
			addrDefault : "N",
			deliveryRq : "0",
			customDeliveryRq : ""
		},
		flgName: '',
		flgEmail1: '',	
		flgEmail2: '',
		flgPhone: '',
		flgAddrName: '',
		flgAdName: '',
		flgAdPhone : '',
		flgAddr : '',
		checkAm : [],
		flg : false,
		userNo : '${sessionNo}',
		couponList : [],
		errMsg : "",
		addrList : [],
		addrAdd : false
	},// data
	methods : {
		fnAllCheck(){
			var self =this;
			if(self.checkAm.length == 2){
				self.checkAm = [];
			} else{
				self.checkAm = ['privacy', 'paymentAgent'];
			}
		},
		fnInsertCheckAm(text){
			var self = this;
			if(self.checkAm.length == 0){
				self.checkAm.push(text);
				return;
			}
			for(let i=0; i< self.checkAm.length; i++){
				if(self.checkAm[i] == text){
					self.checkAm.splice(i, 1);
					return;
				}
				if(i == (self.checkAm.length-1)){
					self.checkAm.push(text);
					return;
				}
			}
		},
		fnCheck(text) {
		    var self = this;
		    if (text === 'name') {
		        if (self.order[text].trim() === '' || self.order[text] !== self.order[text].trim()) {
		            self.flgName = true;
		        } else {
		            self.flgName = false;
		        }
		    }
		    if (text === 'email1') {
		        if (self.order.email1.trim() === '' || self.order.email1 !== self.order.email1.trim()) {
		            self.flgEmail1 = true;
		        } else {
		            self.flgEmail1 = false;
		        }
		    }
		    if (text === 'email2') {
		        if (self.order[text].trim() === '' || self.order[text] !== self.order[text].trim()) {
		            self.flgEmail2 = true;
		        } else {
		            self.flgEmail2 = false;
		        }
		    }
		    if (text === 'phone') {
		        if (self.order.phone2.trim() === '' || self.order.phone2 !== self.order.phone2.trim()) {
		            self.flgPhone = true;
		        } else {
		            self.flgPhone = false;
		        }
		    }
		    if (text === 'addrName') {
		        if (self.addr.addrName.trim() === '' || self.addr.addrName !== self.addr.addrName.trim()) {
		            self.flgAddrName = true;
		        } else {
		            self.flgAddrName = false;
		        }
		    }
		    if (text === 'adName') {
		        if (self.addr.name.trim() === '' || self.addr.name !== self.addr.name.trim()) {
		            self.flgAdName = true;
		        } else {
		            self.flgAdName = false;
		        }
		    }
		    if (text === 'adPhone') {
		        if (self.addr.phone2.trim() === '' || self.addr.phone2 !== self.addr.phone2.trim()) {
		            self.flgAdPhone = true;
		        } else {
		            self.flgAdPhone = false;
		        }
		    }
		    if (text === 'addr') {
		        if (self.addr.zip.trim() === '') {
		            self.flgAddr = true;
		        } else {
		            self.flgAddr = false;
		        }
		    }
		},
		  fnSameVal(){
			  var self = this;
			  self.addr.name = self.order.name;
			  self.addr.phone1 = self.order.phone1;
			  self.addr.phone2 = self.order.phone2;
		  },
		  openAddressSearch() {
		      var option = "width=500,height=500,top=100,left=200,location=no";
		      window.open("../addr.do", "test", option);
		      this.fnCheck('addr');
		    },
		    handleAddressCallback(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		      this.addr.addr1 = roadAddrPart1 + roadAddrPart2;
		      this.addr.addr2 = addrDetail;
			  this.addr.zip = zipNo;
			  this.fnCheck('addr');
			  this.addrAdd = true;
		    },
		    fnDefaultAddr(){
		    	var self = this;
		    	if(self.addr.addrDefault == 'N'){
		    		self.addr.addrDefault = 'Y'
		    	} else {
		    		self.addr.addrDefault = 'N'
		    	}
		    },
		    fnDeliveryRq(){
		    	var self = this;
		    	if(self.addr.deliveryRq == '5'){
		    		
		    	}
		    },
		    fnGetCoupon(){
		    	var self = this;
				var nparmap = {userNo : self.userNo};
	            $.ajax({
	                url : "../order/getCoupon.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
						self.couponList = data.list;
	                }
	            });
		    },
		    fnOrder(){
		    	var self = this;
		    	self.fnCheck('name');
		    	self.fnCheck('email1');
		    	self.fnCheck('email2');
		    	self.fnCheck('phone');
		    	if(self.flgName || self.flgEmail1 || self.flgEmail2 || self.flgPhone){
		    		window.scrollTo({
		    	        top: 0,
		    	        behavior: "smooth"
		    	      });
		    		return;
		    	}
		    	self.fnCheck('addrName');
		    	self.fnCheck('adName');
		    	self.fnCheck('adPhone');
		    	self.fnCheck('addr');
		    	if(self.flgAddrName || self.flgAdName || self.flgAdPhone || self.flgAddr){
		    		window.scrollTo({
		    	        top: 300,
		    	        behavior: "smooth"
		    	      });
		    		return;
		    	}
		    	if(self.checkAm.length != 2){
		    		self.errMsg = "���� ���� �ʼ������� �������ּ���";
		    		return;
		    	}
		    	self.errMsg = '';
		    	if(addrAdd){
			    	var nparmap = self.addr;
		            $.ajax({
		                url : "../order/addAddr.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) {
							
		                }
		            });
		    	}
		    },
		    fnGetAddrList(){
		    	var self = this;
		    	var nparmap = {userNo : self.userNo};
	            $.ajax({
	                url : "../order/searchAddr.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
						self.addrList = data.list;
						for(let i = 0; i < self.addrList.length; i++){
							if(self.addrList[i].defaultYn == 'Y'){
								self.addr.addrName= self.addrList[i].addrKind;
								self.addr.addr1= self.addrList[i].addr;
								self.addr.addr2= self.addrList[i].addr2;
								self.addr.zip= self.addrList[i].zipcode;
							}
						}
	                }
	            });
		    },
		    fnAddrChange(event){
		    	var self = this;
		    	 const selectedIndex = event.target.selectedIndex;
		    	 const selectedItem = self.addrList[selectedIndex];
	    	 	self.addr.addrName= selectedItem.addrKind;
				self.addr.addr1= selectedItem.addr;
				self.addr.addr2= selectedItem.addr2;
				self.addr.zip= selectedItem.zipcode;
				self.addrAdd = false;
		    }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetCoupon();
		self.fnGetAddrList();
		window.jusoCallBack = self.handleAddressCallback;
	}// created
});
</script>