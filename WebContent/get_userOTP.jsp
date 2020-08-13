<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css"  crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/login-page.css">
    <title>My Demo App</title>
</head>
<body>

	<%
	String uname=(String)session.getAttribute("user");
        
    //redirect user to home page if already logged in
        if(uname!=null){
            response.sendRedirect("Welcome.jsp");
        }
 
	%>


    <div id="logreg-forms">
       
            <form action="verifyOTP.jsp">
                <input type="number" id="user_otp" name="user_otp" class="form-control" placeholder="Enter OTP" required="" autofocus="">
                <button class="btn btn-primary btn-block" type="submit">Verify OTP</button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            <br>
            
    </div>
    
 <!--    <form action="verifyOTP.jsp">
    	<input type="number" name="user_otp" placeholder="Enter OTP" required="" >
    	<input type="submit"  value="Verify" >
    </form> -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="assets/js/loginScript.js"></script>
</body>
</html>