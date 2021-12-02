<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="container">
<div class=row>
<div class="col-md-6 offset-md-3">

<div class="card mt-3">

<div class="card-header custom-bg text-white">

<h3>Login Here</h3>


</div>


<div class="card-body">
<%@include file="components/message.jsp" %>

<form action="LoginServlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="login_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
   
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="login_password" class="form-control" id="exampleInputPassword1">
  </div>
  
 <div class="container text-center">
  <button type="submit" class="btn custom-bg border-0 text-white">Submit</button>
   <button type="reset" class="btn custom-bg border-0 text-white">Reset</button>
  </div>
</form>


</div>

<div class="alert alert-light" role="alert">
  Not Registered ? <a href="register.jsp" class="alert-link">Click Here to Register</a>
</div>


</div>


</div>

</div>

</div>

</body>
</html>