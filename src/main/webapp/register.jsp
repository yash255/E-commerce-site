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

<div class="container-fluid">

<div class="row mt-5">
<div class="col-md-4 offset-md-4">

<form action="RegisterServlet" method="post">

<div class="card">
<%@include file="components/message.jsp" %>

<div class="card-body">
<div class="text-center">
<img src="img/signup.png" width="100px">

</div>

<h2 class="text-center my-3">Sign Up</h2>

<div class="mb-3">
  
  <label for="name" class="form-label">Name</label>
    <input type="text" required class="form-control" id="name" name="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
   
  </div>



<div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input type="email" required class="form-control" id="email" name="user_email" aria-describedby="emailHelp" placeholder="Enter Email">
   
  </div>
  
  <div class="mb-3">
    <label for="password" class="form-label">Password</label>
    <input type="password" required class="form-control" id="password" name="user_password" placeholder="Enter Password">
  </div>
  
   <div class="mb-3">
    <label for="phone" class="form-label">Phone Number</label>
    <input type="tel" pattern="[1-9]{1}[0-9]{9}" required class="form-control"  id="phone" name="user_phone" placeholder="Enter Phone">
  </div>
  

<div class="mb-3">
    <label for="address" class="form-label">Address</label>
    <textarea type="text" rows=5 required class="form-control" id="address" name="user_address" placeholder="Enter Address"></textarea>
  </div>

<div class="cntainer text-center">

<button type="submit" class="btn btn-outline-success">Register</button>
<button type="reset" class="btn btn-outline-warning">Reset</button>


</div>

</form>

<div class="alert alert-light" role="alert">
  If Registered <a href="login.jsp" class="alert-link">Click Here to Login</a>
</div>




</div>





</div>


</div>



</div>





</div>
</body>
</html>