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
<link rel="stylesheet" type="text/css"
	href="/ShopShoes/css/bootstrap.css" />
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
							<li class="nav-item "><a class="nav-link"
								href="/ShopShoes/home">Home <span class="sr-only">(current)</span>
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
				<h3
					style="font-weight: bold; text-align: center; padding: 20px; font-size: 24px;">Check
					out</h3>
				<div class="row">
					<div class="col-lg-6 mx-auto">
						<div class="card ">
							<div class="card-header">
								<div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
									<ul role="tablist"
										class="nav bg-light nav-pills rounded nav-fill mb-3">
										<li class="nav-item"><a data-toggle="pill"
											href="#credit-card" class="nav-link active "> <i
												class="fas fa-credit-card mr-2"></i> Credit Card
										</a></li>
									</ul>
								</div>
								<div class="tab-content">
									<div id="credit-card" class="tab-pane fade show active pt-3">
										<form action="/ShopShoes/cart/pay/handle" method="post">
											<div class="form-group">
												<label for="username">
													<h6>Card Owner</h6>
												</label> <input type="text" name="cardOwnerName"
													placeholder="Card Owner Name" required
													class="form-control ">
											</div>
											<div class="form-group">
												<label for="cardNumber">
													<h6>Card number</h6>
												</label>
												<div class="input-group">
													<input type="text" name="validCardNumber"
														placeholder="Valid card number" class="form-control "
														required>
													<div class="input-group-append">
														<span class="input-group-text text-muted"> <i
															class="fab fa-cc-visa mx-1"></i> <i
															class="fab fa-cc-mastercard mx-1"></i> <i
															class="fab fa-cc-amex mx-1"></i>
														</span>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-8">
													<div class="form-group">
														<label><span class="hidden-xs">
																<h6>Expiration Date</h6>
														</span></label>
														<div class="input-group">
															<input type="number" placeholder="MM" name="month"
																class="form-control" required> <input
																type="number" placeholder="YY" name="year"
																class="form-control" required>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group mb-4">
														<label data-toggle="tooltip"
															title="Three digit CV code on the back of your card">
															<h6>
																CVV <i class="fa fa-question-circle d-inline"></i>
															</h6>
														</label> <input type="text" required class="form-control" name="CVV">
													</div>
												</div>
											</div>
											<c:set var="TotalMoney" scope="session" />
											<c:forEach var="item"
												items="${sessionScope.cart.getOrderDetail() }"
												varStatus="loop">
												<h3 hidden>${ TotalMoney = TotalMoney + item.getAmount()*item.getProductPrice()}</h3>
											</c:forEach>
											<div class=" mb-3 text-right" style="font-weight: bold;">Total:
												${TotalMoney }VND</div>
											<div class="card-footer">
												<button type="submit"
													class="subscribe btn btn-primary btn-block shadow-sm">
													Confirm Payment</button>
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
								<a href="#"><img width="210"
									src="/ShopShoes/images/logo.png" alt="#" /></a>
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