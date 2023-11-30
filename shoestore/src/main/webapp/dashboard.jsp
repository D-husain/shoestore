<!DOCTYPE html>
<%@page import="pojo.ShippingAddress"%>
<%@page import="pojo.Order"%>
<html lang="en">
<%
	User ul = (User) session.getAttribute("user");

	if (ul == null) {
		response.sendRedirect("login.jsp");
	}
%>

<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="page-wrapper">
        <%@include file="header.jsp" %>

        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">My Account<span>Shop</span></h1>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav mb-3">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">My Account</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
            	<div class="dashboard">
	                <div class="container">
	                	<div class="row">
	                		<aside class="col-md-4 col-lg-3">
	                			<ul class="nav nav-dashboard flex-column mb-3 mb-md-0" role="tablist">
								    <li class="nav-item">
								        <a class="nav-link active" id="tab-dashboard-link" data-toggle="tab" href="#tab-dashboard" role="tab" aria-controls="tab-dashboard" aria-selected="true">Dashboard</a>
								    </li>
								    <%if(user != null){ %>
								    <%
										UserDao udao=new UserDao();
										List<Order> list3 = udao.viewOrders(user.getId());
										%>
								    <li class="nav-item">
								        <a class="nav-link" id="tab-orders-link" data-toggle="tab" href="#tab-orders" role="tab" aria-controls="tab-orders" aria-selected="false">Orders (<%=list3.size()%>)</a>
								    </li>
								    
								    <%} %>
								    <li class="nav-item">
								        <a class="nav-link" id="tab-address-link" data-toggle="tab" href="#tab-address" role="tab" aria-controls="tab-address" aria-selected="false">Adresses</a>
								    </li>
								    <li class="nav-item">
								        <a class="nav-link" id="tab-account-link" data-toggle="tab" href="#tab-account" role="tab" aria-controls="tab-account" aria-selected="false">Account Details</a>
								    </li>
								    <li class="nav-item">
								        <a class="nav-link" href="logout.jsp">Logout (<%=user.getFname()%>)</a>
								    </li>
								</ul>
	                		</aside><!-- End .col-lg-3 -->

	                		<div class="col-md-8 col-lg-9">
	                			<div class="tab-content">
								    <div class="tab-pane fade show active" id="tab-dashboard" role="tabpanel" aria-labelledby="tab-dashboard-link">
								    	<p>Hello <span class="font-weight-normal text-dark"><%=user.getFname()%></span> (not <span class="font-weight-normal text-dark"><%=user.getFname()%></span>? <a href="logout.jsp">Log out</a>) 
								    	<br>
								    	From your account dashboard you can view your <a href="#tab-orders" class="tab-trigger-link link-underline">recent orders</a>, manage your <a href="#tab-address" class="tab-trigger-link">shipping and billing addresses</a>, and <a href="#tab-account" class="tab-trigger-link">edit your password and account details</a>.</p>
								    </div><!-- .End .tab-pane -->

								    <div class="tab-pane fade" id="tab-orders" role="tabpanel" aria-labelledby="tab-orders-link">
								    <p style="color: black;">* You can only download invoice after the order delivered.</p>
								    	<%if(user != null){ %>
								    	<%
										UserDao udao=new UserDao();
										List<Order> list3 = udao.viewOrders(user.getId());
										%>
								    		<%for(Order o:list3){ %>
								    		<div class="list-wrapper" id="myTable">
											<div class=''>
												<div class="bg-light my-2 p-4 list-item">
													<div class=" gap-1 d-flex ">
														<div class="col-span-1">
															<div class='text-sm'>
																<p><%=o.getUser().getFname()%> <%=o.getUser().getLname()%></p>
																<p><%=o.getUser().getEmail()%></p>
															</div>
														</div>
														<div
															class='d-flex items-start justify-start my-auto col-5 gap-1'>
															<i class="fa-2x fa-solid fa-location-dot mx-2 my-auto"></i>
															<p class='text-xs my-auto'><%=o.getShippingAddress().getAddress1()%>, <%=o.getShippingAddress().getCity()%>
																, <%=o.getShippingAddress().getCountry()%> <%=o.getShippingAddress().getZip()%></p>
														</div>
														<div class='mx-5'>
															<div class='font-semibold mx-5'>
																<p class="text-first font-bold">
																	&#8377; <span class=""><%=o.getAmount()%></span>
																</p>
															</div>
															<div
																class='flex flex-col items-end justify-start col-span-1 gap-1 mx-5'>
																<%
																    Integer status =o.getStatus();
																    pageContext.setAttribute("statu", status.toString());
																%> 
																<%
								 									String statu = (String) pageContext.getAttribute("statu");
								 								%> 
					
															 	<%
													 				if (statu.equals("1")) {
																%>
																	<label class="badge badge-primary">Pending</label>
																<%
													 				} else if(statu.equals("2")) {
																%>
																	<label class="badge badge-info">Active</label>
																<%	
																	}else if(statu.equals("3")){ 
																%>
																	<label class="badge badge-warning text-white">Shipping</label> 
																<%	
																	}else if(statu.equals("4")){ 
																%>
																	<label class="badge badge-success">Delivered</label> 
																<% 
																	}else if(statu.equals("5")){ 
																%>
																	<label class="badge badge-danger">Cancelled</label>
																<%
																	} 
																%>

															</div>
														</div>
													</div>
													<hr
														class='w-full my-3 border-b border-dashed border-first/40' />
													<div
														class='flex flex-col gap-2 sm:flex-row items-center justify-between text-sm font-medium text-gray-500'>
														<div
															class="d-flex flex-wrap justify-start sm:justify-center items-center gap-2 sm:gap-4">
															<p>
																Order Id: <span class='font-bold text-first'><%=o.getId()%></span>
															</p>
															<p class="mx-5">
																Order Date: <span class='font-bold text-first'><%=o.getOdate()%></span>
															</p>

													</div>
														<div>
															<a href="trackorder?id=<%=o.getId()%>" class="text-first underline">Track Order <i class="fa-solid fa-arrow-right fa-beat"></i></a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<%} %>
										<%
											if (list3.size() == 0) {
										%>
											<p>No order has been made yet.</p>
										    <a href="shop.jsp" class="btn btn-outline-primary-2">
										    <span>GO SHOP</span><i class="icon-long-arrow-right"></i></a>
										<%
											}
										%>
											<br>
											<div class="float-right">
												<button id="showMoreBtn" class="btn btn-outline-primary">Show
													More</button>
												<button id="showLessBtn" class="btn btn-outline-primary"
													style="display: none;">Show Less</button>
											</div>
									<%
											}
										%>
								</div><!-- .End .tab-pane -->
								
								    <div class="tab-pane fade" id="tab-address" role="tabpanel" aria-labelledby="tab-address-link">
								    	<p>The following addresses will be used on the checkout page by default.</p>

								    	<div class="row">
								    		<div class="col-lg-6">
								    			<div class="card card-dashboard">
								    				<div class="card-body">
								    					<h3 class="card-title">Billing Address</h3><!-- End .card-title -->

														<p><%=user.getFname()%>
														<%=user.getLname()%><br>
														<%=user.getAddress()%><br>
														<%=user.getContact()%><br>
														<%=user.getEmail()%><br>
														<a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Edit <i class="icon-edit"></i></a></p>
								    				</div><!-- End .card-body -->
								    			</div><!-- End .card-dashboard -->
								    		</div><!-- End .col-lg-6 -->
								    		
											<%ShippingAddress s=(ShippingAddress)session.getAttribute("shipping"); %>
								    		<div class="col-lg-6">
								    			<div class="card card-dashboard">
								    				<div class="card-body">
								    					<h3 class="card-title">Shipping Address</h3><!-- End .card-title -->
															<%-- <p><%=s.getFname()%>
														<%=s.getLname()%><br>
														<%=s.getAddress1()%><br>
														<%=s.getContact()%><br>
														<%=s.getEmail()%><br> --%>
														<p>You have not set up this type of address yet.<br>
														<a href="#">Edit <i class="icon-edit"></i></a></p>
								    				</div><!-- End .card-body -->
								    			</div><!-- End .card-dashboard -->
								    		</div><!-- End .col-lg-6 -->
								    	</div><!-- End .row -->
								    	<div class="collapse" id="collapseExample">
    										<form action="EditUserAddress" method="post">
			                				<div class="row">
			                					<div class="col-sm-6">
			                						<label>First Name *</label>
			                						<input type="hidden" name="id" value="<%=user.getId()%>">
			                						<input type="text" name="fname" value="<%=user.getFname()%>" class="form-control" required>
			                					</div><!-- End .col-sm-6 -->

			                					<div class="col-sm-6">
			                						<label>Last Name *</label>
			                						<input type="text" name="lname" value="<%=user.getLname()%>" class="form-control" required>
			                					</div><!-- End .col-sm-6 -->
			                				</div><!-- End .row -->

		                					<label>Email address *</label>
		        							<input type="email" name="email" value="<%=user.getEmail()%>" class="form-control" required>

		            						<label>Contact number</label>
		            						<input type="tel" name="contact" value="<%=user.getContact()%>" class="form-control">

		            						<label>Address</label>
		            						<textarea name="address" class="form-control"><%out.print(user.getAddress()); %></textarea>

		                					<button type="submit" class="btn btn-outline-primary-2">
			                					<span>SAVE CHANGES</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>
			                			</form>
										</div>
								    </div><!-- .End .tab-pane -->

								    <div class="tab-pane fade" id="tab-account" role="tabpanel" aria-labelledby="tab-account-link">
								    	<form action="EditUserAddress" method="post">
			                				<div class="row">
			                					<div class="col-sm-6">
			                						<label>First Name *</label>
			                						<input type="hidden" name="id" value="<%=user.getId()%>">
			                						<input type="text" name="fname" value="<%=user.getFname()%>" class="form-control" required>
			                					</div><!-- End .col-sm-6 -->

			                					<div class="col-sm-6">
			                						<label>Last Name *</label>
			                						<input type="text" name="lname" value="<%=user.getLname()%>" class="form-control" required>
			                					</div><!-- End .col-sm-6 -->
			                				</div><!-- End .row -->

		                					<label>Email address *</label>
		        							<input type="email" name="email" value="<%=user.getEmail()%>" class="form-control" required>

		            						<label>Contact number</label>
		            						<input type="tel" name="contact" value="<%=user.getContact()%>" class="form-control">

		            						<label>Address</label>
		            						<textarea name="address" class="form-control"><%out.print(user.getAddress()); %></textarea>

		                					<button type="submit" class="btn btn-outline-primary-2">
			                					<span>SAVE CHANGES</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>
			                			</form>
								    </div><!-- .End .tab-pane -->
								</div>
	                		</div><!-- End .col-lg-9 -->
	                	</div><!-- End .row -->
	                </div><!-- End .container -->
                </div><!-- End .dashboard -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

        <%@include file="footer.jsp" %>
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  var productsToShow = 3;
  var totalProducts = $(".list-wrapper .list-item").length;

  if (totalProducts <= productsToShow) {
    $("#showMoreBtn").hide();
    $("#showLessBtn").hide();
  } else {
    $(".list-wrapper .list-item:gt(" + (productsToShow - 1) + ")").hide();
    $("#showMoreBtn").show();
    $("#showLessBtn").hide();
  }

  $("#showMoreBtn").click(function() {
    $(".list-wrapper .list-item:gt(" + (productsToShow - 1) + ")").show();
    $("#showMoreBtn").hide();
    $("#showLessBtn").show();
  });

  $("#showLessBtn").click(function() {
    $(".list-wrapper .list-item:gt(" + (productsToShow - 1) + ")").hide();
    $("#showMoreBtn").show();
    $("#showLessBtn").hide();
  });
});
</script>


	<%
		String msg = request.getParameter("msg");
		if ("done".equals(msg)) {
	%>
	   <script type="text/javascript">
			const Toast = Swal.mixin({
			toast: true,
			position: 'top-end',
			showConfirmButton: false,
			timer: 3000,
			timerProgressBar: true,
			didOpen: (toast) => {
			toast.addEventListener('mouseenter', Swal.stopTimer)
			toast.addEventListener('mouseleave', Swal.resumeTimer)
				}
			})
								
			Toast.fire({
			icon: 'success',
			title: '<p style="font-size:15px;">Your order successfully done</p>'
				})
	   </script>
	<%
		}
	%>
	<%
		if ("updateaddress".equals(msg)) {
	%>
	   <script type="text/javascript">
			const Toast = Swal.mixin({
			toast: true,
			position: 'top-end',
			showConfirmButton: false,
			timer: 3000,
			timerProgressBar: true,
			didOpen: (toast) => {
			toast.addEventListener('mouseenter', Swal.stopTimer)
			toast.addEventListener('mouseleave', Swal.resumeTimer)
				}
			})
								
			Toast.fire({
			icon: 'success',
			title: '<p style="font-size:15px;">Address updtae successfully</p>'
				})
	   </script>
	<%
		}
	%>

	<!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->
	
    <%@include file="mobile-menu.jsp" %>

    <!-- Sign in / Register Modal -->
    <div class="modal fade" id="signin-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="icon-close"></i></span>
                    </button>

                    <div class="form-box">
                        <div class="form-tab">
                            <ul class="nav nav-pills nav-fill" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="signin-tab" data-toggle="tab" href="#signin" role="tab" aria-controls="signin" aria-selected="true">Sign In</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="register-tab" data-toggle="tab" href="#register" role="tab" aria-controls="register" aria-selected="false">Register</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="tab-content-5">
                                <div class="tab-pane fade show active" id="signin" role="tabpanel" aria-labelledby="signin-tab">
                                    <form action="#">
                                        <div class="form-group">
                                            <label for="singin-email">Username or email address *</label>
                                            <input type="text" class="form-control" id="singin-email" name="singin-email" required>
                                        </div><!-- End .form-group -->

                                        <div class="form-group">
                                            <label for="singin-password">Password *</label>
                                            <input type="password" class="form-control" id="singin-password" name="singin-password" required>
                                        </div><!-- End .form-group -->

                                        <div class="form-footer">
                                            <button type="submit" class="btn btn-outline-primary-2">
                                                <span>LOG IN</span>
                                                <i class="icon-long-arrow-right"></i>
                                            </button>

                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="signin-remember">
                                                <label class="custom-control-label" for="signin-remember">Remember Me</label>
                                            </div><!-- End .custom-checkbox -->

                                            <a href="#" class="forgot-link">Forgot Your Password?</a>
                                        </div><!-- End .form-footer -->
                                    </form>
                                    <div class="form-choice">
                                        <p class="text-center">or sign in with</p>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <a href="#" class="btn btn-login btn-g">
                                                    <i class="icon-google"></i>
                                                    Login With Google
                                                </a>
                                            </div><!-- End .col-6 -->
                                            <div class="col-sm-6">
                                                <a href="#" class="btn btn-login btn-f">
                                                    <i class="icon-facebook-f"></i>
                                                    Login With Facebook
                                                </a>
                                            </div><!-- End .col-6 -->
                                        </div><!-- End .row -->
                                    </div><!-- End .form-choice -->
                                </div><!-- .End .tab-pane -->
                                <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                                    <form action="#">
                                        <div class="form-group">
                                            <label for="register-email">Your email address *</label>
                                            <input type="email" class="form-control" id="register-email" name="register-email" required>
                                        </div><!-- End .form-group -->

                                        <div class="form-group">
                                            <label for="register-password">Password *</label>
                                            <input type="password" class="form-control" id="register-password" name="register-password" required>
                                        </div><!-- End .form-group -->

                                        <div class="form-footer">
                                            <button type="submit" class="btn btn-outline-primary-2">
                                                <span>SIGN UP</span>
                                                <i class="icon-long-arrow-right"></i>
                                            </button>

                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="register-policy" required>
                                                <label class="custom-control-label" for="register-policy">I agree to the <a href="#">privacy policy</a> *</label>
                                            </div><!-- End .custom-checkbox -->
                                        </div><!-- End .form-footer -->
                                    </form>
                                    <div class="form-choice">
                                        <p class="text-center">or sign in with</p>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <a href="#" class="btn btn-login btn-g">
                                                    <i class="icon-google"></i>
                                                    Login With Google
                                                </a>
                                            </div><!-- End .col-6 -->
                                            <div class="col-sm-6">
                                                <a href="#" class="btn btn-login  btn-f">
                                                    <i class="icon-facebook-f"></i>
                                                    Login With Facebook
                                                </a>
                                            </div><!-- End .col-6 -->
                                        </div><!-- End .row -->
                                    </div><!-- End .form-choice -->
                                </div><!-- .End .tab-pane -->
                            </div><!-- End .tab-content -->
                        </div><!-- End .form-tab -->
                    </div><!-- End .form-box -->
                </div><!-- End .modal-body -->
            </div><!-- End .modal-content -->
        </div><!-- End .modal-dialog -->
    </div><!-- End .modal -->

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