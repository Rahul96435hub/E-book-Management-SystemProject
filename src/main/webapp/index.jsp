<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/b.jpg");
	height: 50vh;
	width: 100%;
	background-size	: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body  >

	<%
	User u = (User) session.getAttribute("userobj");
	%>


	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook Management System</h2>
	</div>

	<!-- Start Recent Books -->

	<div class="container">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							Style="width: 150px; heigth: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row text-center">

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">


							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-0"><i
								class="fa-solidfa-cart-shopping"> </i>Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-0"><i
								class="fa-solidfa-cart-shopping"> </i>Add cart</a>
							<%
							}
							%>


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End Recent Books -->
	<hr>
	<!-- Start New Books -->

	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							Style="width: 150px; heigth: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-0"><i
								class="fa-solidfa-cart-shopping"> </i>Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-0"><i
								class="fa-solidfa-cart-shopping"> </i>Add cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solidfa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>





		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>

	<!-- End New Books -->

	<hr>

	<!-- start Old Books -->

	<div class="container">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							Style="width: 150px; heigth: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%>
						</p>


						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>

	<!-- End Old Books -->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>