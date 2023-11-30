<!DOCTYPE html>
<%@page import="pojo.Sproduct"%>
<%@page import="pojo.Order"%>
<%
  Order o = (Order) request.getAttribute("foundOrder");
%>
<html lang="en">
<head>
  <link rel="stylesheet" href="assets/css/so.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
	<div class="page-wrapper">
		<%@include file="header.jsp"%>

		<main class="main">
		<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
			<div class="container">
				<h1 class="page-title">
					Search your order<span>Order</span>
				</h1>
			</div>
			<!-- End .container -->
		</div>
		<!-- End .page-header -->
		<nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Search
						your order</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>
		<!-- End .breadcrumb-nav -->


		<div class="search mx-4">
			<form action="OrderNumber" method="get">
				<div class="flex justify-center mt-6" style="margin: 0 100px 0 100px;">
					<input id="searchorder" name="orderid" value="" type="search" placeholder="Your order number" autocomplete="off" class="text-redsy bg-white px-4 py-3 w-full  text-neutral-600 placeholder-gray-300 transition duration-500 ease-in-out transform border-2 border-redsy focus:outline-none focus:ring-0 focus:border-0 focus:border-2 focus:border-redsy text-redsy font-semibold">
					<input type="submit" onclick="return checkOrder()" class="cursor-pointer bg-white text-redsy border-2 border-l-0 border-redsy px-5 py-1 md:px-10 md:py-1 text-xl hover:bg-redsy hover:text-white items-center transition ease-in-out duration-500" value="Search">
				</div>
				<p id="ordernumbererr" style="display: none; color: red; margin: 0 100px 0 100px;">Order number must be filled out</p>
			</form>
		</div>
		<%
			int hj = 0; 
			if (o != null) {
    		hj = o.getId();
		%>
		<div class="md:px-24 pt-5 pb-2 md:py-10 px-10">
			<div class="grid grid-cols-8 gap-5 border-b border-redsy py-3">
				<div class="col-span-8 sm:col-span-4 md:col-span-3">
					<%
						int id = o.getId();
						UserDao udao=new UserDao();
						List<Sproduct> olist = udao.getSproductDetailsByOrderId(id);
					%>
					<%for(Sproduct spo:olist){ %>
					<div class="flex mb-2">
						<img data-src=""
							src="/admin/product_image/2-130gcocoadustedmilkchocolatealmond.webp"
							data-lazy="" class="w-5 h-5 mr-5" data-processed="true">

						<p class="  hover:underline">
							<a href="product-detail.jsp?id=<%=spo.getPid()%>"><%=spo.getPname()%> x <%=spo.getQty()%></a>
						</p>
					</div>
					<%} %>
					
				</div>
				<div class="col-span-8 sm:col-span-4 md:col-span-3">
					<table class="table-auto">
						<tbody>
							<tr>
								<td class="align-top"><span class="text-gray-600 font-bold ">Order Id:</span></td>
								<td class="align-top">
									<p class=""><%=o.getId()%></p>
								</td>
							</tr>
							
							<tr>
								<td class="align-top"><span class="text-gray-600 font-bold pr-6">Customer name:</span></td>
								<td class="align-top">
									<p class=""><%=o.getShippingAddress().getFname()%> <%=o.getShippingAddress().getLname()%></p>
								</td>
							</tr>
							<tr>
								<td class="align-top"><span class="text-gray-600 font-bold ">Email:</span></td>
								<td class="align-top">
									<p class=""><%=o.getShippingAddress().getEmail() %></p>
								</td>
							</tr>
							<tr>
								<td class="align-top"><span class="text-gray-600 font-bold">Delivery address:</span></td>
								<td class="align-top">
									<p class=""><%=o.getShippingAddress().getAddress1()%>, <%=o.getShippingAddress().getCity()%> <%=o.getShippingAddress().getState()%> <%=o.getShippingAddress().getZip()%></p>
								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div class="col-span-8 md:col-span-2">
					<table class="table-auto">
						<tbody>
							<tr>
								<td class="align-top"><span class="text-gray-600 font-bold pr-6">Order date:</span></td>
								<td class="align-top">
									<p class=""><%=o.getOdate()%></p>
								</td>
							</tr>
							<tr>
								<td class="align-top"><span class="text-gray-600 font-bold pr-6 ">Order amount:</span></td>
								<td class="align-top">
									<p class=""><%=o.getAmount()%></p>
								</td>
							</tr>
							<tr>
								<td class="align-top"><span class="text-gray-600 font-bold ">Order status:</span></td>
								<td class="align-top">
								<%
								 	Integer status = o.getStatus();
								 	pageContext.setAttribute("statu", status.toString());
								%> 
								<%
								 	String statu = (String) pageContext.getAttribute("statu");
								%> 
								<%
								 	if (statu.equals("1")) {
								 %> <label class="badge badge-primary">Pending</label> <%
								 	} else if (statu.equals("2")) {
								 %> <label class="badge badge-info">Active</label> <%
								 	} else if (statu.equals("3")) {
								 %> <label class="badge badge-warning text-white">Shipping</label> <%
								 	} else if (statu.equals("4")) {
								 %> <label class="badge badge-success">Delivered</label> <%
								 	} else if (statu.equals("5")) {
								 %> <label class="badge badge-danger">Cancelled</label>
								<%  } %>	
									<!-- <p class="font-bold text-center text-success">DELIVERED</p> -->
								
								</td>
							</tr>
							<%if(statu.equals("5")){ %>
							<tr>
								<td class="align-top"><span class="text-gray-600 font-bold ">Cancellation Reason:</span></td>
								<td class="align-top">
									<p class="font-bold text-danger"> <%=o.getCancelorder()%></p> 
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
					<div class="mt-6 text-center">
						<a href="invoice?orderId=<%=o.getId()%>" class=" bg-redsy text-black px-4 py-1 rounded border border-redsy hover:text-redsy hover:bg-white transition duration-300">
						Download Invoice</a>
					</div>
				</div>
				<br>
			</div>
		</div>
		<br>
		<%}else{ %>
		<br><br>
		<div class="min-h-[200px] flex items-center justify-center">
			<p class="text-center md:text-2xl text-gray-400">
				Search your past order using order number</p>
		</div>
		<%} %>
		<br><br>
		</main>
		<!-- End .main -->

		<%@include file="footer.jsp"%>
	</div>
	<!-- End .page-wrapper -->
	<button id="scroll-top" title="Back to Top">
		<i class="icon-arrow-up"></i>
	</button>
	<script>
    document.getElementById('ordernumbererr').style.display = "none";
    function checkOrder(){
        var oo = document.getElementById('searchorder').value;
        if(oo == ""){
            document.getElementById('ordernumbererr').style.display = "block";
            return false;
        }
        else if(!oo.match(/^\d+/)){
        	 document.getElementById('ordernumbererr').style.display = "block";
             return false;
        }
        else{
            return true;
        }
    }
</script>
	<!-- Mobile Menu -->
	<div class="mobile-menu-overlay"></div>
	<!-- End .mobil-menu-overlay -->

	<%@include file="mobile-menu.jsp"%>

	<!-- Sign in / Register Modal -->
	<div class="modal fade" id="signin-modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><i class="icon-close"></i></span>
					</button>

					<div class="form-box">
						<div class="form-tab">
							<ul class="nav nav-pills nav-fill" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="signin-tab" data-toggle="tab" href="#signin" role="tab"
									aria-controls="signin" aria-selected="true">Sign In</a></li>
								<li class="nav-item"><a class="nav-link" id="register-tab"
									data-toggle="tab" href="#register" role="tab"
									aria-controls="register" aria-selected="false">Register</a></li>
							</ul>
							<div class="tab-content" id="tab-content-5">
								<div class="tab-pane fade show active" id="signin"
									role="tabpanel" aria-labelledby="signin-tab">
									<form action="#">
										<div class="form-group">
											<label for="singin-email">Username or email address *</label>
											<input type="text" class="form-control" id="singin-email"
												name="singin-email" required>
										</div>
										<!-- End .form-group -->

										<div class="form-group">
											<label for="singin-password">Password *</label> <input
												type="password" class="form-control" id="singin-password"
												name="singin-password" required>
										</div>
										<!-- End .form-group -->

										<div class="form-footer">
											<button type="submit" class="btn btn-outline-primary-2">
												<span>LOG IN</span> <i class="icon-long-arrow-right"></i>
											</button>

											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input"
													id="signin-remember"> <label
													class="custom-control-label" for="signin-remember">Remember
													Me</label>
											</div>
											<!-- End .custom-checkbox -->

											<a href="#" class="forgot-link">Forgot Your Password?</a>
										</div>
										<!-- End .form-footer -->
									</form>
									<div class="form-choice">
										<p class="text-center">or sign in with</p>
										<div class="row">
											<div class="col-sm-6">
												<a href="#" class="btn btn-login btn-g"> <i
													class="icon-google"></i> Login With Google
												</a>
											</div>
											<!-- End .col-6 -->
											<div class="col-sm-6">
												<a href="#" class="btn btn-login btn-f"> <i
													class="icon-facebook-f"></i> Login With Facebook
												</a>
											</div>
											<!-- End .col-6 -->
										</div>
										<!-- End .row -->
									</div>
									<!-- End .form-choice -->
								</div>
								<!-- .End .tab-pane -->
								<div class="tab-pane fade" id="register" role="tabpanel"
									aria-labelledby="register-tab">
									<form action="#">
										<div class="form-group">
											<label for="register-email">Your email address *</label> <input
												type="email" class="form-control" id="register-email"
												name="register-email" required>
										</div>
										<!-- End .form-group -->

										<div class="form-group">
											<label for="register-password">Password *</label> <input
												type="password" class="form-control" id="register-password"
												name="register-password" required>
										</div>
										<!-- End .form-group -->

										<div class="form-footer">
											<button type="submit" class="btn btn-outline-primary-2">
												<span>SIGN UP</span> <i class="icon-long-arrow-right"></i>
											</button>

											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input"
													id="register-policy" required> <label
													class="custom-control-label" for="register-policy">I
													agree to the <a href="#">privacy policy</a> *
												</label>
											</div>
											<!-- End .custom-checkbox -->
										</div>
										<!-- End .form-footer -->
									</form>
									<div class="form-choice">
										<p class="text-center">or sign in with</p>
										<div class="row">
											<div class="col-sm-6">
												<a href="#" class="btn btn-login btn-g"> <i
													class="icon-google"></i> Login With Google
												</a>
											</div>
											<!-- End .col-6 -->
											<div class="col-sm-6">
												<a href="#" class="btn btn-login  btn-f"> <i
													class="icon-facebook-f"></i> Login With Facebook
												</a>
											</div>
											<!-- End .col-6 -->
										</div>
										<!-- End .row -->
									</div>
									<!-- End .form-choice -->
								</div>
								<!-- .End .tab-pane -->
							</div>
							<!-- End .tab-content -->
						</div>
						<!-- End .form-tab -->
					</div>
					<!-- End .form-box -->
				</div>
				<!-- End .modal-body -->
			</div>
			<!-- End .modal-content -->
		</div>
		<!-- End .modal-dialog -->
	</div>
	<!-- End .modal -->

	<!-- Plugins JS File -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/jquery.hoverIntent.min.js"></script>
	<script src="assets/js/jquery.waypoints.min.js"></script>
	<script src="assets/js/superfish.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<!-- Main JS File -->
	<script src="assets/js/main.js"></script>
</body>


<!-- Mirrored from portotheme.com/html/molla/dashboard.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:21:47 GMT -->
</html>