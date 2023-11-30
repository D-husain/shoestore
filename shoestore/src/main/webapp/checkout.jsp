<!DOCTYPE html>
<%@page import="pojo.States"%>
<%@page import="pojo.Cities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Coupon"%>
<%@page import="pojo.Usercoupon"%>
<%@page import="pojo.Cart"%>
<%@page import="dao.UserDao"%>
<%
	AdminDao admindao = new AdminDao();
	List<Coupon> coupon = admindao.viewCoupon();
	session.setAttribute("coupon", coupon);
%>
<%
	ArrayList<Coupon> coupons = (ArrayList<Coupon>) session.getAttribute("coupon");

	if (coupons != null && !coupons.isEmpty()) {
		Coupon firstcoupon = coupons.get(0);
		Integer copounss = firstcoupon.getValue();
		pageContext.setAttribute("coup", copounss);
	}
%>
<%
	double cop = 0.0;

	Object coupAttribute = pageContext.getAttribute("coup");
	if (coupAttribute != null) {
		try {
			cop = Double.parseDouble(coupAttribute.toString());
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}
%>
<html lang="en">
<body>
    <div class="page-wrapper">
        <%@include file="header.jsp" %>

        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">Checkout<span>Shop</span></h1>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="cart.jsp">Cart</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->
	<%
		UserDao udao=new UserDao();
		List<States> state=udao.showStates();
	%>
            <div class="page-content">
            	<div class="checkout">
	                <div class="container">
	                <%if(user!=null){ %>
	                <div class="checkout-discount">
            				<form action="applyDiscount" method="post">
        						<input type="text" class="form-control" name="coupon" required id="checkout-discount-input">
        						<input type="hidden" name="id" value="<%=user.getId()%>">
            					<label for="checkout-discount-input" class="text-truncate">Have a coupon? <span>Click here to enter your code</span></label>
            				</form>
            			</div><!-- End .checkout-discount -->
            			<%} %>
            			<form action="AddShipping" method="post">
		                	<div class="row">
		                		<div class="col-lg-9">
		                			<h2 class="checkout-title">Billing Details</h2><!-- End .checkout-title -->
		                				<div class="row">
		                				
		                					<div class="col-sm-6">
		                						<label>First Name *</label>
		                						<input type="text" value="<%=user.getFname()%>" name="fname" class="form-control" required>
		                					</div><!-- End .col-sm-6 -->

		                					<div class="col-sm-6">
		                						<label>Last Name *</label>
		                						<input type="text" value="<%=user.getLname()%>" name="lname" class="form-control" required>
		                					</div><!-- End .col-sm-6 -->
		                				</div><!-- End .row -->

	            						<label>Company Name (Optional)</label>
	            						<input type="text" name="cname" class="form-control">

	            						<label>Country *</label>
	            						<input type="text" value="<%=user.getCountry()%>" name="country" class="form-control" required>

	            						<label>Street address *</label>
	            						<input type="text" name="address1" value="<%=user.getAddress()%>" class="form-control" placeholder="House number and Street name" required>
	            						<input type="text" name="address2" class="form-control" placeholder="Appartments, suite, unit etc ..." required>

	            						<div class="row">
										    <div class="col-sm-6">
										        <label>State *</label>
										        <select name="state" class="form-control">
										            <option selected="selected" disabled="disabled">Select State</option>
										            <% for (States s : state) { %>
										                <option value="<%=s.getName()%>"><%=s.getName()%></option>
										            <% } %>
										        </select>
										    </div><!-- End .col-sm-6 -->
										
										    <div class="col-sm-6">
										        <label>Town / City *</label>
										        <select name="city" class="form-control">
										            <option selected="selected" disabled="disabled">Select City</option>
										            <% 
										                for (States s : state) {
										                    List<Cities> clist = udao.ViewCities(s.getId());
										                    for (Cities c2 : clist) {
										            %>
										                <option value="<%=c2.getCity()%>"><%=c2.getCity()%></option>
										            <% 
										                    } 
										                }
										            %>
										        </select>
										    </div><!-- End .col-sm-6 -->
										</div><!-- End .row -->

		                				<div class="row">
		                					<div class="col-sm-6">
		                						<label>Postcode / ZIP *</label>
		                						<input type="text" id="zipCode" onblur="calculateShipping()" maxlength="6" name="zip" class="form-control" required>
		                					</div><!-- End .col-sm-6 -->

		                					<div class="col-sm-6">
		                						<label>Phone *</label>
		                						<input value="<%=user.getContact()%>" type="tel" name="contact" class="form-control" required>
		                					</div><!-- End .col-sm-6 -->
		                				</div><!-- End .row -->

	                					<label>Email address *</label>
	        							<input type="email" value="<%=user.getEmail()%>" name="email" class="form-control" required>

	                					<label>Order notes (optional)</label>
	        							<textarea class="form-control" name="onote" cols="30" rows="4" placeholder="Notes about your order, e.g. special notes for delivery"></textarea>
		                		</div><!-- End .col-lg-9 -->
		                		
								<%
								      if (user != null) {
								        List<Usercoupon> uco=udao.ViewUsercoupon(user.getId());
								        
								        List<Cart> cartlist = udao.showCart(user.getId());
								        double total = udao.gettotalprice(cartlist);
								%>
							<aside class="col-lg-3">
							    <div class="summary">
							    <div id="shippingCharge"></div>
							        <h3 class="summary-title">Your Order</h3><!-- End .summary-title -->
							
							        <table class="table table-summary">
							            <thead>
							                <tr>
							                    <th>Product</th>
							                    <th>Total</th>
							                </tr>
							            </thead>
							
							            <tbody>
							                <% for (Cart c : cartlist) { %>
							                <tr>
							                    <td><a href="#"><%= c.getProduct().getPname() %></a></td>
							                    <td>&#8377;<%= c.getPrice() %> x <%= c.getQty() %></td>
							                </tr>
							                <% } %>
							                <tr class="summary-subtotal">
							                    <td>Subtotal:</td>
							                    <td>&#8377;<%= total %></td>
							                </tr>
							                <tr>
							                    <td>Shipping:</td>
							                    <td>Will be calculated in next step</td>
							                </tr>
							                <tr>
							                <%Usercoupon uc=(Usercoupon)session.getAttribute("usercoupon"); %>
							                	<%
													if (uc!= null) {
												%>
							                    <td>Coupon 
							                    <a data-toggle="modal" data-target="#deletecoupon<%=uc.getId()%>"><svg xmlns="http://www.w3.org/2000/svg" height="0.940em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#ec6f6f}</style><path d="M135.2 17.7C140.6 6.8 151.7 0 163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3zM32 128H416V448c0 35.3-28.7 64-64 64H96c-35.3 0-64-28.7-64-64V128zm96 64c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16z"/></svg>
							                     </a></td>
							                    <td><%=uc.getCoupon()%></td>
							                </tr>
							                <%} %>
							                <tr class="summary-subtotal">
							                    <td>Subtotal:</td>
							                    <td>&#8377;<%= total %></td>
							                </tr>
							                
							            </tbody>
							        </table><!-- End .table table-summary -->
							
							        <input type="hidden" name="uid" value="<%= user.getId() %>">
							        <button type="submit" class="btn btn-outline-primary-2 btn-order btn-block">
							            <span class="btn-text">Place Order</span>
							            <span class="btn-hover-text">Proceed to Checkout</span>
							        </button>
							    </div><!-- End .summary -->
							</aside><!-- End .col-lg-3 -->
							<%
							}%>
						</div><!-- End .row -->
            			</form>
	                </div><!-- End .container -->
                </div><!-- End .checkout -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

        <%@include file="footer.jsp" %>
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

    <!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

    <%@include file="mobile-menu.jsp" %>
    
	<%
		if (user != null) {
		List<Usercoupon> uco = udao.ViewUsercoupon(user.getId());
	%>
	<%
		for (Usercoupon uc : uco) {
	%>
	<div class="modal fade" id="deletecoupon<%=uc.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Remove Coupon</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>&nbsp; You want to remove this coupon code?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
					<a href="deletecoupon?id=<%=uc.getId()%>" type="button" class="btn btn-primary">Yes</a>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		}
	%>
	
	
	<script type="text/javascript">
    function calculateShipping() {
        var zipCode = document.getElementById("zipCode").value;
        
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "AddShipping", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var shippingCharge = parseFloat(xhr.responseText);
                if (!isNaN(shippingCharge)) {
                    document.getElementById("shippingCharge").innerHTML = "Shipping Charge: $" + shippingCharge.toFixed(2);
                } else {
                    document.getElementById("shippingCharge").innerHTML = "Invalid Zip Code";
                }
            }
        };
        
        xhr.send("zipCode=" + zipCode);
    }
</script>

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
 <%
 				String msg=request.getParameter("msg");
 				if ("apply".equals(msg)) {
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
		  		title: '<p style="font-size:15px;">Apply Coupon successfully.</p>'
					})
			</script> 
			<%
 				}
			%>
				 <%
 				if ("nomatch".equals(msg)) {
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
		  		icon: 'error',
		  		title: '<p style="font-size:15px;">Invalid Coupon.</p>'
					})
			</script> 
			<%
 				}
			%>
			 <%
 				if ("del".equals(msg)) {
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
		  		icon: 'error',
		  		title: '<p style="font-size:15px;">Coupon delete successfully.</p>'
					})
			</script> 
			<%
 				}
			%>
			<%
 				if ("match".equals(msg)) {
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
		  		icon: 'error',
		  		title: '<p style="font-size:15px;">Coupon allredy apply.</p>'
					})
			</script> 
			<%
 				}
			%>
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


<!-- Mirrored from portotheme.com/html/molla/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:21:47 GMT -->
</html>