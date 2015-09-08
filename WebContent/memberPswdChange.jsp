<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="shopping.DAO.*,shopping.Class.*, java.util.*,shopping.Business.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
String newPassword = request.getParameter("newPassword");
String hashPswd = SavePWD.encode(newPassword);
Membership acc = null;
Customer c = null;
if (newPassword != null)
{
    try
    {           
        MembershipDAO dao = new MembershipDAOimpl();
        acc = dao.searchbyAccount(Account);
        
        if (acc != null)
        {   
            if (LogIn.equals("yes")) {
                //out.print("1"); // 1 代表帳號正確且登入, 可以顯示資料                  
                acc.setPassword(hashPswd);
                dao.update(acc);
                session.setAttribute("update","2");
                session.setAttribute("Account",null);
                response.sendRedirect("memberLogin.jsp");
                
            } else {
                //.print("0"); // 0 代表有該帳號, 但沒有登入
                response.sendRedirect("index.jsp");
            }
        }
        
    }
    catch(Exception e)
    {
        //out.print("0");
        response.sendRedirect("index.jsp");
    }
        
}
else
{
    //out.print("0");
    response.sendRedirect("index.jsp");
}
%>
</body>
</html>