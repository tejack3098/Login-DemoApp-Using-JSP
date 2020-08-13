<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>



<%
	Random rand = new Random();
	int otp = rand.nextInt(900000) + 100000;
	session.setAttribute("otp",otp);


   String email = (String)request.getParameter("email");
   String result;
   
   // Recipient's email ID needs to be mentioned.
   String to = email;

   // Sender's email ID needs to be mentioned
   String from = "tejas.choudhari11@gmail.com";

   // Assuming you are sending email from localhost
   String host = "localhost";

   final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
   // Get system properties object
   Properties props = System.getProperties();
     props.setProperty("mail.smtp.host", "smtp.gmail.com");
     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
     props.setProperty("mail.smtp.socketFactory.fallback", "false");
     props.setProperty("mail.smtp.port", "465");
     props.setProperty("mail.smtp.socketFactory.port", "465");
     props.put("mail.smtp.auth", "true");
     props.put("mail.debug", "true");
     props.put("mail.store.protocol", "pop3");
     props.put("mail.transport.protocol", "smtp");
     final String username = "tejas.choudhari11@gmail.com";//
     final String password = "shreyatej3698";

   // Get the default Session object.
   Session mailsession = Session.getInstance(props, new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(username, password);
    }
});

   try {
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailsession);
      
      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));
      
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
      
      // Set Subject: header field
      message.setSubject("This is the Subject Line!");
     
      // Send the actual HTML message, as big as you like
      message.setContent("<h1>Your OTP is: </h1>"+ otp, "text/html" );
      
      // Send message
      Transport.send(message);
      result = "Sent message successfully....";
   } catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>