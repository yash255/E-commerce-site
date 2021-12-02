
<%@page import="java.util.Map"%>
<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entities.Users"%>
<%
Users users = (Users) session.getAttribute("current-user");
if (users == null) {

	session.setAttribute("message", "You are not logged in");
	response.sendRedirect("login.jsp");

	return;

} else {

	if (users.getUserType().equals("normal")) {

		session.setAttribute("message", "You are not authorized user");
		response.sendRedirect("login.jsp");

		return;
	}
}
%>


						<%
						CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
						List<Category> list = cDao.getCategories();
						
						//getting count
						
		Map<String,Long>	m=			Helper.getCounts(FactoryProvider.getFactory());
						%>
						
						
					


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>


	<div class="container-fluid mt-3">

		<%@include file="components/message.jsp"%>


	</div>




	<div class="container admin">
		<div class="row mt-3">

			<!-- first col -->
			<div class="col-md-4 mt-3">
				<div class="card" id="admin">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 100px"
								src="img/user.png" alt="admin_user-icon">

						</div>

						<h1 class="text-uppercase text-muted">Users</h1>
						<h1><%=m.get("userCount") %></h1>
					</div>
				</div>

			</div>

			<!-- second col -->
			<div class="col-md-4 mt-3">
				<div class="card" id="admin">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 100px"
								src="img/category.png" alt="admin_category-icon">

						</div>

						<h1 class="text-uppercase text-muted">Categories</h1>
						<h1><%=list.size() %></h1>
					</div>
				</div>

			</div>

			<!-- third col -->
			<div class="col-md-4 mt-3">
				<div class="card" id="admin">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 100px"
								src="img/product.png" alt="admin_product-icon">

						</div>

						<h1 class="text-uppercase text-muted">Products</h1>
						<h1><%=m.get("productCount") %></h1>
					</div>
				</div>

			</div>



		</div>


	</div>
	<div class="container">

		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" id="admin" data-bs-toggle="modal"
					data-bs-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 100px"
								src="img/add_category.png" alt="admin_product-icon">

						</div>

						<h1 class="text-uppercase text-muted">Add Categories</h1>

					</div>
				</div>

			</div>

			<div class="col-md-6">
				<div class="card" id="admin" data-bs-toggle="modal"
					data-bs-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 100px"
								src="img/add_product.png" alt="admin_product-icon">

						</div>

						<h1 class="text-uppercase text-muted">Add Products</h1>

					</div>
				</div>

			</div>









		</div>


	</div>

	<!--add category modal  -->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">

						<div class="form-group">
							<input type="text" class="form-control" name="cat_title"
								placeholder="Enter Category Title" required /> <br>
							<textarea type="text" rows=3 class="form-control"
								name="cat_description" placeholder="Enter Category Description"
								required></textarea>



						</div>
						<br>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-outline-dark"
								data-bs-dismiss="modal">Close</button>

						</div>


					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- end of add category modal  -->


	<!-- add product modal -->


	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
					
					<input type="hidden" name="operation" value="addproduct" />




						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter title of product" name="pod_name" required />
							<br>
							<textarea type="text" rows=3 class="form-control"
								name="pod_description" placeholder="Enter Product Description"
								required></textarea>

							<br> 
							<input type="number" class="form-control"
								placeholder="Enter Product Price" name="pod_price" required />
							<br> 
							<input type="number" class="form-control"
								placeholder="Enter Product Discount" name="pod_discount"
								required /> 
								<br> 
								<input type="number" class="form-control"
								placeholder="Enter Product Quantity" name="pod_quantity"
								required />
						</div>
						<br>


						<div class="form-group">
							<select name="catID" class="form-control" id="">

								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryID()%>"><%=c.getCategoryTitle()%></option>
								<%
								}
								%>
							</select>

						</div>
						<br>

						<div class="form-group">
							<label for="pod_pic">Select Picture of Product</label><br> <input
								type="file" id="pod_pic" name="pod_pic" multiple required />
						</div>

						<br>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-outline-dark"
								data-bs-dismiss="modal">Close</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- end of add product modal  -->
	<%@include file="components/comman_modal.jsp" %>

</body>
</html>