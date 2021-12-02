<%@page import="com.mycart.entities.Users"%>

<%
Users users1 = (Users) session.getAttribute("current-user");
%>


<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">Mycart</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> Dropdown link </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>


			</ul>

			<ul class="navbar-nav ml-auto">
			
			<li class="navbar-nav active"><a class="nav-link active"
					aria-current="page" href="#" data-bs-toggle="modal" data-bs-target="#cart"><i class=" 	fa fa-cart-plus" style="font-size:30px;"></i><span  class="cart-items" style="font-size:15px;">(0)</span></a></li>

				<%
				if (users1 == null) {
				%>
				<li class="navbar-nav active"><a class="nav-link active"
					aria-current="page" href="login.jsp">Login</a></li>
				<li class="navbar-nav active"><a class="nav-link active"
					aria-current="page" href="register.jsp">Register</a></li>
				<%
				} else {
				%>

				<li class="navbar-nav active"><a class="nav-link active"
					aria-current="page"><%=users1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%></a></li>
				<li class="navbar-nav active"><a class="nav-link active"
					aria-current="page" href="LogoutServlet">Logout</a></li>

				<%
				}
				%>

			</ul>

		</div>
	</div>




</nav>