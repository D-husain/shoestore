<%@page import="pojo.Usercoupon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Coupon"%>
<%@page import="pojo.Order"%>
<%@page import="pojo.ShippingAddress"%>
<%@page import="pojo.Cart"%>
<%@page import="dao.UserDao"%>
<%@page import="pojo.Product"%>
<%@page import="java.util.Random"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
LocalDateTime now = LocalDateTime.now();
System.out.println("Before Formatting: " + now);
DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");
String formatDateTime = now.format(format);
%>
<%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(100);
 %>
 <% ShippingAddress shi = (ShippingAddress) session.getAttribute("shipping"); %>
<%
	AdminDao admindao=new AdminDao();
	List<Coupon> coupon = admindao.viewCoupon();
	session.setAttribute("coupon", coupon);
%>
<%
	ArrayList<Coupon> coupons = (ArrayList<Coupon>) session.getAttribute("coupon");

	if (coupons != null && !coupons.isEmpty()) {
		Coupon firstcoupon = coupons.get(0); // Get the first review (you can change the index as needed)
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
<!DOCTYPE html>
<html lang="en">
<head>
	<style type="text/css">
	.size{
		width: 50%;
	}
	</style>
</head>

<body>
      <%@include file="header.jsp" %>
	<form action="Orders" method="post" id="someFormId">
        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">Payment<span>Shop</span></h1>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="checkout.jsp"></a>Checkout</li>
                        <li class="breadcrumb-item active" aria-current="page">payment</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav --> 
            <%
 				String msg=request.getParameter("msg");
 				if ("add".equals(msg)) {
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
		  		title: '<p style="font-size:15px;">Shipping Added.</p>'
					})
			</script> 
			<%
 				}
			%>
            <div class="page-content">
            	<div class="checkout">
	                <div class="container">
            			<div class="checkout-discount">
            				
            			</div><!-- End .checkout-discount -->
		                	<div class="row">
		                
		                		<div class="col-lg-6">
		                			<!-- <h2 class="checkout-title">Billing Details</h2>End .checkout-title -->
		                			<div class="col-span-1 border-2 border-dark">
						                	<table class="w-full text-sm">
						                    <tr class="border-b-2">
						                        <th colspan='2' class="text-left py-1 font-semibold text-first">Shipping address</th>
						                    </tr>
						                    <tr>
						                        <td class="pt-1 text-gray-600 size">Name</td>
						                        <td class="pt-1 font-medium">: <span><%=shi.getFname()%> <%=shi.getLname()%></span></td>
						                    </tr>
						                    <tr>
						                        <td class="pt-1 text-gray-600">Email</td>
						                        <td class="pt-1 font-medium">: <span><%=shi.getEmail()%></span></td>
						                    </tr>
						                    <tr>
						                        <td class="pt-1 text-gray-600">Phone</td>
						                        <td class="pt-1 font-medium">: <span><%=shi.getContact()%></span></td>
						                    </tr>
						                    <tr>
						                        <td class="pt-1 text-gray-600">Address</td>
						                        <td class="pt-1 font-medium">: <span><%=shi.getAddress1()%></span></td>
						                    </tr>
						                    <tr>
						                        <td class="pt-1 text-gray-600">City</td>
						                        <td class="pt-1 font-medium">: <span><%=shi.getCity()%></span></td>
						                    </tr>
						                    <tr>
						                        <td class="pt-1 text-gray-600">State/Territory</td>
						                        <td class="pt-1 font-medium">: <span><%=shi.getState()%></span></td>
						                    </tr>
						                    <tr>
						                        <td class="pt-1 text-gray-600">Postal code</td>
						                        <td class="pt-1 font-medium">: <span><%=shi.getZip()%></span></td>
						                    </tr>
						                </table>
						                <br/>
						                <table class="w-full text-sm">
						                    <tr class="border-b-2">
						                        <th colspan='2' class="text-left py-1 font-semibold text-first">Billing address</th>
						                    </tr>
						                    <tr>
						                        <td class="pt-1 text-gray-600 size">Name</td>
						                        <td class="pt-1 font-medium">: <span><%=user.getFname()%> <%=user.getLname()%></span></td>
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
						                        <td class="pt-1 text-gray-600">City</td>
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
						                <br/>
		                            </div>
		                		</div><!-- End .col-lg-9 -->
							<%if(user!=null){ %>
						<%
							UserDao udao = new UserDao();
						    Usercoupon uc=(Usercoupon)session.getAttribute("usercoupon");
						 						        
					        List<Cart> cartlist = udao.showCart(user.getId());
					        double total = udao.gettotalprice(cartlist);
					
					        double subtotal = udao.getShipping(cartlist);
					        
					        double shippingCost = (double)session.getAttribute("charge");
					        double grandtotal= shippingCost+ total;
					        
					        double discountPercentage = cop;
					        double discountAmount = grandtotal * (discountPercentage / 100);
					        double discountedSubtotal= subtotal -= discountAmount;
					        
					        subtotal = discountedSubtotal + shippingCost;

						%>
								<aside class="col-lg-6">
						
									<input type="hidden" id="uid" name="uid" value="<%=user.getId()%>">
									<input type="hidden" name="id" value="<%=shi.getId()%>">
									<%
									if (uc!= null) {
									%>
									<input type="hidden" name="amount" value="<%=subtotal%>">
									<input type="hidden" name="discount" value="<%=discountAmount%>">
									<%}else{ %>
									<input type="hidden" name="amount" value="<%=grandtotal%>">
									<%
										}
									%>
									<input type="hidden" id="status" name="status" value="1">
									<input type="hidden" name="total" value="<%=total%>">
									<input type="hidden" id="date" name="date" value="<%=formatDateTime%>">
									<input type="hidden" name="charge" value="<%=session.getAttribute("charge")%>">
								
								
									<div class="summary">
		                				<h3 class="summary-title">Order Summary</h3><!-- End .summary-title -->

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
							                    <td>&#8377;<%= shippingCost %></td>
							                </tr>
							                <tr class="summary-subtotal">
							                    <td>Grand Total:</td>
							                    <td>&#8377;<%= grandtotal %></td>
							                </tr>
							                <tr>
							                	<%
													if (uc!= null) {
												%>
							                    <td>Coupon-(<%=uc.getCoupon()%>)</td>
							                    <td>-<%=discountAmount%></td>
							                </tr>
							                
							                <tr class="summary-total">
							                    <td>Discount Total:</td>
							                    <td>&#8377;<%=subtotal%></td>
							                </tr><!-- End .summary-total -->
							                <%} %>
							            </tbody>
		                					
		                				</table><!-- End .table table-summary -->
											<div class="row">
		                			<div class="accordion-summary" id="accordion-payment">
										<button id="rzp-button1" class="btn btn-outline-dark btn-lg"><i class="fas fa-money-bill"></i>Checkout</button>
		                			</div>
		                			<%-- <form name="change_qty" method="post" action="pgRedirect.jsp">
								<input type="hidden" name="TXN_AMOUNT" value="${total}">
								<input type="hidden" id="ORDER_ID" name="ORDER_ID" autocomplete="off" value="ORDS_<%= randomInt %>">
								<input type="hidden" id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001">
								<input type="hidden" id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
								<input type="hidden" id="CHANNEL_ID" tabindex="4" maxlength="12" size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
								<input type="submit" name="action" value="CheckOut">
							</form>  --%>
							
		                				</div><!-- End .row -->
		                			
										</div><!-- End .accordion -->
		                		</aside><!-- End .col-lg-3 -->
		                		
		                		<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
		                		
		                		<% if (uc!= null) {%>
		                		<script type="text/javascript">
								var options = {
								    "key": "rzp_test_BFuqGW7IZkVybQ",
								    // Enter the Key ID generated from the Dashboard
								    "amount":<%=subtotal%>*100, 
									 // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
								    "currency": "INR",
								    "name": "Shoe Store",
								    "description": "Test Transaction",
								    "image": "assets/images/demos/demo-10/shoe-logo.png",
								    //"order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
								    "handler": function (response){
								    	 document.getElementById('someFormId').submit();},  
								   //"callback_url": "order.jsp",
								    "prefill": {
								        "name": "<%=user.getFname()%><%=user.getLname()%>",
								        "email": "<%=user.getEmail()%>",
								        "contact": "+91 <%=user.getContact()%>"
								    },
								    "notes": {
								        "address": "<%=user.getAddress()%><%=user.getCity()%><%=user.getState()%>"
								    },
								    "theme": {
								        "color": "#445f84;"
								    }
								};
								var rzp1 = new Razorpay(options);
								rzp1.on('payment.failed', function (response){
									alert(response.error.code);
									alert(response.error.description);
									alert(response.error.source);
									alert(response.error.step);
									alert(response.error.reason);
									alert(response.error.metadata.order_id);
									alert(response.error.metadata.payment_id);
									});
									document.getElementById('rzp-button1').onclick = function(e){
									rzp1.open();
									e.preventDefault();
								}</script>
								<%}else{%>
							 <script type="text/javascript">
								var options = {
								    "key": "rzp_test_BFuqGW7IZkVybQ",
								    // Enter the Key ID generated from the Dashboard
								    "amount": <%=grandtotal%>*100, 
									 // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
								    "currency": "INR",
								    "name": "Shoe Store",
								    "description": "Test Transaction",
								    "image": "assets/images/demos/demo-10/shoe-logo.png",
								    //"order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
								    "handler": function (response){
								    	 document.getElementById('someFormId').submit();},  
								   //"callback_url": "order.jsp",
								    "prefill": {
								        "name": "<%=user.getFname()%><%=user.getLname()%>",
								        "email": "<%=user.getEmail()%>",
								        "contact": "+91 <%=user.getContact()%>"
								    },
								    "notes": {
								        "address": "<%=user.getAddress()%><%=user.getCity()%><%=user.getState()%>"
								    },
								    "theme": {
								        "color": "#445f84;"
								    }
								};
								var rzp1 = new Razorpay(options);
								rzp1.on('payment.failed', function (response){
									alert(response.error.code);
									alert(response.error.description);
									alert(response.error.source);
									alert(response.error.step);
									alert(response.error.reason);
									alert(response.error.metadata.order_id);
									alert(response.error.metadata.payment_id);
									});
									document.getElementById('rzp-button1').onclick = function(e){
									rzp1.open();
									e.preventDefault();
								}</script>
		                		<%}} %>
		                	</div><!-- End .row -->
		                	
		                </div><!-- End .container -->
                </div><!-- End .checkout -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->
						</form>

       <%@include file="footer.jsp" %>
       <!-- Plugins JS File -->
    <!-- <script src="assets/js/payment.js"></script> -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/jquery.hoverIntent.min.js"></script>
    <script src="assets/js/jquery.waypoints.min.js"></script>
    <script src="assets/js/superfish.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/bootstrap-input-spinner.js"></script>
    <script src="assets/js/jquery.elevateZoom.min.js"></script>
    <script src="assets/js/bootstrap-input-spinner.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>


<!-- Mirrored from portotheme.com/html/molla/checkout.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:21:47 GMT -->
</html>