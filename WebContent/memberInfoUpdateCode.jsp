<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="shopping.DAO.*,shopping.Class.*, java.util.*,shopping.Business.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body bgcolor = "#FFFFE0">
<%
request.setCharacterEncoding("UTF-8");
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

String CustomerName = request.getParameter("CustomerName");
String PersonalID = request.getParameter("PersonalID");
String BirthDate = request.getParameter("BirthDate");
String Phone = request.getParameter("Phone");
String CelPhone = request.getParameter("CelPhone");
String Address = request.getParameter("Address");
String Email = request.getParameter("Email");


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
        
        String oldCustomerName = c.getCustomerName();
        String oldPersonalID = c.getPersonalID();
        String oldBirthDate = c.getBirthDate();
        String oldPhone = c.getPhone();
        String oldCelPhone = c.getCelPhone();
        String oldAddress = c.getAddress();      
        String oldEmail = c.getEmail();      
        
        if (acc != null)
        {   
            if (LogIn.equals("yes")) {
                //out.print("1"); // 1 代表帳號正確且登入, 可以顯示資料 
                if (CustomerName.trim().equals("") == false && CustomerName.equals(oldCustomerName) == false) {
                    c.setCustomerName(CustomerName);
                    session.setAttribute("update","3");
                }
                
                if (PersonalID.trim().equals("") == false && PersonalID.equals(oldPersonalID) == false) {
                    c.setPersonalID(PersonalID);
                    session.setAttribute("update","3");
                }
                
                if (BirthDate.trim().equals("") == false && BirthDate.equals(oldBirthDate) == false) {
                    c.setBirthDate(BirthDate);
                    session.setAttribute("update","3");
                }
                
                if (Phone.trim().equals("") == false && Phone.equals(oldPhone) == false) {
                    c.setPhone(Phone);
                    session.setAttribute("update","3");
                }
                
                if (CelPhone.trim().equals("") == false && CelPhone.equals(oldCelPhone) == false) {
                    c.setCelPhone(CelPhone);
                    session.setAttribute("update","3");
                }
                
                if (Address.trim().equals("") == false && Address.equals(oldAddress) == false) {
                    c.setAddress(Address);
                    session.setAttribute("update","3");
                }
                
                if (Email.trim().equals("") == false && Email.equals(oldEmail) == false) {
                    c.setEmail(Email);
                    session.setAttribute("update","3");
                }
                                
                daoc.update(c);
                response.sendRedirect("memberInfo.jsp");                
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