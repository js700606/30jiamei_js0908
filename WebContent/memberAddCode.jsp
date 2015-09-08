<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="shopping.DAO.*,shopping.Class.*, java.util.*,shopping.Business.* "%>

<%
request.setCharacterEncoding("UTF-8");
String CustomerName = request.getParameter("CustomerName");
String PersonalID = request.getParameter("PersonalID");

String Gender = request.getParameter("Gender");
if (Gender == "2") {
	Gender = "0"; // 0為女性, 但身份證是2為女性
}
byte GenderNum = Byte.parseByte(Gender); // 字串轉為數字

String BirthDate = request.getParameter("BirthDate");
String Phone = request.getParameter("Phone_1") + request.getParameter("Phone_2");
String CelPhone = request.getParameter("CelPhone_1") + request.getParameter("CelPhone_2");
String Address = request.getParameter("Address");
String Email = request.getParameter("Email");

Customer c = new Customer(null, CustomerName, PersonalID, GenderNum, BirthDate,
        Phone, CelPhone, Address, Email, "1", 1); //Discounts 折扣類別表必須有資料, 此更新才會成功

//-------------------------------------------------------

String Account = request.getParameter("Account");
String Password = request.getParameter("Password");
String hashPswd = SavePWD.encode(Password);

Membership acc = new Membership(null, Account, hashPswd, (byte)0);
c.setMember(acc);  // Customer 擁有 Member 這個物件

//Membership acc = new Membership();
//acc.setAccount(Account);
//acc.setPassword(hashPswd);
//acc.setMembership((byte)0);

CustomerDAO dao = new CustomerDAOimpl();
dao.add(c);


response.sendRedirect("index_min.jsp");


%>    
