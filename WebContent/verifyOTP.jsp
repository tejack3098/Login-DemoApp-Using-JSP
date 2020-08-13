<%@page import="bean.RegisterDao"%>

<jsp:useBean id="obj" class="bean.UserBean" scope="session"/>


<%
	int otp= (int)session.getAttribute("otp");
	int user_otp = Integer.parseInt(request.getParameter("user_otp"));
	
	System.out.println(otp);
	System.out.println(user_otp);
	
	if(otp == user_otp){
		
		Boolean status=RegisterDao.register_user(obj);
		if(status){
			session.setAttribute("user",obj.getUname());
			response.sendRedirect("Welcome.jsp");
		}	
	}else{
		out.print("OTP is Incorrect!");
%>
		<jsp:include page="index.jsp"/>
<%
	}	
%>