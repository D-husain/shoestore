<%@page import="pojo.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%Order o=(Order)session.getAttribute("orders"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet" href="assets/css/order.css">
</head>
<body>
<%@include file="header.jsp" %>
<div class="container padding-bottom-3x mb-1">
        <div class="card mb-3">
          <div class="p-4 text-center text-white text-lg bg-dark rounded-top"><span class="text-uppercase">Tracking Order No - </span><span class="text-medium"><%=o.getId()%></span></div>
          <div class="d-flex flex-wrap flex-sm-nowrap justify-content-between py-3 px-2 bg-light">
            <div class="w-100 text-center py-1 px-2"><span class="text-medium">Shipped Via:</span> Shoe Store</div>
            <div class="w-100 text-center py-1 px-2"><span class="text-medium">Status:</span> 
            			<%
						 	Integer status = o.getStatus();
						 	pageContext.setAttribute("statu", status.toString());
						%> 
						<%
						 	String statu = (String) pageContext.getAttribute("statu");
						%> 
						<%
						 	if (statu.equals("1")) {
						 %> <label>Pending</label> <%
						 	} else if (statu.equals("2")) {
						 %> <label>Active</label> <%
						 	} else if (statu.equals("3")) {
						 %> <label>Shipping</label> <%
						 	} else if (statu.equals("4")) {
						 %> <label>Delivered</label> <%
						 	} else if (statu.equals("5")) {
						 %> <label>Cancelled</label>
						<%
							}
						%></div>
            <div class="w-100 text-center py-1 px-2"><span class="text-medium">Order Date:</span> <%=o.getOdate()%></div>
          </div><br>
			<div class="card-body">
            <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">
              
              <%
				if (statu.equals("1")) {
				%>
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-cart my-4"></i></div>
                </div>
                <h4 class="step-title">Confirmed Order</h4>
              </div>
              <div class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-config my-4"></i></div>
                </div>
                <h4 class="step-title">Processing Order</h4>
              </div>
              <div class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-car my-4"></i></div>
                </div>
                <h4 class="step-title">Product Dispatched</h4>
              </div>
              <div class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-home my-4"></i></div>
                </div>
                <h4 class="step-title">Product Delivered</h4>
              </div>
              
              <%}
              else if (statu.equals("2")) {
				%>
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-cart my-4"></i></div>
                </div>
                <h4 class="step-title">Confirmed Order</h4>
              </div>
              
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-config my-4"></i></div>
                </div>
                <h4 class="step-title">Processing Order</h4>
              </div>
              <div class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-car my-4"></i></div>
                </div>
                <h4 class="step-title">Product Dispatched</h4>
              </div>
              <div class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-home my-4"></i></div>
                </div>
                <h4 class="step-title">Product Delivered</h4>
              </div>
               <%}
				if (statu.equals("3")) {
				%>
				<div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-cart my-4"></i></div>
                </div>
                <h4 class="step-title">Confirmed Order</h4>
              </div>
              
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-config my-4"></i></div>
                </div>
                <h4 class="step-title">Processing Order</h4>
              </div>
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-car my-4"></i></div>
                </div>
                <h4 class="step-title">Product Dispatched</h4>
              </div>
              <div class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-home my-4"></i></div>
                </div>
                <h4 class="step-title">Product Delivered</h4>
              </div>
              
              <%}
				if (statu.equals("4")) {
				%>
				<div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-cart my-4"></i></div>
                </div>
                <h4 class="step-title">Confirmed Order</h4>
              </div>
              
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-config my-4"></i></div>
                </div>
                <h4 class="step-title">Processing Order</h4>
              </div>
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-car my-4"></i></div>
                </div>
                <h4 class="step-title">Product Dispatched</h4>
              </div>
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-home my-4"></i></div>
                </div>
                <h4 class="step-title">Product Delivered</h4>
              </div>
              
               <%}
				if (statu.equals("5")) {
				%>
				<div class="mx-auto">
				<h3 class="text-center">Your Order Cancel</h3>
				<h4 class="">Order Cancellation Reason =<%=o.getCancelorder()%></h4>
				</div>
              <%} %>
            </div>
          </div>
        </div>
        <div class="d-flex flex-wrap flex-md-nowrap justify-content-center justify-content-sm-between align-items-center">
          <div class="custom-control custom-checkbox mr-3">
	         <%
				 if (statu.equals("4")) {
			 %>
            <div class="text-left text-sm-right">
            <a class="btn btn-outline-primary btn-rounded btn-sm" href="invoice?orderId=<%=o.getId()%>">Download Invoice<i class="pe-7s-download"></i></a>
            </div> 
            <%} %>
          </div>
          <div class="text-left text-sm-right"><a class="btn btn-outline-primary btn-rounded btn-sm" href="orderdetails?id=<%=o.getId()%>">View Order Details</a></div>
        </div>
      </div>
<%@include file="footer.jsp" %>
</body>
</html>