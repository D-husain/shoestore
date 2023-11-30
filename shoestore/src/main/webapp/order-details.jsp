<!DOCTYPE html>
<%@page import="pojo.Sproduct"%>
<%@page import="pojo.Order"%>
<html lang="en">
<%Order o=(Order)session.getAttribute("orderss"); %>

<body>
	<div class="page-wrapper">
		<%@include file="header.jsp"%>
		<main class="main">
		<div class="page-header text-center"
			style="background-image: url('assets/images/page-header-bg.jpg')">
			<div class="container">
				<h1 class="page-title">
					Order Details
				</h1>
			</div>
			<!-- End .container -->
		</div>
		<!-- End .page-header -->
		<nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
					<li class="breadcrumb-item active" aria-current="page">Order
						Details</li>
				</ol>
			</div>
			<!-- End .container -->
		</nav>
		<!-- End .breadcrumb-nav -->

		<div class="p-8 lg:px-16 md:px-10 px-5 py-10">
    <div class="px-0 xl:px-16">
        <div class="d-flex gap-10 my-5 mx-auto">
            <div class="col-span-1 mx-auto">
                <table class="w-full">
                    <tr class="border-b-2">
                        <th colspan='2' class="text-left py-1 font-semibold text-first">Order information</th>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Order id</td>
                        <td class="pt-1 font-medium">: <span><%=o.getId()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Order date</td>
                        <td class="pt-1 font-medium">: <span><%=o.getOdate()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Total payment</td>
                        <td class="pt-1 font-medium">: <span>&#8377; <%=o.getAmount()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Payment method</td>
                        <td class="pt-1 font-medium">: <span>online</span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Order status</td>
                        <td class="pt-1 font-medium">: 
                        <span> 
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
						</span>
						</td>
                   </tr>
                   <tr>
                   	<%if(statu.equals("4")){ %>
                   		<td class="pt-1 text-gray-600">Invoice</td>
                        <td class="pt-1 font-medium">: <label class="badge badge-dark" ><a class="text-white" href="invoice?orderId=<%=o.getId()%>"> Download </a></label></td>
                   <%} %>
                    </tr>
                </table>
            </div>
            <div class="col-span-1 mx-auto">
                <table class="w-full">
                    <tr class="border-b-2">
                        <th colspan='2' class="text-left py-1 font-semibold text-first">Shipping address</th>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Name</td>
                        <td class="pt-1 font-medium">: <span><%=o.getShippingAddress().getFname()%><%=o.getShippingAddress().getLname()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Email</td>
                        <td class="pt-1 font-medium">: <span><%=o.getShippingAddress().getEmail()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Phone</td>
                        <td class="pt-1 font-medium">: <span><%=o.getShippingAddress().getContact()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Address</td>
                        <td class="pt-1 font-medium">: <span><%=o.getShippingAddress().getAddress1()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Suburb</td>
                        <td class="pt-1 font-medium">: <span><%=o.getShippingAddress().getCity()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">State/Territory</td>
                        <td class="pt-1 font-medium">: <span><%=o.getShippingAddress().getCountry()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Postal code</td>
                        <td class="pt-1 font-medium">: <span><%=o.getShippingAddress().getZip()%></span></td>
                    </tr>
                </table>
            </div>
            <div class="col-span-1 mx-auto">
                <table class="w-full">
                    <tr class="border-b-2">
                        <th colspan='2' class="text-left py-1 font-semibold text-first">Billing address</th>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Name</td>
                        <td class="pt-1 font-medium">: <span><%=user.getFname()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Email</td>
                        <td class="pt-1 font-medium">: <span><%=user.getEmail()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Phone</td>
                        <td class="pt-1 font-medium">: <span><%=user.getContact()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Address</td>
                        <td class="pt-1 font-medium">: <span><%=user.getAddress()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Suburb</td>
                        <td class="pt-1 font-medium">: <span><%=user.getCity()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">State/Territory</td>
                        <td class="pt-1 font-medium">: <span><%=user.getState()%></span></td>
                    </tr>
                    <tr>
                        <td class="pt-1 text-gray-600">Postal code</td>
                        <td class="pt-1 font-medium">: <span><%=user.getZip()%></span></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-10 p-5 bg-light mb-3 mx-auto">
            <h1 class="text-xl font-semibold text-first">Order details</h1>
            <div class="overflow-auto">
                
            <table class="min-w-[500px] w-full my-8 table">
                	<tr class="border-b-2">
                   		<th class="w-2/3 text-left py-2">Product</th>
                    	<th class="text-left py-2">Price</th>
                    	<th class="text-left py-2">Quantity</th>
                    	<th class="text-left py-2">Total</th>
                	</tr>
                	 <%
                         UserDao udao=new UserDao();
                         List<Sproduct> olist=udao.getSproductDetailsByOrderId(o.getId());
                     %>
                     <%
                         for(Sproduct order:olist){
                     %>
                    <tr class="text-sm">
                   
                        <td class="py-2"><a href="product-detail.jsp?id=<%=order.getPid()%>"><%=order.getPname()%></a></td>
                        <td class="py-2">&#8377; <%=order.getPrice()%></td>
                        <td class="py-2">x <%=order.getQty()%></td>
                        <td class="py-2">&#8377; <%=order.getTotal()%></td>
                    </tr>
                    <%} %>
                    <tr class="border-y-2">
                       <td colspan="3" class="py-2 font-semibold">Subtotal</td>
                       <td class="py-2">&#8377; <%=o.getTotal()%></td>
                    </tr>
                	<tr class="border-b-2">
                    	<td colspan="3" class="py-2 font-semibold">Shipping Charges</td>
                    	<td>&#8377; <%=o.getCharge() %></td>
                	</tr>
                	<%if (o.getDiscount() != null) { %>
                	<tr class="border-y-2">
                    	<td colspan="3" class="py-2 font-semibold">Discount</td>
                    	<td>&#8377; -<%=o.getDiscount()%></td>
                	</tr>
                	<%}%>
                    <tr class="border-b-2">
                   		<td colspan="3" class="py-2 font-semibold">Total</td>
                    	<td class="text-first font-semibold">&#8377; <%=o.getAmount()%></td>
                	</tr>
            </table>
            </div>
        </div>
    </div>
</div>
		
		
		
		<!-- End .page-content --> </main>
		<!-- End .main -->

		<%@include file="footer.jsp"%><!-- End .footer -->
	</div>
	<!-- End .page-wrapper -->
	<button id="scroll-top" title="Back to Top">
		<i class="icon-arrow-up"></i>
	</button>



	<!-- Mobile Menu -->
	<div class="mobile-menu-overlay"></div>
	<!-- End .mobil-menu-overlay -->

	<%@include file="mobile-menu.jsp" %>
	<!-- End .mobile-menu-container -->

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