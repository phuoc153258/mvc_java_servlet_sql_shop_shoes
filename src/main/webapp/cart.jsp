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
<link rel="shortcut icon" href="images/favicon.png" type="">
<title>Famms - Fashion HTML Template</title>
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<!-- font awesome style -->
<link href="css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
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
						src="images/logo.png" alt="#" /></a>
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

		<div class="container px-3 my-5 clearfix">
			<!-- Shopping cart table -->
			<div class="card">
				<div class="card-header">
					<h2>Shopping Cart</h2>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered m-0">
							<thead>
								<tr>
									<th class="text-right py-3 px-4" style="width: 100px;">#</th>
									<th class="text-center py-3 px-4" style="min-width: 400px;">Product
										Name &amp; Details</th>
									<th class="text-right py-3 px-4" style="width: 100px;">Price</th>
									<th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
									<th class="text-right py-3 px-4" style="width: 100px;">Total</th>
									<th class="text-center align-middle py-3 px-0"
										style="width: 40px;"><a href="#"
										class="shop-tooltip float-none text-light" title=""
										data-original-title="Clear cart"><i
											class="ino ion-md-trash"></i></a></th>
								</tr>
							</thead>
							<tbody>
								<c:set var="TotalMoney" scope="session" />
								<c:forEach var="item"
									items="${sessionScope.cart.getOrderDetail() }" varStatus="loop">
									<tr>
										<td class="text-right font-weight-semibold align-middle p-4">${loop.index+1}</td>
										<td class="p-4">
											<div class="media align-items-center">
												<img src="/ShopShoes/${item.getProductImage() }"
													class="d-block ui-w-40 ui-bordered mr-4 w-25" alt="">
												<div class="media-body">
													<a href="#" class="d-block text-dark">${item.getProductName() }</a>
												</div>
											</div>
										</td>
										<td class="text-right font-weight-semibold align-middle p-4">${item.getProductPrice()}VND</td>
										<td class="align-middle">
											<form action="/ShopShoes/cart/update" method="get">
											<input hidden value="${item.getProductId() }" name="productId">
												<input type="number" class="form-control w-100 mb-3"
													value="${item.getAmount() }" name="amount" min="1" ><button type="submit"
													class="btn btn-primary" >Update</button>
											</form>
										</td>
										<td class="text-right font-weight-semibold align-middle p-4">${item.getAmount()*item.getProductPrice()}
											VND</td>
										<td class="text-center align-middle px-0"><a
											href="/ShopShoes/cart/delete?orderId=${cart.getId()}&productId=${item.getProductId()}"
											class="shop-tooltip close float-none text-danger" title=""
											data-original-title="Remove">×</a></td>
									</tr>
									<h3 hidden>${ TotalMoney = TotalMoney + item.getAmount()*item.getProductPrice()}</h3>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<c:if test="${empty sessionScope.cart.getOrderDetail() }">
						<h4 class="fw-bold title m-4">Cart empty...</h4>
					</c:if>
					<c:if test="${not empty sessionScope.cart.getOrderDetail() }">
						<div
							class="d-flex flex-wrap justify-content-between align-items-center pb-4">
							<div class="mt-4"></div>
							<div class="d-flex mt-2 mb-2" style="gap: 0 10px;">
								<div class="text-right mt-4 d-flex" style="gap: 0 10px;">
									<label class="text-muted font-weight-normal m-0">Total
										price:</label>
									<div class="text-large">
										<strong>${TotalMoney }VND</strong>
									</div>
								</div>
								<a
									href="/ShopShoes/cart/delete?orderId=${cart.getId()}&productId=all"
									class="btn btn-primary mb-auto mt-auto">Delete all</a>
							</div>
						</div>

						<div class="d-flex" style="flex-direction: row-reverse;">
							<a href="/ShopShoes/cart/pay" class="btn btn-lg btn-primary mt-2">Checkout</a> <a
								href="#" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back
								to shopping</a>
						</div>
					</c:if>


				</div>
			</div>
		</div>


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
		<!-- jQery -->
		<script src="js/jquery-3.4.1.min.js"></script>
		<!-- popper js -->
		<script src="js/popper.min.js"></script>
		<!-- bootstrap js -->
		<script src="js/bootstrap.js"></script>
		<!-- custom js -->
		<script src="js/custom.js"></script>
</body>

</html>