<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="shopping.DAO.*,shopping.Class.*, java.util.*,shopping.Business.*" %><%
    String Acnt = (String) session.getAttribute("userAccount"); 
    String Pswd = request.getParameter("Password");
    String hashPswd = SavePWD.encode(Pswd);
    String accPassword = "";
    
    Membership acc = null;
    if (Pswd != null)
    {
        try
        {
            MembershipDAO dao = new MembershipDAOimpl();
            acc = dao.searchbyAccount(Acnt);
            accPassword = acc.getPassword();
            if (acc != null)
            {
                if (accPassword.equals(hashPswd)) {
                out.print("1"); // 1 代表密碼存在且正確
                } else {
                    out.print("0"); // 0 代表密碼不存在或不正確
                }               
            }
                        
        }
        catch(Exception e)
        {
            out.print("0");
        }
            
    }
    else
    {
        out.print("0");
    }%>