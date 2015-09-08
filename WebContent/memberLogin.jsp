<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>

<title>會員登入</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script language="JavaScript">
	var flag = true;
	function check_login() {
		var Account = document.getElementById('Account');
		if (Account.value == '') {
			flag = false;
		}

		var Password = document.getElementById('Password');
		if (Password.value == '') {
			flag = false;                        
		}
		return flag;       
	}
        
        function PopuClose(){
            parent.location.assign("index.jsp");            
        }
</script>

</head>
<body bgcolor="#FCF7CB" onunload="PopuClose()">

	<div id="wrqpper">

		<div id="header">

		</div>
		<div id="content">
			<div class="container">

				<div class="col-xs-4"></div>
				<div class="col-xs-4">


					<h1>會員登入</h1>
					<form name="memberLogin" action="memberLoginCode.jsp" method="post"
						onSubmit="return check_login();">
						<p>
							帳號: <input id="Account" type="text" name="Account" />
						</p>
						<p>
							密碼: <input id="Password" type="password" name="Password" />
						</p>
						<p>
							<input type="submit" value="登入" />
							<input type="hidden" id="loginWrong" value="1" />
					</form>

					<%
					String LogIn = (String) session.getAttribute("LogIn");
					String update = (String) session.getAttribute("update");
					if (LogIn != null) {
					    if (LogIn.equals("no")) {
						    %>
						    <script language="JavaScript">
						    alert("輸入錯誤, 請再輸入一次!");
						    </script>
						    <%
						    session.setAttribute("LogIn", null);
					    }
					}
					
					if (update != null) {
					    if (update.equals("1")) {
	                        %>
	                        <script language="JavaScript">
	                        alert("帳號修改成功, 請重新登入!");
	                        </script>
	                        <%
	                        session.setAttribute("LogIn", null);
	                        session.setAttribute("update", null);
	                    }
					    
					    if (update.equals("2")) {
                            %>
                            <script language="JavaScript">
                            alert("密碼修改成功, 請重新登入!");
                            </script>
                            <%
                            session.setAttribute("LogIn", null);
                            session.setAttribute("update", null);
                        }
					     					    
					}
					%>

				</div>
				<div class="col-xs-4"></div>
				<div class="col-xs-12">
					<br /> <br /> <br />
				</div>
			</div>
		</div>
		<div id="footer">

		</div>

	</div>
</body>
</html>