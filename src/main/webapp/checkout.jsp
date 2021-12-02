
<%
Users users = (Users) session.getAttribute("current-user");
if (users == null) {

	session.setAttribute("message", "You are not logged in");
	response.sendRedirect("login.jsp");

	return;

}
%>














<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>

<div class="container">

<div class="row">
<div class="col-md-6">

<div class="card">
<div class="cart-body">
<h1 class="text-center">Your selected items</h1>
<div class="cart-body">

</div>
</div>
</div>

</div>
<div class="col-md-6">

<div class="card">
<div class="cart-body">
<h1 class="text-center">Your Details for order</h1>
<form action="" method="post">

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input value="<%=users.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label"> Name</label>
    <input value=<%=users.getUserName() %> type="text" class="form-control" id="name" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Contact</label>
    <input value=<%=users.getUserPhone() %> type="text" class="form-control" id="name" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="form-floating">
  <textarea value="<%=users.getUserAddress() %>" class="form-control" placeholder="Leave a comment here" id="floatingTextarea">Shipping Address</textarea>
  <label for="floatingTextarea">Your Shipping address</label>
</div>

<div class="container text-center">
<button class="btn custom-bg text-white">Place Order</button>
<button class="btn btn-primary text-white">Continue Shopping</button>
</div>
</form>



</div>
</div>

</div>


</div>

</div>



<%@include file="components/comman_modal.jsp" %>
</body>
</html>