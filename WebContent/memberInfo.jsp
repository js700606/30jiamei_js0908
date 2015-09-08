<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="shopping.DAO.*,shopping.Class.*, java.util.*,shopping.Business.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員資料</title>
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
                out.print("<h1>會員資料</h1>");
                out.print("帳號: " + acc.getAccount() + "<br /><br />");
                out.print("密碼: <font color='red'>為維護會員權益, 本站不提供密碼查詢.</font><br /><br />");
                out.print("會員姓名: " + c.getCustomerName() + "<br /><br />");
                out.print("身份證字號: " + c.getPersonalID() + "<br /><br />");
                out.print("生日: " + c.getBirthDate() + "<br /><br />");
                out.print("電話: " + c.getPhone() + "<br /><br />");
                out.print("手機: " + c.getCelPhone() + "<br /><br />");
                out.print("地址: " + c.getAddress() + "<br /><br />");
                out.print("電子信箱: " + c.getEmail() + "<br /><br />");
                out.print("會員等級: " + c.getDiscountID() + "<br /><br />");                
                
                String update = (String) session.getAttribute("update");        
                if (update != null) {
                    if (update.equals("3")) {
                        %>
                        <script language="JavaScript">
                        alert("基本資料修改成功!");
                        </script>
                        <%
                        session.setAttribute("update", null);
                    }
                }
                
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