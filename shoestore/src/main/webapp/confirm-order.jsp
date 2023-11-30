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
   <% Usercoupon uc=(Usercoupon)session.getAttribute("usercoupon"); %>
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
 <%
 	ShippingAddress shi = (ShippingAddress) session.getAttribute("shipping");
	Order order = (Order) session.getAttribute("Orders");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
      <%@include file="header.jsp" %>
	<!-- Latest compiled and minified CSS -->
<%if(user!=null){ %>
<form action="emailorder.jsp" method="post">
<div class="container" style="margin-top:5%;">
	<div class="row">
        <div class="jumbotron" style="box-shadow: 2px 2px 4px #000000;">
            <h2 class="text-center">YOUR ORDER HAS BEEN RECEIVED</h2>
          <h3 class="text-center">Thank you for your payment, it’s processing</h3>
					<%
						List<Coupon> coupon = adao.viewCoupon();
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
					<%
						UserDao udao = new UserDao();

							List<Cart> cartlist = udao.showCart(user.getId());
							double total = udao.gettotalprice(cartlist);
							request.setAttribute("total", total);

							double subtotal = udao.getShipping(cartlist);
							request.setAttribute("subtotal", subtotal);

							double shippingCost = order.getCharge();
							double grandtotal = shippingCost + total;

							double discountPercentage = cop;
							double discountAmount = grandtotal * (discountPercentage / 100);
							double discountedSubtotal = subtotal -= discountAmount;

							subtotal = discountedSubtotal + shippingCost;

							
					%>
							<input type="hidden" id="uid" name="uid" value="<%=user.getId()%>">

						<%for(Cart c:cartlist){ %>
							<input type="hidden" name="productadd" value="<%=c.getProduct().getPname()%>"> 
							<input type="hidden" id="qty" name="qty" value="<%=c.getQty()%>">
							<input type="hidden" name="price" value="<%=c.getProduct().getPrice()%>"> 
							<input type="hidden" name="total" value="<%=c.getTotal()%>">
							<input type="hidden" name="pid" value="<%=c.getProduct().getId()%>">
						<%
							} 
						%>
							<input type="hidden" name="grandtotal" value="<%=grandtotal%>"> 
						<%
									if (uc!= null) {
									%>
							<input type="hidden" name="amount" value="<%=subtotal%>"> 
							<input type="hidden" name="discount" value="<%=order.getDiscount()%>">
						<%
							}else{
						%>
							<input type="hidden" name="amount" value="<%=grandtotal%>">
						<%
							} 
						%>
						<input type="hidden" name="orderId" value="<%=order.getId()%>">
						<input type="hidden" id="date" name="date" value="<%=formatDateTime%>">
						<input type="hidden" name="Total" value="<%=total%>">
						
						<input type="hidden" name="id" value="<%=shi.getId()%>"> 
						<input type="hidden" name="address1" value="<%=shi.getAddress1()%>">
						<input type="hidden" name="city" value="<%=shi.getCity()%>">
						<input type="hidden" name="country" value="<%=shi.getCountry()%>">
						<input type="hidden" name="state" value="<%=shi.getState()%>">
						<input type="hidden" name="email" value="<%=shi.getEmail()%>">
						<input type="hidden" name="name" value="<%=shi.getFname()%> <%=shi.getLname()%>">

						<p class="text-center">Your order # is: <%=order.getId()%></p>
						<p class="text-center">You will receive an order confirmation
							email with details of your order and a link to track your
							process.</p>
						<center>
							<div class="btn-group" style="margin-top: 50px;">
								<button class="btn btn-lg btn-primary">Confirm order</button>
							</div>
						</center>
					</div>
			</div>
</div>
</form>
<%} %>

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