<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
var Gender = request.getParameter("Gender");
if (Gender == "2") {
	Gender = "0"; // 0為女性, 但身份證是2為女性
}
var Phone = request.getParameter("Phone_1") + request.getParameter("Phone_2");
var CelPhone = request.getParameter("CelPhone_1") + request.getParameter("CelPhone_2");

Customer c = new Customer(null, request.getParameter("CustomerName"), request.getParameter("PersonalID"), Gender,request.getParameter("BirthDate"), Phone, CelPhone, request.getParameter("Address"),request.getParameter("Email"), "1", 1);
CustomerDAO dao = new CustomerDAOimpl();
dao.add(c);
response.sendRedirect("../index.html");
%>    
