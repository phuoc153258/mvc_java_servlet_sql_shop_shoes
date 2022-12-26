<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="/ShopShoes/images/favicon.png" type="">
<title>Famms - Fashion HTML Template</title>
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="/ShopShoes/css/bootstrap.css" />
<!-- font awesome style -->
<link href="/ShopShoes/css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="/ShopShoes/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="/ShopShoes/css/responsive.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<div class="hero_area">
		<!-- header section strats -->
		<header class="header_section">
			<div class="container">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="/ShopShoes/home"><img width="250"
						src="/ShopShoes/images/logo.png" alt="#" /></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class=""> </span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav">
							<li class="nav-item "><a class="nav-link" href="index.html">Home
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="product.html">Products</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="blog_list.html">Blog</a></li>
							<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
							</li>
							<c:if test="${empty sessionScope.user }">
								<li class="nav-item"><a class="nav-link"
									href="/ShopShoes/login">Login</a>
								<li class="nav-item"><a class="nav-link"
									href="/ShopShoes/register">Register</a></li>
							</c:if>
							<c:if test="${not empty sessionScope.user }">
								<li class="nav-item dropdown"><a id="navbarDropdown"
									class="nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" v-pre>${sessionScope.user.getUsername() }</a>
									<div class="dropdown-menu dropdown-menu-end"
										aria-labelledby="navbarDropdown">
										<c:if test="${sessionScope.user.getRoleId() == 1}">
											<a class="dropdown-item" href="/ShopShoes/admin/products">Admin</a>
										</c:if>
										<a class="dropdown-item" href="/ShopShoes/users/information">User information</a>
										<a class="dropdown-item" href="/ShopShoes/cart">Cart</a>
										<a class="dropdown-item" href="/ShopShoes/users/purchase">Purchase history</a>
										<a class="dropdown-item" href="/ShopShoes/users/password">Change password</a> <a
											class="dropdown-item" href="/ShopShoes/logout">Log out</a>
									</div></li>
							</c:if>
						</ul>
					</div>
				</nav>
			</div>
		</header>


		<main class="py-4">
			<div class="container">
				<div class="d-flex justify-content-between">
					<h2>User information</h2>
				</div>
				<div class="row justify-content-center m-0">
					<div class="card w-100">
						<div class="card-body">
							<div class="container">
								<div class="row">
									<div class="col-4 text-center">
										<img class="w-75 mb-2"
											style="border-radius: 10%; display: block; border-radius: 10%; margin-left: auto; margin-right: auto;"
											src="/ShopShoes/images/avatar_default.png" alt=""
											id="show-avatar-user-js">
									</div>
									<div class="col-8">
									<form action="/ShopShoes/users/information/handle" method="post">
										<div class="form-group mb-3">
											<label for="">ID:</label> <input  style="text-transform: none;" type="text"
												class="form-control" placeholder="ID.."
												value="${sessionScope.user.getId() }" readonly name="id">
										</div>
										<div class="form-group mb-3">
											<label for="">Fullname:</label> <input  style="text-transform: none;" type="text"
												class="form-control" placeholder="Fullname..."
												value="${sessionScope.user.getFullname() }" name="fullname">
										</div>
										<div class="form-group mb-3">
											<label for="">Username:</label> <input  style="text-transform: none;" type="text"
												class="form-control" placeholder="Username..."
												value="${sessionScope.user.getUsername() }" name="username">
										</div>
										<div class="form-group mb-3">
											<label for="">Email:</label> <input  style="text-transform: none;" type="email"
												class="form-control" placeholder="Email..."
												value="${sessionScope.user.getEmail() }" name="email">
										</div>
										<div class="form-group mb-3">
											<label for="">Phone number:</label> <input type="text"
												class="form-control" style="text-transform: none;" placeholder="Phonenumber..."
												value="${sessionScope.user.getPhoneNumber() }"
												name="phonenumber">
										</div>
										<div class="d-flex flex-row-reverse" style="gap: 0 15px;">
											<button type="submit" class="btn btn-primary" >Submit</button>
											<a href="/ShopShoes/home" class="btn btn-secondary">Back</a>
										</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>

		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="full">
							<div class="logo_footer">
								<a href="#"><img width="210" src="images/logo.png" alt="#" /></a>
							</div>
							<div class="information_f">
								<p>
									<strong>ADDRESS:</strong> 28 White tower, Street Name New York
									City, USA
								</p>
								<p>
									<strong>TELEPHONE:</strong> +91 987 654 3210
								</p>
								<p>
									<strong>EMAIL:</strong> yourmain@gmail.com
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-7">
								<div class="row">
									<div class="col-md-6">
										<div class="widget_menu">
											<h3>Menu</h3>
											<ul>
												<li><a href="#">Home</a></li>
												<li><a href="#">About</a></li>
												<li><a href="#">Services</a></li>
												<li><a href="#">Testimonial</a></li>
												<li><a href="#">Blog</a></li>
												<li><a href="#">Contact</a></li>
											</ul>
										</div>
									</div>
									<div class="col-md-6">
										<div class="widget_menu">
											<h3>Account</h3>
											<ul>
												<li><a href="#">Account</a></li>
												<li><a href="#">Checkout</a></li>
												<li><a href="#">Login</a></li>
												<li><a href="#">Register</a></li>
												<li><a href="#">Shopping</a></li>
												<li><a href="#">Widget</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-5">
								<div class="widget_menu">
									<h3>Newsletter</h3>
									<div class="information_f">
										<p>Subscribe by our newsletter and get update protidin.</p>
									</div>
									<div class="form_sub">
										<form>
											<fieldset>
												<div class="field">
													<input type="email" placeholder="Enter Your Mail"
														name="email" /> <input type="submit" value="Subscribe" />
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- jQery -->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous">
			
		</script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous">
			
		</script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous">
			
		</script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
			integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.3/axios.min.js"
			integrity="sha512-0qU9M9jfqPw6FKkPafM3gy2CBAvUWnYVOfNPDYKVuRTel1PrciTj+a9P3loJB+j0QmN2Y0JYQmkBBS8W+mbezg=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

		<script src="/ShopShoes/js/jquery-3.4.1.min.js"></script>
		<!-- popper js -->
		<script src="/ShopShoes/js/popper.min.js"></script>
		<!-- bootstrap js -->
		<script src="/ShopShoes/js/bootstrap.js"></script>
		<!-- custom js -->
		<script src="/ShopShoes/js/custom.js"></script>
</body>

</html>