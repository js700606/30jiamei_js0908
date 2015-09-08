<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員申請</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<style>
	.ui-datepicker-week-end,
	.ui-datepicker-week-end
	a.ui-state-default {color:red;}
</style>

<link rel="stylesheet" href="js/jquery-ui-1.8.13-datepicker/jquery-ui-1.8.13.datepicker.css">
<script src="js/jquery-ui-1.8.13-datepicker/jquery-1.6.1.min.js"></script>
<script src="js/jquery-ui-1.8.13-datepicker/jquery-ui-1.8.13.datepicker.min.js"></script>

<script language="JavaScript">

var accountFlag = false;
var Account;
function checkAccount(){
	Account = document.getElementById("Account");	
	pswd = document.getElementById("Password");
	if (Account.value.length < 6 || Account.value.length > 14) {
		accountMsg.innerHTML = "<font color='red'>帳號長度不得小於6, 或大於14!</font>";
        accountFlag = false;
    } else {
    	accountMsg.innerHTML = "";
    	accountFlag = true;
    	var imgAccount = document.getElementById("imgAccount");
    	imgAccount.src = "memberImages/wait.gif";  // 
    	getAccount();
    }
}

var request;
function getAccount()
{
    request = new XMLHttpRequest();
    request.open("GET", "checkValidAccount.jsp?Account=" + Account.value, true);
    // 這行是設定 request 要去哪取資料，尚未開始取
    // 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
    // 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
        
    request.onreadystatechange = updateAccount;
    // 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
    
    request.send(null); // 發動 request 去取資料      
}

function updateAccount()
{
    if (request.readyState == 4)
    {
        // alert(request.responseText);
        var dupAccount = document.getElementById("dupAccount");
        dupAccount.value = request.responseText.trim();
        
        if (dupAccount.value == "1")
            {
            var imgAccount = document.getElementById("imgAccount");
            imgAccount.src = "memberImages/a1.png";  // 不能新增
            }
        else
            {
            var imgAccount = document.getElementById("imgAccount");
            imgAccount.src = "memberImages/a0.png";  // 代表OK, 可以新增
            }
        // alert(dup.value);
    }
}

var passwordFlag = false;
var Password;
var imgPassword;
function checkPswd(){
	imgPassword = document.getElementById("imgPassword");	
	Password = document.getElementById("Password");
	if (Password.value.length < 6 || Password.value.length > 14) {
		passwordMsg.innerHTML = "<font color='red'>密碼長度不得小於6, 或大於14!</font>";
        passwordFlag = false;
    } else {
    	passwordMsg.innerHTML = "";
    	passwordFlag = true;
    }
}

var passwordFlag2 = false;
function checkPswd2(){		
	var Password = document.getElementById("Password");
	var Password2 = document.getElementById("Password2");
    if (Password.value == Password2.value ) {
       	
       	if (passwordFlag == true) {
       		imgPassword.src = "memberImages/a0.png";
       		passwordFlag2 = true;
       	} else {
       		imgPassword.src = "memberImages/a1.png";
       		passwordFlag2 = false;
       	}
   	} else {
   	imgPassword.src = "memberImages/a1.png";
   	passwordFlag2 = false; // 密碼重打錯誤
   	}
}

var idFlag = false;
var PersonalID;
function checkTwID(){
	var img1 = document.getElementById("img1");	
	PersonalID = document.getElementById("PersonalID");
	var city = new Array(
         1,10,19,28,37,46,55,64,39,73,82, 2,11,
        20,48,29,38,47,56,65,74,83,21, 3,12,30 );
	PersonalID.value = PersonalID.value.toUpperCase();
	if (PersonalID.value.search(/^[A-Z](1|2)\d{8}$/i) == -1) {
        img1.src = "memberImages/a1.png";
        idFlag = false;
    }
     else {
        //將字串分割為陣列(IE必需這麼做才不會出錯)
        PersonalID.value.split('');
        //計算總分
        var total = city[PersonalID.value.charCodeAt(0)-65];
        for(var i=1; i<=8; i++){
            total += (PersonalID.value.charCodeAt(i)-48) * (9 - i);
        }
        //補上檢查碼(最後一碼)
        total += (PersonalID.value.charCodeAt(9)-48);
        //檢查比對碼(餘數應為0);
        // return ((total%10 == 0 ));
        if (total % 10 == 0 ) {
        	img1.src = "memberImages/wait.gif";
        	getData();
    	} else {
    	img1.src = "memberImages/a1.png";
    	idFlag = false; // 身份證字號錯誤
    	}
	}
}

var genderFlag = false;
var Gender;
function checkGender() {
	Gender = document.getElementById("Gender");
	var genderMsg = document.getElementById("genderMsg");
	if (Gender.checked) {
		Gender.value = "1";
	} else {
		Gender.value = "2";
	}

	if (PersonalID.value[1] != Gender.value) {		
		genderMsg.innerHTML = "<font color='red'>性別與身份證字號不符!</font>";
		genderFlag = false;
	} else {
		genderMsg.innerHTML = "";
		genderFlag = true;
	}
}

var emailFlag = false;
var Email;
function checkEmail() {
	Email = document.getElementById("Email").value;
	if (Email.search(/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/)!=-1) {
	  emailMsg.innerHTML = "";
	  emailFlag = true;
	} else {
	  emailMsg.innerHTML = "<font color='red'>電子信箱格式有誤, 請重新輸入!</font>";
	  emailFlag = false;
	}
}

var request;
function getData()
{
	request = new XMLHttpRequest();
	request.open("GET", "checkValidPersonalID.jsp?PersonalID=" + PersonalID.value, true);
	// 這行是設定 request 要去哪取資料，尚未開始取
	// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
	// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
		
	request.onreadystatechange = updateData;
	// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
	
	request.send(null); // 發動 request 去取資料		
}

function updateData()
{
	if (request.readyState == 4)
	{
		// alert(request.responseText);
		var dup = document.getElementById("dup");
		dup.value = request.responseText.trim();
		
		if (dup.value == "1")
			{
				var img1 = document.getElementById("img1");
				img1.src = "memberImages/a1.png";  // 不能新增
				idFlag = false;
			} else if (dup.value == "2") { // 2代表登入者輸入自己的相同ID
				var img1 = document.getElementById("img1");
				img1.src = "memberImages/a1.png";  // 不能新增
	            idFlag = false;
			} else {
				var img1 = document.getElementById("img1");
				img1.src = "memberImages/a0.png";  // 代表OK, 可以新增
				idFlag = true;
			}
		// alert(dup.value);
	}
}

function check_data()
{
   var flag = true;
   var message = '';

   if (accountFlag == false || passwordFlag == false || passwordFlag2 == false ||
		   idFlag == false || genderFlag == false || emailFlag == false){
   		message = message + '有欄位格式輸入錯誤\n\n';
   		flag = false;
   }
   
   // ---------- Check ----------
   var Account = document.getElementById('Account');
   if(Account.value=='')
   {
      message = message + '帳號不能為空白\n';
      flag = false;
   }
   
   var Password = document.getElementById('Password');
   if(Password.value=='')
   {
      message = message + '密碼不能為空白\n';
      flag = false;
   }
   
   var CustomerName = document.getElementById('CustomerName');
   if(CustomerName.value=='')
   {
      message = message + '會員名稱不能為空白\n';
      flag = false;
   }

   var PersonalID = document.getElementById('PersonalID');
   if(PersonalID.value=='')
   {
      message = message + '身份證字號不能為空白\n';
      flag = false;
   }
   
   var Gender = document.getElementById('Gender');
   if(Gender.value=='0')
   {
      message = message + '性別欄位須點選\n';
      flag = false;
   }

   var BirthDate = document.getElementById('BirthDate');
   if(BirthDate.value=='')
   {
      message = message + '生日不能為空白\n';
      flag = false;
   }

   var Phone_1 = document.getElementById('Phone_1');
   var Phone_2 = document.getElementById('Phone_2');
   if(Phone_1.value=='' || Phone_2.value=='')
   {
      message = message + '電話不能為空白\n';
      flag = false;
   }

   var CelPhone_1 = document.getElementById('CelPhone_1');
   var CelPhone_2 = document.getElementById('CelPhone_2');
   if(CelPhone_1.value=='' || CelPhone_2.value=='')
   {
      message = message + '手機不能為空白\n';
      flag = false;
   }

   var Address = document.getElementById('Address');
   if(Address.value=='')
   {
      message = message + '地址不能為空白\n';
      flag = false;
   }

   var Email = document.getElementById('Email');
   if(Email.value=='')
   {
      message = message + '電子信箱不能為空白\n\n';
      flag = false;
   }
   
   var dupAccount = document.getElementById('dupAccount');
   if (accountFlag == true) {   
	   if(dupAccount.value=='1')
	   {
	      message = message + '帳號不得重覆\n';
	      flag = false;
	   }
	}

   var dup = document.getElementById('dup');
   if (idFlag == true) {   
	   if(dup.value=='1')
	   {
	      message = message + '身份證字號不得重覆\n';
	      flag = false;
	   }
	}
   
   if(!flag) 
   {
      alert(message);
   }
   return flag;
}
</script>

<script>
	$(function() {
	  $( "#BirthDate" ).datepicker({
	      dateFormat: "yy-mm-dd",
	      yearRange: "1920:2015",
	      changeMonth: true,
	      changeYear: true,
	  });
	});
        
        function PopuClose(){
            parent.location.assign("index.jsp");            
        }
</script>

</head>
<body bgcolor="#E3FCB0" onunload="PopuClose()">

	<div id="wrqpper">

		<div id="header">

		</div>
		<div id="content">
			<div class="container">
			
			<div class="col-xs-4"></div>
			<div class="col-xs-4">

					
					<h1>會員申請</h1>
					<p>＊所有欄位均必填</p>
					<form name="memberAdd" action="memberAddCode.jsp" method="post" onSubmit="return check_data();">

					<p>帳號: <input id="Account" type="text" name="Account" onblur="checkAccount();"/>
					<img id="imgAccount" src="memberImages/space.png" width="15px" height="15px" />
					</p>
					<div id="accountMsg"/></div>
					<input type="hidden" id="dupAccount" value="1" />
					
					<font color="#ff00ff">請注意: 帳號和密碼最少6個英數字, 不得超過14個。</font>
					<p>密碼: <input id="Password" type="password" name="Password" onblur="checkPswd();"/></p>
					<div id="passwordMsg"/></div>					
					<p>再一次輸入密碼: <input id="Password2" type="password" name="Password2" onblur="checkPswd2();"/>
					<img id="imgPassword" src="memberImages/space.png" width="15px" height="15px" />
					</p>

					<p>會員姓名: <input id="CustomerName" type="text" name="CustomerName" /></p>
					<p>身份證字號: <input id="PersonalID" type="text" name="PersonalID" onblur="checkTwID();" />
					<img id="img1" src="memberImages/space.png" width="15px" height="15px" />
					</p>
					<input type="hidden" id="dup" value="1" />

					<p>性別: <input id="Gender" type="radio" name="Gender" value="0" onclick="checkGender();" />男
					   <input id="Gender" type="radio" name="Gender" value="0" onclick="checkGender();"/>女</p><div id="genderMsg"/></div>
										
					<p>生日: <input id="BirthDate" name="BirthDate" type="text"> (西元年-月-日)</p>
					
					  
					<p>電話: (<input id="Phone_1" type="text" name="Phone_1" size="5px" />) - 
					   <input id="Phone_2" type="text" name="Phone_2" size="12px" /></p>
					<p>手機: (<input id="CelPhone_1" type="text" name="CelPhone_1" size="5px" />) - 
					   <input id="CelPhone_2" type="text" name="CelPhone_2" size="12px" /></p> 
					<p>地址: <input id="Address" type="text" name="Address" size="30px"/></p>
					<p>電子信箱: <input id="Email" type="text" name="Email" onblur="checkEmail();"/></p><div id="emailMsg" ></div>

					<p><input type="submit" value="加入" /></p>
					</form>

			
				</div>
				<div class="col-xs-4"></div>
				<div class="col-xs-12">
				<br/><br/><br/>
				</div>
			</div>			
		</div>
		<div id="footer">

		</div>
		</div>

</body>
</html>