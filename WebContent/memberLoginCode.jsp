<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="shopping.DAO.*,shopping.Class.*, java.util.*,shopping.Business.* "%>
<%
String Account = request.getParameter("Account");
String Password = request.getParameter("Password");
String hashPswd = SavePWD.encode(Password);

Membership acc = null;
if (Account != null)
{
    try
    {           
        MembershipDAO dao = new MembershipDAOimpl();
        acc = dao.searchbyAccount(Account);
        
        if (acc == null)
        {
            //out.print("0"); // 0 代表沒有該帳號, 無法登入
            session.setAttribute("LogIn","no");
            session.setAttribute("userAccount","");
        }
        else
        {
            if (hashPswd.equals(acc.getPassword())){
                //out.print("1"); // 1 代表帳號密碼均正確, 可以登入
                session.setAttribute("LogIn","yes");
                session.setAttribute("userAccount",Account);
                response.sendRedirect("index.jsp");           
                
            } else {
                //.print("0"); // 0 代表有該帳號, 但密碼錯誤, 無法登入
                session.setAttribute("LogIn","no");
                session.setAttribute("userAccount","");
                //response.sendRedirect("memberLogin.html");
            }
        }
        
    }
    catch(Exception e)
    {
        //out.print("0");
        session.setAttribute("LogIn","no");
        session.setAttribute("userAccount","");
    }
        
}
else
{
    //out.print("0");
    session.setAttribute("LogIn","no");
    session.setAttribute("userAccount","");
} 

String LogIn = (String)session.getAttribute("LogIn");
if (LogIn.equals("no")) {

       response.sendRedirect("memberLogin.jsp");
}

%>
