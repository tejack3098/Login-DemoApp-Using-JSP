<%@page import="bean.EmailChkDao"%>
<%@page import="bean.ConnectionProvider"%>

<jsp:useBean id="obj" class="bean.UserBean" scope="session"/>
<jsp:setProperty property="*" name="obj"/>

<% 

String pass = request.getParameter("pass");
String cpass = request.getParameter("u_cpass");

Boolean  status=EmailChkDao.chk_email(obj);

if(pass.equals(cpass)){
	
	if(status){
		
		out.print("Email ID Already Exits");
	%>
			<jsp:include page="index.jsp"></jsp:include>
	<%	
		
	}else{
		
	%>	
		<jsp:include page="mailOTP.jsp"/>  
	<% 	
		response.sendRedirect("get_userOTP.jsp");
	}

}
else{	
	out.print("Password Doesn't Matched");
%>
	<jsp:include page="index.jsp"></jsp:include>
<%
	}
%> 