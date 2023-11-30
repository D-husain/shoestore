<%@page import="dao.AdminDao"%>
<%@page import="dao.UserDao"%>
<%@page import="pojo.Cart"%>
<%@page import="pojo.Category"%>
<%@page import="pojo.Wishlist"%>
<%@page import="java.util.List"%>
<%@page import="pojo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%User user=(User)session.getAttribute("user"); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Shoe Store</title>
    <meta name="keywords" content="Shoe store">
    <meta name="description" content="Shoe store">
    <meta name="author" content="p-themes">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/images/demos/demo-10/shoe-logo.png">
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/icons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/icons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/icons/favicon-16x16.png">
    <link rel="manifest" href="assets/images/icons/site.jsp">
    <link rel="mask-icon" href="assets/images/icons/safari-pinned-tab.svg" color="#666666">
    <link rel="shortcut icon" href="assets/images/icons/favicon.ico">
    <meta name="apple-mobile-web-app-title" content="Molla">
    <meta name="application-name" content="Molla">
    <meta name="msapplication-TileColor" content="#cc9966">
    <meta name="msapplication-config" content="assets/images/icons/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">
    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/plugins/magnific-popup/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/plugins/jquery.countdown.css">
    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/skins/skin-demo-10.css">
    <link rel="stylesheet" href="assets/css/demos/demo-10.css">
    <!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.css">
</head>
<body>
<header class="header header-8">
            <div class="header-top">
                <div class="container">
                    <div class="header-left">
                        <div class="header-dropdown">
                        <div><br></div>
                        </div><!-- End .header-dropdown -->
                    </div><!-- End .header-left -->

                    <div class="header-right">
                        <ul class="top-menu">
                            <li>
                                <a href="#">Links</a>
                                <ul>
                                    <li><a href="tel:#"><i class="icon-phone"></i>Call: +0123 456 789</a></li>
                                    <li><a href="contact.jsp"><i class="icon-envelope"></i>Contact Us</a></li>
                                    <li><a href="wishlist.jsp"><i class="icon-heart-o"></i>My Wishlist <span>
                                    <%
										if (user != null) {
									%>
									<%
										UserDao udao=new UserDao();
										List<Wishlist> wishlist=udao.showwishlist(user.getId());
									%>
									
										<%if(wishlist.size()==0){ %>
										<%}else{ %>
                                    	(<%=wishlist.size()%>)
                                    	<%} %>
                                    <%
										}
									%>
                                    </span></a></li>
                                    <%
                                    	if(user == null){
                                    %>
                                     <li><a href="login.jsp"><i class="icon-user"></i>Login</a></li>
                                    <%}else{ %>
                                    <li><a href="ordersearch.jsp"><i class="icon-shopping-cart"></i>Order Search<span>
                                     <li><a href="dashboard.jsp"><i class="icon-user"></i>Account</a></li>
                                    <%} %>
                                   
                                </ul>
                            </li>
                        </ul><!-- End .top-menu -->
                    </div><!-- End .header-right -->
                </div><!-- End .container -->
            </div><!-- End .header-top -->

            <div class="header-middle sticky-header">
                <div class="container">
                    <div class="header-left">
                        <button class="mobile-menu-toggler">
                            <span class="sr-only">Toggle mobile menu</span>
                            <i class="icon-bars"></i>
                        </button>

                        <a href="index.jsp" class="logo">
                            <img src="assets/images/demos/demo-10/shoe-logo.png" alt="Shoe Logo" width="90" height="20">
                        </a>
                    </div><!-- End .header-left -->

                    <div class="header-right">
                        <nav class="main-nav">
                            <ul class="menu sf-arrows">
                                <li class="megamenu-container active">
                                    <a href="index.jsp" class="">Home</a>
                                </li>
                                <li>
                                    <a href="shop.jsp" class="">Shop</a>
                                </li>
                                <li>
                                    <a href="contact.jsp" class="">Contact</a>
                                </li>
                                <li>
                                    <a href="about.jsp" class="">About Us</a>
                                </li>
                                <%
                                	AdminDao adao=new AdminDao();
                                	List<Category> catlist=adao.ShowCategory();
                                %>
                                <li>
                                    <a href="#" class="sf-with-ul">Category</a>
                                    <ul>
                                    <%for(Category c:catlist){ %>
                                        <li><a href="shop.jsp?id=<%=c.getId()%>"><%=c.getCname()%></a></li>
                                    <%} %>
                                    </ul>
                                </li>
                            </ul><!-- End .menu -->
                        </nav><!-- End .main-nav -->

                        <div class="header-search">
                            <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                            <form action="ProductSearch" method="get">
                                <div class="header-search-wrapper">
                                    <label for="q" class="sr-only">Search</label>
                                    <input type="search" class="form-control" name="search" id="q" placeholder="Search product..." required>
                                </div><!-- End .header-search-wrapper -->
                            </form>
                        </div><!-- End .header-search -->

                        <div class="dropdown cart-dropdown">
                            <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                                <i class="icon-shopping-cart"></i>
                               
                                <%if (user !=null) {%> 
                                <%
								 	UserDao udao = new UserDao();
								 	List<Cart> cart = udao.showCart(user.getId());
								%>
								
								<%if(cart.size()==0){ %>
								<%}else {%>
									 <span class="cart-count"> <%=cart.size()%> </span>
								<%} %>
								
								<%
								 	}else{
								%>
									 
								<%} %>
								
                            </a>

                            <div class="dropdown-menu dropdown-menu-right">
                            <%if(user!=null) {%>
                            	<%
								 	UserDao udao = new UserDao();
								 	List<Cart> cart = udao.showCart(user.getId());
								 	double total = udao.gettotalprice(cart);
									request.setAttribute("total", total);
								%>
                            	<%for(Cart c:cart){ %>
                                <div class="dropdown-cart-products">
                                
                                    <div class="product">
                                        <div class="product-cart-details">
                                            <h4 class="product-title">
                                                <a href="product-detail.jsp?id=<%=c.getProduct().getId()%>"><%=c.getProduct().getPname()%></a>
                                            </h4>

                                            <span class="cart-product-info">
                                                <span class="cart-product-qty">&#8377;<%=c.getPrice()%></span>
                                                x <%=c.getQty()%>
                                            </span>
                                        </div><!-- End .product-cart-details -->

                                        <figure class="product-image-container">
                                            <a href="product-detail.jsp?id=<%=c.getProduct().getId()%>" class="product-image">
                                                <img src="image/Product/<%=c.getProduct().getImage1()%>" alt="product">
                                            </a>
                                        </figure>
                                        <button data-toggle="modal" data-target="#deletemodalcart<%=c.getId()%>" class="btn-remove" title="Remove Product"><i class="icon-close"></i></button>
                                    </div><!-- End .product -->

                                </div><!-- End .cart-product -->
                                
                                <%} %>
								<%if(cart.size()==0){ %>
                                	<h3 align="center">
										<!-- <span>Cart is empty</span></h3> -->
										<img class="rounded mx-auto d-block" style="width:200px;height:100px;" alt="no product found" src="assets/images/demos/demo-10/empty_cart.png">
                                <%} else{%>
                                <div class="dropdown-cart-total">
                                    <span>Total</span>

                                    <span class="cart-total-price">&#8377;<%=total%></span>
		                        </div><!-- End .dropdown-cart-total -->
								
								<div class="dropdown-cart-action">
                                    <a href="cart.jsp" class="btn btn-primary">View Cart</a>
                                    <a href="checkout.jsp" class="btn btn-outline-primary-2"><span>Checkout</span><i class="icon-long-arrow-right"></i></a>
                                </div><!-- End .dropdown-cart-total -->
                                <%} %>
                            <%
									} else {
								%>
								<h3 align="center">
										<span>Continue login</span></h3>
								<%
									}
								%>
                            </div><!-- End .dropdown-menu -->
                        </div><!-- End .cart-dropdown -->
                    </div><!-- End .header-right -->
                </div><!-- End .container -->
            </div><!-- End .header-middle -->
        </header><!-- End .header -->
</body>
</html>