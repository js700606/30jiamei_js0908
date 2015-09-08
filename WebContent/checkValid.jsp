<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="shopping.DAO.*,shopping.Class.*, java.util.*"%><%
    String s = request.getParameter("PersonalID");
    String Account = (String) session.getAttribute("userAccount");
    Membership acc = null;
    Customer c = null;
    Customer oldc = null;
    if (s != null) {
        try {    		
            MembershipDAO dao = new MembershipDAOimpl();
            acc = dao.searchbyAccount(Account);
            int cutmID = acc.getCustomerID();
            CustomerDAO daoc = new CustomerDAOimpl();
            oldc = daoc.searchbyID(cutmID); // 目前登入的客戶物件
            c = daoc.SearchbyPersonalID(s); // 新ID所找到的客戶物件
    		
    	    if (c == null) {
    	    	out.print("0");	// 0 代表沒有重複可以新增
    	    }
    	    else {
    	        if (Account != null && c.getCustomerID() == oldc.getCustomerID()) {
    	            out.print("0"); // 2 代表已登入的會員輸入不變的身份證字號
    	        } else {
    	        out.print("1");	// 1 代表有重複不可以新增
    	        }    			
    	    }
    	}
    	catch(Exception e) {
    		out.print("1");
    	}
    		
    } else {
    	out.print("1");
    }%>

