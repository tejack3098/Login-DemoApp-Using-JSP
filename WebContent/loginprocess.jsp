<%@page import="bean.LoginDao"%>
<jsp:useBean id="obj" class="bean.UserBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
boolean status=LoginDao.validate(obj);
if(status){
	session.setAttribute("user",obj.getUname());
	response.sendRedirect("Welcome.jsp");
}
else
{
out.print("Sorry, email or password error");
%>

<jsp:include page="index.jsp"></jsp:include>

<%
}
%>