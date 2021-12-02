<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
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

	<%
	String cat = request.getParameter("category");
	//	out.println(cat);

	ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
	//	List<Product> list = pDao.getAllProducts() ;
	List<Product> list = null;

	if (cat == null || cat.equals("all")) {

		list = pDao.getAllProducts();
	} else {
		int cat_ID = Integer.parseInt(cat.trim());
		list = pDao.getAllProductsByID(cat_ID);
	}

	CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> cList = cDao.getCategories();
	%>


	<div class="row mt-3 mx-3">

		<!-- show category  -->
		<div class="col-md-2">

			<div class="list-group mt-4">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action active"
					aria-current="true"> All Products</a>
				<%
				for (Category c : cList) {
				%>
				<a href="index.jsp?category=<%=c.getCategoryID()%>"
					class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
				<%
				}
				%>
			</div>
		</div>




		<!-- show product -->
		<div class="col-md-10">


			<div class="row row-cols-1 row-cols-md-3 g-4">
				<%
				for (Product p : list) {
				%>
				<div class="col">

					<div class="card h-100 product-card">

						<div class="container text-center">
							<img src="img/products_img/<%=p.getpPhoto()%>"
								style="max-height: 200px; max-width: 100%; width: auto;"
								class="card-img m-2">
						</div>
						<div class="card-body">
							<h5 class="card-title"><%=p.getpName()%></h5>
							<p class="card-text"><%=Helper.get10words(p.getpDesc())%></p>
						</div>
						<div class="card-footer">
							<button class="btn custom-bg text-white"
								onclick="add_to_cart(<%=p.getpID()%> , '<%=p.getpName()%>','<%=p.priceAfterDiscount()%>')">Add
								to Cart</button>
							<h4>
								<%=p.priceAfterDiscount()%>/-
							</h4>
							<span class="text-secondary discount-label"><%=p.getpPrice()%>/-
								&nbsp; <%=p.getpDiscount()%>% off</span>

						</div>
					</div>


				</div>
				<%
				}
				if (list.size() == 0) {
				out.println("<h1>No data found</h1>");
				}
				%>
			</div>

		</div>
		<%@include file="components/comman_modal.jsp" %>
</body>
</html>