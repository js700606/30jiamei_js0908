<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="shopping.DAO.*,shopping.Class.*, java.util.*,shopping.Business.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改會員資料</title>

<script language="JavaScript">
var accountFlag = false;
var newAccount;
function checkAccount(){
    newAccount = document.getElementById("newAccount"); 
    if (newAccount.value.length < 6 || newAccount.value.length > 14) {
        accountMsg.innerHTML = "<font color='red'>帳號長度不得小於6, 或大於14!</font>";
        accountFlag = false;
    } else {
        accountMsg.innerHTML = "";
        var imgAccount = document.getElementById("imgAccount");
        imgAccount.src = "memberImages/wait.gif";  // 
        getAccount();
    }
}

var request;
function getAccount()
{
    request = new XMLHttpRequest();
    request.open("GET", "checkValidAccount.jsp?Account=" + newAccount.value, true);
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
            imgAccount.src = "memberImages/a0.png";  // 代表OK, 可以修改
            accountFlag = true;
            }
        // alert(dup.value);
    }
}
function check_acc_data() {
	return accountFlag;
}
//-------------------------密碼--------------------------------

var passwordFlag = false;
var Password;
function check_login() {
    Password = document.getElementById('Password');
    var imgPassword = document.getElementById("imgPassword");
    imgPassword.src = "memberImages/wait.gif";
    
    request = new XMLHttpRequest();
    request.open("GET", "checkValidPassword.jsp?Password=" + Password.value, true);
    // 這行是設定 request 要去哪取資料，尚未開始取
    // 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
    // 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
        
    request.onreadystatechange = updatePassword;
    // 當記憶體中的瀏覽器狀態改變時，呼叫 updatePassword 這個 function
    
    request.send(null); // 發動 request 去取資料   
}

function updatePassword()
{
    if (request.readyState == 4)
    {
        // alert(request.responseText);
        var dupPassword = document.getElementById("dupPassword");
        dupPassword.value = request.responseText.trim();
        
        if (dupPassword.value == "1")
            {
            var imgPassword = document.getElementById("imgPassword");
            imgPassword.src = "memberImages/a0.png";  // 密碼正確
            passwordFlag = true;
            }
        else
            {
            var imgPassword = document.getElementById("imgPassword");
            imgPassword.src = "memberImages/a1.png";  // 密碼不正確
            passwordFlag = false;
            }
        // alert(dup.value);
    }
}

var newpasswordFlag = false;
var newPassword;
var imgPassword;
function checkPswd(){
    imgPassword = document.getElementById("imgPassword");   
    newPassword = document.getElementById("newPassword");
    if (newPassword.value.length < 6 || newPassword.value.length > 14) {
        passwordMsg.innerHTML = "<font color='red'>密碼長度不得小於6, 或大於14!</font>";
        newpasswordFlag = false;
    } else {
        passwordMsg.innerHTML = "";
        newpasswordFlag = true;
    }
}

var newpasswordFlag2 = false;
function checkPswd2(){      
    var newPassword = document.getElementById("newPassword");
    var Password2 = document.getElementById("Password2");
    if (newPassword.value == Password2.value ) {
        
        if (passwordFlag == true) {
            imgNewPassword.src = "memberImages/a0.png";
            newpasswordFlag2 = true;
        } else {
            imgNewPassword.src = "memberImages/a1.png";
            newpasswordFlag2 = false;
        }
    } else {
    imgNewPassword.src = "memberImages/a1.png";
    newpasswordFlag2 = false; // 密碼重打錯誤
    }
}

function check_pswd_data() {
	if (passwordFlag == false || newpasswordFlag == false || newpasswordFlag2 == false) {
		return false;
	}
	return true;
}

//-------------------------身份證字號----------------------------------

var idFlag = true;
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
            idFlag = true;
            getData();
        } else {
        img1.src = "memberImages/a1.png";
        idFlag = false; // 身份證字號錯誤
        }
    }
}

var request;
function getData()
{
    request = new XMLHttpRequest();
    request.open("GET", "checkValid.jsp?PersonalID=" + PersonalID.value, true);
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
            } else {
	            var img1 = document.getElementById("img1");
	            img1.src = "memberImages/a0.png";  // 代表OK, 可以新增
	            idFlag = true;
            }
        // alert(dup.value);
    }
}

//-------------------------電子信箱-----------------------------

var emailFlag = true;
var Email;
function checkEmail() {
    Email = document.getElementById("Email").value;
    var emailMsg = document.getElementById("emailMsg");
    if (Email.search(/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/)!=-1) {
      emailMsg.innerHTML = "";
      emailFlag = true;
    } else {
      emailMsg.innerHTML = "<font color='red'>電子信箱格式有誤, 請重新輸入!</font>";
      emailFlag = false;
    }
}

function check_data() {
	if (idFlag == false || emailFlag == false) {
		return false;
	} else {
		return true;
	}
}

</script>

<style>
    .ui-datepicker-week-end,
    .ui-datepicker-week-end
    a.ui-state-default {color:red;}
</style>
<link rel="stylesheet" href="js/jquery-ui-1.8.13-datepicker/jquery-ui-1.8.13.datepicker.css">
<script src="js/jquery-ui-1.8.13-datepicker/jquery-1.6.1.min.js"></script>
<script src="js/jquery-ui-1.8.13-datepicker/jquery-ui-1.8.13.datepicker.min.js"></script>
<script>
$(function() {
  $( "#BirthDate" ).datepicker({
      dateFormat: "yy-mm-dd",
      yearRange: "1920:2015",
      changeMonth: true,
      changeYear: true,
  });
});
</script>

</head>
<body bgcolor = "#FFFFE0">
<%
String LogIn = (String) session.getAttribute("LogIn");
String Account = (String) session.getAttribute("userAccount");
if (LogIn != null) {
    if (LogIn.equals("no")){
    %>
    <script>
    response.sendRedirect("memberLogin.jsp");
    </script>
    <%
    }
}

Membership acc = null;
Customer c = null;
if (Account != null)
{
    try
    {           
        MembershipDAO dao = new MembershipDAOimpl();
        acc = dao.searchbyAccount(Account);
        int cutmID = acc.getCustomerID();
        CustomerDAO daoc = new CustomerDAOimpl();
        c = daoc.searchbyID(cutmID);
        
        if (acc != null)
        {   
            if (LogIn.equals("yes")) {
                //out.print("1"); // 1 代表帳號正確且登入, 可以顯示資料 
                %>
                <h1>修改會員資料</h1>
                <p><font color="red">※帳號和密碼請單獨修改, 修改後請重新登入!</font></p>
                <form name="memberInfoUpdate" action="memberAccChange.jsp" method="post" onSubmit="return check_acc_data();">                   
                	<p>帳號: <input id="newAccount" type="text" name="newAccount" value="<%=acc.getAccount() %>" onblur="checkAccount();" />
                        <img id="imgAccount" src="memberImages/space.png" width="15px" height="15px" />
                        </p>
                        <div id="accountMsg"/></div>
                        <input type="hidden" id="dupAccount" value="1" />
                        <p><input type="submit" value="更新帳號" /></p>
                </form>
                    
               <form name="memberInfoUpdate" action="memberPswdChange.jsp" method="post" onSubmit="return check_pswd_data();">
               <p>請輸入原來密碼: <input id="Password" type="password" name="Password" onblur="check_login();"/>
               <img id="imgPassword" src="memberImages/space.png" width="15px" height="15px" />
               </p>
               <input type="hidden" id="dupPassword" value="0" />
               <p>請輸入新密碼: <input id="newPassword" type="password" name="newPassword" onblur="checkPswd();"/></p>
                    <div id="passwordMsg"/></div>                   
                    <p>再一次輸入新密碼: <input id="Password2" type="password" name="Password2" onblur="checkPswd2();"/>
                    <img id="imgNewPassword" src="memberImages/space.png" width="15px" height="15px" />
                    </p>
                    <p><input type="submit" value="更新密碼" /></p>
               </form>
               
                <form name="memberInfoUpdate" action="memberInfoUpdateCode.jsp" method="post" onSubmit="return check_data();">        
                <p>會員姓名: <input id="CustomerName" type="text" name="CustomerName" value="<%=c.getCustomerName() %>" /></p>
                <p>身份證字號: <input id="PersonalID" type="text" name="PersonalID" value="<%=c.getPersonalID() %>" onblur="checkTwID();" />
                <img id="img1" src="memberImages/space.png" width="15px" height="15px" />
                </p><input type="hidden" id="dup" value="1" />
                <p>生日: <input id="BirthDate" name="BirthDate" type="text" value="<%=c.getBirthDate() %>" /></p>
                <p>電話: <input id="Phone" type="text" name="Phone" value="<%=c.getPhone() %>" /></p>
                <p>手機: <input id="CelPhone" type="text" name="CelPhone" value="<%=c.getCelPhone() %>" /></p>
                <p>地址: <input id="Address" type="text" name="Address" value="<%=c.getAddress() %>" /></p>
                <p>電子信箱: <input id="Email" type="text" name="Email" value="<%=c.getEmail() %>" onblur="checkEmail();" /></p>
                <div id="emailMsg" ></div>
                <p>會員等級: <%=c.getDiscountID() %></p>
                <p><input type="submit" value="更新基本資料" /></p>
                </form>
<%
            } else {
                //.print("0"); // 0 代表有該帳號, 但沒有登入
                response.sendRedirect("memberLogin.jsp");
            }
        }
        
    }
    catch(Exception e)
    {
        //out.print("0");
        response.sendRedirect("memberLogin.jsp");
    }
        
}
else
{
    //out.print("0");
    response.sendRedirect("memberLogin.jsp");
} 
%>
</body>
</html>