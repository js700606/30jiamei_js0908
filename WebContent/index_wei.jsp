<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>

	</head>
	<body>
	
<p>
<%
String LogIn = (String) session.getAttribute("LogIn");
String Account = (String) session.getAttribute("userAccount");
if (LogIn != null) {
    if (LogIn.equals("yes")) {
	out.print(Account + " 您好!" + "<a class='iframe' href='memberLogout.jsp'>(登出)</a>" +
	        " <a class='iframe' href='memberInfo.jsp'>瀏覽會員資料</a>" +
	        " <a class='iframe' href='memberInfoUpdate.jsp'>修改會員資料</a>");
	    } else {
	        out.print("<a class='iframe' href='memberLogin.jsp'>會員登入</a>" +
	                " <a class='iframe' href='memberAdd.jsp'>會員申請</a>");
	    }

} else {
    out.print("<a class='iframe' href='memberLogin.jsp'>會員登入</a>" +
            " <a class='iframe' href='memberAdd.jsp'>會員申請</a>");
}
%>
</p>


	</body>
</html>
   