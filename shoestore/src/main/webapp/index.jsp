<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ProjectConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="pojo.Slider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Reviews"%>
<%@page import="pojo.Product"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<style type="text/css">
.trans:hover {
	transform: scale(1.2, 1.2);
}

.trans {
	overflow: hidden;
	transition: transform 0.7s;
	transition-timing-function: cubic-bezier(0.4, 0, 1, 1);
}
.trans2:hover{
	transform: scale(1.1, 1.1);
}
.trans2 {
	overflow: hidden;
	transition: transform 0.4s;
	transition-timing-function: cubic-bezier(0.4, 0, 1, 1);
}
.cen{
	background-color: red;
	display: flex;
	display: block;
	justify-content: center;
}
</style>
</head>
<body>
    <div class="page-wrapper">
    
        <%@include file="header.jsp" %>
		<%
	    	List<Slider> slider=adao.viewSlider();
		%>
        <main class="main">
            <div class="container">
                <div class="intro-slider-container slider-container-ratio mb-2">
                    <div class="intro-slider owl-carousel owl-simple owl-light owl-nav-inside" data-toggle="owl" data-owl-options='{"nav": false}'>
                        <%for(Slider s:slider){ %>
                        <div class="intro-slide">
                            <figure class="slide-image">
                                <picture class="trans">
                                    <source media="(max-width: 480px)" srcset="image/Product/<%=s.getImage()%>">
                                    <img src="image/Product/<%=s.getImage()%>" alt="Image Desc">
                                </picture>
                            </figure><!-- End .slide-image -->
						<div class="intro-content">
                                <h3 class="intro-subtitle"><%=s.getTital()%></h3><!-- End .h3 intro-subtitle -->
                                <h1 class="intro-title text-white"><%=s.getContent()%></h1><!-- End .intro-title -->

                                <div class="intro-price text-white"></div><!-- End .intro-price -->

                                <a href="shop.jsp?id=<%=s.getCategory().getId()%>" class="btn btn-white-primary btn-round">
                                    <span>SHOP NOW</span>
                                    <i class="icon-long-arrow-right"></i>
                                </a>
                            </div><!-- End .intro-content -->
                        </div><!-- End .intro-slide -->
						<%} %>
                    </div><!-- End .intro-slider owl-carousel owl-simple -->
                    <span class="slider-loader"></span><!-- End .slider-loader -->
                </div><!-- End .intro-slider-container -->
            </div><!-- End .container -->

            <div class="banner-group">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="banner banner-overlay">
                                        <a href="coming-soon.jsp">
                                            <img src="assets/images/demos/demo-10/banners/banner-1.jpg" alt="Banner">
                                        </a>

                                        <div class="banner-content banner-content-right">
                                            <h4 class="banner-subtitle"><a href="coming-soon.jsp">New Arrivals</a></h4><!-- End .banner-subtitle -->
                                            <h3 class="banner-title text-white"><a href="coming-soon.jsp">Sneakers & <br>Athletic Shoes</a></h3><!-- End .banner-title -->
                                            <a href="coming-soon.jsp" class="btn btn-outline-white banner-link btn-round">Discover Now</a>
                                        </div><!-- End .banner-content -->
                                    </div><!-- End .banner -->
                                </div><!-- End .col-sm-6 -->

                                <div class="col-sm-6">
                                    <div class="banner banner-overlay banner-overlay-light">
                                        <a href="coming-soon.jsp">
                                            <img src="assets/images/demos/demo-10/banners/banner-2.jpg" alt="Banner">
                                        </a>

                                        <div class="banner-content">
                                            <h4 class="banner-subtitle bright-black"><a href="coming-soon.jsp">Clearance</a></h4><!-- End .banner-subtitle -->
                                            <h3 class="banner-title"><a href="coming-soon.jsp">Sandals</a></h3><!-- End .banner-title -->
                                            <div class="banner-text"><a href="coming-soon.jsp">up to 70% off</a></div><!-- End .banner-text -->
                                            <a href="coming-soon.jsp" class="btn btn-outline-gray banner-link btn-round">Shop Now</a>
                                        </div><!-- End .banner-content -->
                                    </div><!-- End .banner -->
                                </div><!-- End .col-sm-6 -->
                            </div><!-- End .row -->

                            <div class="banner banner-large banner-overlay d-none d-sm-block">
                                <a href="coming-soon.jsp">
                                    <img src="assets/images/demos/demo-10/banners/banner-3.jpg" alt="Banner">
                                </a>

                                <div class="banner-content">
                                    <h4 class="banner-subtitle text-white"><a href="coming-soon.jsp">On Sale</a></h4><!-- End .banner-subtitle -->
                                    <h3 class="banner-title text-white"><a href="coming-soon.jsp">Slip-On Loafers</a></h3><!-- End .banner-title -->
                                    <div class="banner-text text-white"><a href="coming-soon.jsp">up to 30% off</a></div><!-- End .banner-text -->
                                    <a href="coming-soon.jsp" class="btn btn-outline-white banner-link btn-round">Shop Now</a>
                                </div><!-- End .banner-content -->
                            </div><!-- End .banner -->
                        </div><!-- End .col-lg-8 -->

                        <div class="col-lg-4 d-sm-none d-lg-block">
                            <div class="banner banner-middle banner-overlay">
                                <a href="#">
                                    <img src="assets/images/demos/demo-10/banners/banner-4.jpg" alt="Banner">
                                </a>

                                <div class="banner-content banner-content-bottom">
                                    <h4 class="banner-subtitle text-white"><a href="#">On Sale</a></h4><!-- End .banner-subtitle -->
                                    <h3 class="banner-title text-white"><a href="#">Amazing <br>Lace Up Boots</a></h3><!-- End .banner-title -->
                                    <div class="banner-text text-white"><a href="#">from $39.00</a></div><!-- End .banner-text -->
                                    <a href="#" class="btn btn-outline-white banner-link btn-round">Discover Now</a>
                                </div><!-- End .banner-content -->
                            </div><!-- End .banner -->
                        </div><!-- End .col-lg-4 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .banner-group -->

            <div class="icon-boxes-container icon-boxes-separator bg-transparent">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-primary">
                                    <i class="icon-rocket"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Free Shipping</h3><!-- End .icon-box-title -->
                                    <p>Orders $50 or more</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->
                        
                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-primary">
                                    <i class="icon-rotate-left"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Free Returns</h3><!-- End .icon-box-title -->
                                    <p>Within 30 days</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-primary">
                                    <i class="icon-info-circle"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">Get 20% Off 1 Item</h3><!-- End .icon-box-title -->
                                    <p>when you sign up</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->

                        <div class="col-sm-6 col-lg-3">
                            <div class="icon-box icon-box-side">
                                <span class="icon-box-icon text-primary">
                                    <i class="icon-life-ring"></i>
                                </span>

                                <div class="icon-box-content">
                                    <h3 class="icon-box-title">We Support</h3><!-- End .icon-box-title -->
                                    <p>24/7 amazing services</p>
                                </div><!-- End .icon-box-content -->
                            </div><!-- End .icon-box -->
                        </div><!-- End .col-sm-6 col-lg-3 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .icon-boxes-container -->
				<%
					int l=1;
					String cat = request.getParameter("id");
					List<Product> productlist = null;
					if (cat == null || cat.equals("all")) {
						productlist = adao.viewProduct();
					} else {
						Integer cid = Integer.parseInt(cat);
						productlist = adao.viewcategoryById(cid);
					}
					List<Category> clist1 = adao.ShowCategory();
					
					UserDao userdao=new UserDao();
				%>
            <div class="bg-light pt-5 pb-10 mb-3">
                <div class="container">
                    <div class="heading heading-center mb-3">
                        <h2 class="title-lg">New Arrivals</h2><!-- End .title -->
                        <ul class="nav nav-pills justify-content-center" role="tablist">
                        </ul>
                    </div><!-- End .heading -->

                    <div class="tab-content tab-content-carousel">
                        <div class="tab-pane tab-pane-shadow p-0 fade show active" id="new-all-tab" role="tabpanel" aria-labelledby="new-all-link">
                            <div class="owl-carousel owl-simple carousel-equal-height" data-toggle="owl" 
                                data-owl-options='{
                                    "nav": false, 
                                    "dots": true,
                                    "margin": 0,
                                    "loop": false,
                                    "responsive": {
                                        "0": {
                                            "items":2
                                        },
                                        "480": {
                                            "items":2
                                        },
                                        "768": {
                                            "items":3
                                        },
                                        "992": {
                                            "items":4
                                        },
                                        "1200": {
                                            "items":4,
                                            "nav": true
                                        }
                                    }
                                }'>
                                <%for(Product p:productlist) {%>
                                <% 
                                	
                                List<Reviews> relist=userdao.ViewReview(p.getId());
                                session.setAttribute("reviews", relist);
                                
                                %>
                                <% int size=relist.size();%>
                                <div class="product product-3 text-center">
                                    <figure class="product-media">
                                        <span class="product-label label-primary">Sale</span>
                                        <a href="product.jsp">
                                            <img src="image/Product/<%=p.getImage1()%>" alt="Product image" class="product-image">
                                        </a>

                                        <div class="product-action-vertical">
                                        <form action="AddWishlist" method="post">
                                        	<input type="hidden" name="pname" value="<%=p.getPname()%>">
										    <input type="hidden" name="price" value="<%=p.getPrice()%>">
										    <input type="hidden" name="pid" value="<%=p.getId()%>">
											<%
												if (user != null) {
											%>
												<input type="hidden" name="id" value="<%=user.getId()%>"> 
											<button class="btn-product-icon btn-wishlist btn-expandable border-0">
											<span>add to wishlist</span></button>
											<%
												} else {
											%>
											<a onclick="return confirmation<%out.print(l);%>()" href="#" class="btn-product-icon btn-wishlist btn-expandable">
											<span>add to wishlist</span></a>
											<%
												}
											%>
										</form>
                                        </div><!-- End .product-action-vertical -->
                                        
                                    </figure><!-- End .product-media -->

                                    <div class="product-body">
                                        <div class="product-cat">
                                            <a href="shop.jsp"><%=p.getCategory().getCname()%></a>
                                        </div><!-- End .product-cat -->
                                        <h3 class="product-title"><a href="product-detail.jsp?id=<%=p.getId()%>"><%=p.getPname()%></a></h3><!-- End .product-title -->
                                        <div class="product-price">
                                            <span class="new-price">Now &#8377;<%=p.getPrice()%></span>
                                            <span class="old-price">&#8377;<%=p.getDprice()%></span>
                                        </div><!-- End .product-price -->
                                    </div><!-- End .product-body -->
                                   <%
										ArrayList<Reviews> reviewsList = (ArrayList<Reviews>) session.getAttribute("reviews");
												
								        if (reviewsList != null && !reviewsList.isEmpty()) {
										Reviews firstReview = reviewsList.get(0); // Get the first review (you can change the index as needed)
										Integer ratee = firstReview.getRating();
										pageContext.setAttribute("rate", ratee);
										}
								   %>
								   <%
										String ratess = (pageContext.getAttribute("rate") != null) ? pageContext.getAttribute("rate").toString() : "";
								   %>
                                    <div class="product-footer">
                                        <div class="ratings-container">
                                            <div class="ratings">
                                                <%
													if (ratess.equals("1")) {
												%>
													<div class="ratings-val" style="width: 20%;"></div>
												<%
													} else if (ratess.equals("2")) {
												%>
													<div class="ratings-val" style="width: 40%;"></div>
												<%
													} else if (ratess.equals("3")) {
												%>
													<div class="ratings-val" style="width: 60%;"></div>
												<%
													} else if (ratess.equals("4")) {
												%>
													<div class="ratings-val" style="width: 80%;"></div>
												<%
													} else if (ratess.equals("5")) {
												%>
													<div class="ratings-val" style="width: 100%;"></div>
												<%
													}
												%>
                                            </div><!-- End .ratings -->
                                            <span class="ratings-text">( <% out.print(size);%> Reviews )</span>
                                        </div><!-- End .rating-container -->

                                        <div class="product-action">
	                                        <form action="AddCart" method="post">
	                                        <input type="hidden" name="pname" value="<%=p.getPname()%>"> 
	                                        <input type="hidden" name="price" value="<%=p.getPrice()%>"> 
	                                        <input type="hidden" name="pid" value="<%=p.getId()%>"> 
	                                        <input type="hidden" name="qty" value="1">
	                                        <input type="hidden" name="size" value="<%=p.getSize()%>">
											<%
												if (user != null) {
											%>
											<!--------------------- Stock ------------------->
											<%
											    String availability =p.getAvailability();
											    pageContext.setAttribute("ava", availability);
											%> 
											<%
			 									String ava = (String) pageContext.getAttribute("ava");
			 								%> 
			 								<%
											 	if (ava.equals("yes")) {
											%>
											<button style="margin: 0 80px;" class="btn-product btn-cart border-0"><span>add
													to cart</span>
											</button>
											<%
											 	} else if (ava.equals("no")) {
											%>
											<button style="cursor: no-drop; margin: 0 80px;" disabled class="btn-product btn-cart border-0"><span>OUT OF STOCK</span></button>
											<%
											    }
											%> 	
											
											<!--------------------- Stock ------------------->
											
											<input type="hidden" name="id" value="<%=user.getId()%>"> 
											<%
												} else {
											%>
											<%
											    String availability =p.getAvailability();
											    pageContext.setAttribute("ava", availability);
											%> 
											<%
			 									String ava = (String) pageContext.getAttribute("ava");
											%> 
											<%
											 	if (ava.equals("yes")) {
											%>
												<a style="margin: 0 80px;" class="btn-product btn-cart" onclick="return confirmation<%out.print(l);%>()" href="#" >
												<span>add to cart</span></a>
											<%
											 	} else if (ava.equals("no")) {
											%>
												<a style="cursor: no-drop; display: block; margin: 0 80px;" class="btn-product btn-cart disabled" >
												<span>OUT OF STOCK</span></a>
											<%
											    }}
											%> 	
										</form>
                                        </div><!-- End .product-action -->
                                    </div><!-- End .product-footer -->
                                </div><!-- End .product -->
                                <%l++;%>
                                <%} %>

                            </div><!-- End .owl-carousel -->
                        </div><!-- .End .tab-pane -->
                    </div><!-- End .tab-content -->
                </div><!-- End .container -->
            </div><!-- End .bg-light -->
            
			<%
				List<Category> clist=adao.ShowCategory();
			%>
            <div class="container">
                <div class="row justify-content-center">
                	<%
                	for(Category c:clist){
                	%>
                    <div class="col-sm-6 col-md-4">
                        <div class="banner banner-cat">
                            <a href="shop.jsp?id=<%=c.getId()%>">
                                <img src="image/Product/<%=c.getCimage()%>" alt="Banner">
                            </a>

                            <div class="banner-content banner-content-overlay text-center">
                                <h3 class="banner-title font-weight-normal"><%=c.getCname()%></h3><!-- End .banner-title -->
                                <h4 class="banner-subtitle">
								<%
									int a = c.getId();
										try {
											Connection con = ProjectConn.createConnection();
											String strQuery = "SELECT COUNT(cid) FROM product WHERE cid = ?";
											PreparedStatement ps = con.prepareStatement(strQuery);
											ps.setInt(1, a);
											ResultSet rs = ps.executeQuery();
											String countRow = "";
											while (rs.next()) {
												countRow = rs.getString(1);
												out.println(countRow);
											}
											rs.close();
											ps.close();
											con.close();
										} catch (Exception e) {
											e.printStackTrace();
										}
								%>
								Products</h4>
                                <a href="shop.jsp?id=<%=c.getId()%>" class="banner-link">SHOP NOW</a>
                            </div><!-- End .banner-content -->
                        </div><!-- End .banner -->
                    </div><!-- End .col-md-4 -->
					<%} %>
                </div><!-- End .row -->
            </div><!-- End .container -->

            <div class="mb-4"></div><!-- End .mb-4 -->

            <div class="container">
                <div class="heading heading-center mb-3">
                    <h2 class="title-lg mb-2">Top Selling Products</h2><!-- End .title-lg text-center -->
                    <ul class="nav nav-pills justify-content-center" role="tablist">
                    </ul>
                </div><!-- End .heading -->

                <div class="tab-content">
				<div class="tab-pane p-0 fade show active" id="top-all-tab"
					role="tabpanel" aria-labelledby="top-all-link">
					<div class="products just-action-icons-sm">
						<div class="row" id="productRow">
							<%
								int pro=1;
								int numProductsToShow = 10;
							%>
							<%
								for (int i = 0; i < Math.min(productlist.size(), numProductsToShow); i++) {
									Product p = productlist.get(i);
									 List<Reviews> relist=userdao.ViewReview(p.getId());   
							%>
							<% int size=relist.size();%>
							<div class="col-6 col-md-4 col-lg-3 col-xl-5col">
								<div class="product product-3 text-center">
									<figure class="product-media">
										<span class="product-label label-primary">Sale</span>
										<a href="product-detail.jsp?id=<%=p.getId()%>"> <img
											src="image/Product/<%=p.getImage1()%>" alt="Product image"
											class="product-image">
										</a>

										<div class="product-action-vertical">
                                        <form action="AddWishlist" method="post">
                                        	<input type="hidden" name="pname" value="<%=p.getPname()%>">
										    <input type="hidden" name="price" value="<%=p.getPrice()%>">
										    <input type="hidden" name="pid" value="<%=p.getId()%>">
											<%
												if (user != null) {
											%>
												<input type="hidden" name="id" value="<%=user.getId()%>"> 
											<button class="btn-product-icon btn-wishlist btn-expandable border-0">
											<span>add to wishlist</span></button>
											<%
												} else {
											%>
											<a onclick="return confirmation<%out.print(pro);%>()" href="#" class="btn-product-icon btn-wishlist btn-expandable">
											<span>add to wishlist</span></a>
											<%
												}
											%>
										</form>
                                        </div><!-- End .product-action-vertical -->
										<!-- End .product-action-vertical -->
									</figure>
									<!-- End .product-media -->

									<div class="product-body">
										<div class="product-cat">
											<a href="shop.jsp?id=<%=p.getCategory().getId()%>"><%=p.getCategory().getCname()%></a>
										</div>
										<!-- End .product-cat -->
										<h3 class="product-title">
											<a href="product-detail.jsp?id=<%=p.getId()%>"><%=p.getPname()%></a>
										</h3>
										<!-- End .product-title -->
										<div class="product-price">
											<span class="new-price">Now &#8377;<%=p.getPrice()%></span> <span class="old-price">&#8377;<%=p.getDprice()%></span>
										</div>
										<!-- End .product-price -->
									</div>
									<!-- End .product-body -->

									<div class="product-footer">
										<div class="ratings-container">
											<div class="ratings">
												<div class="ratings-val" style="width: 60%;"></div>
												<!-- End .ratings-val -->
											</div>
											<!-- End .ratings -->
											<span class="ratings-text">( <% out.print(size);%> Reviews )</span>
										</div>
										<!-- End .rating-container -->

										<div class="product-action">
										<form action="AddCart" method="post">
                                        <input type="hidden" name="pname" value="<%=p.getPname()%>"> 
                                        <input type="hidden" name="price" value="<%=p.getPrice()%>"> 
                                        <input type="hidden" name="pid" value="<%=p.getId()%>"> 
                                        <input type="hidden" name="qty" value="1">
                                        <input type="hidden" name="size" value="<%=p.getSize()%>">
											<%
												if (user != null) {
											%>
											<!--------------------- Stock ------------------->
											<%
											    String availability =p.getAvailability();
											    pageContext.setAttribute("ava", availability);
											%> 
											<%
			 									String ava = (String) pageContext.getAttribute("ava");
			 								%> 
			 								<%
											 	if (ava.equals("yes")) {
											%>
											<input type="hidden" name="id" value="<%=user.getId()%>">
											<button class="btn-product btn-cart border-0 "><p>add to cart</p></button>
											<%
											 	} else if (ava.equals("no")) {
											%>
											<button style="cursor: no-drop;" disabled class="btn-product btn-cart border-0"><p>OUT OF STOCK</p></button>
											<%
											    }
											%> 	
											
											<!--------------------- Stock ------------------->
											
											<%
												} else {
											%>
											<%
											    String availability =p.getAvailability();
											    pageContext.setAttribute("ava", availability);
											%> 
											<%
			 									String ava = (String) pageContext.getAttribute("ava");
			 								%> 
											<%
											 	if (ava.equals("yes")) {
											%>
											<a class="btn-product btn-cart" onclick="return confirmation<%out.print(pro);%>()" href="#" >
											<p>add to cart</p></a>
											
											
											<%
											 	} else if (ava.equals("no")) {
											%>
											<a style="cursor: no-drop;" class="btn-product btn-cart disabled">
											<p>OUT OF STOCK</p></a>
											<%
											    }}
											%> 	
										</form>
										</div>
										<!-- End .product-action -->
									</div>
									<!-- End .product-footer -->
								</div>
								<!-- End .product -->
							</div>
							<!-- End .col-6 col-md-4 col-lg-3 -->
							<%pro++; %>
							<%
								}
							%>
						</div>
						<!-- End .row -->
					</div>
					<!-- End .products -->
				</div>
				<!-- .End .tab-pane -->
                </div><!-- End .tab-content -->

                <div class="more-container text-center mt-5">
                    <a href="shop.jsp" class="btn btn-outline-lightgray btn-more btn-round"><span>View more products</span><i class="icon-long-arrow-right"></i></a>
                </div><!-- End .more-container -->
            </div><!-- End .container -->

            <div class="mb-5"></div><!-- End .mb5 -->

            <div class="container" style="overflow: hidden;">
                <div class="cta cta-horizontal cta-horizontal-box bg-image mb-4 mb-lg-6 trans2" style="background-image: url(assets/images/demos/demo-10/bg-1.jpg);">
                    <div class="row flex-column flex-lg-row align-items-lg-center">
                        <div class="col">
                            <h3 class="cta-title text-primary">New Deals! Start Daily at 12pm e.t.</h3><!-- End .cta-title -->
                            <p class="cta-desc">Get <em class="font-weight-medium">FREE SHIPPING* & 5% rewards</em> on every order with Molla Theme rewards program</p><!-- End .cta-desc -->
                        </div><!-- End .col -->
                        
                    </div><!-- End .row -->
                </div><!-- End .cta-horizontal -->
            </div><!-- End .container -->

            <div class="blog-posts">
                <div class="container">
                    <h2 class="title-lg text-center mb-4">From Our Blog</h2><!-- End .title-lg text-center -->

                    <div class="owl-carousel owl-simple mb-4" data-toggle="owl" 
                        data-owl-options='{
                            "nav": false, 
                            "dots": true,
                            "items": 3,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":1
                                },
                                "520": {
                                    "items":2
                                },
                                "768": {
                                    "items":3
                                },
                                "992": {
                                    "items":4
                                }
                            }
                        }'>
                        <article class="entry">
                            <figure class="entry-media">
                                <a href="single.jsp">
                                    <img src="assets/images/demos/demo-10/blog/post-1.jpg" alt="image desc">
                                </a>
                            </figure><!-- End .entry-media -->

                            <div class="entry-body text-center">
                                <div class="entry-meta">
                                    <a href="#">Nov 22, 2018</a>, 0 Comments
                                </div><!-- End .entry-meta -->

                                <h3 class="entry-title">
                                    <a href="single.jsp">Sed adipiscing ornare.</a>
                                </h3><!-- End .entry-title -->

                                <div class="entry-content">
                                    <p>Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. </p> 
                                    <a href="single.jsp" class="read-more">READ MORE</a>
                                </div><!-- End .entry-content -->
                            </div><!-- End .entry-body -->
                        </article><!-- End .entry -->
                    
                        <article class="entry">
                            <figure class="entry-media">
                                <a href="single.jsp">
                                    <img src="assets/images/demos/demo-10/blog/post-2.jpg" alt="image desc">
                                </a>
                            </figure><!-- End .entry-media -->

                            <div class="entry-body text-center">
                                <div class="entry-meta">
                                    <a href="#">Dec 12, 2018</a>, 0 Comments
                                </div><!-- End .entry-meta -->

                                <h3 class="entry-title">
                                    <a href="single.jsp">Fusce lacinia arcuet nulla.</a>
                                </h3><!-- End .entry-title -->

                                <div class="entry-content">
                                    <p>Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. </p>
                                    <a href="single.jsp" class="read-more">READ MORE</a>
                                </div><!-- End .entry-content -->
                            </div><!-- End .entry-body -->
                        </article><!-- End .entry -->

                        <article class="entry">
                            <figure class="entry-media">
                                <a href="single.jsp">
                                    <img src="assets/images/demos/demo-10/blog/post-3.jpg" alt="image desc">
                                </a>
                            </figure><!-- End .entry-media -->

                            <div class="entry-body text-center">
                                <div class="entry-meta">
                                    <a href="#">Dec 19, 2018</a>, 2 Comments
                                </div><!-- End .entry-meta -->

                                <h3 class="entry-title">
                                    <a href="single.jsp">Aliquam erat volutpat.</a>
                                </h3><!-- End .entry-title -->

                                <div class="entry-content">
                                    <p>Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. </p>
                                    <a href="single.jsp" class="read-more">READ MORE</a>
                                </div><!-- End .entry-content -->
                            </div><!-- End .entry-body -->
                        </article><!-- End .entry -->

                        <article class="entry">
                            <figure class="entry-media">
                                <a href="single.jsp">
                                    <img src="assets/images/demos/demo-10/blog/post-4.jpg" alt="image desc">
                                </a>
                            </figure><!-- End .entry-media -->

                            <div class="entry-body text-center">
                                <div class="entry-meta">
                                    <a href="#">Dec 19, 2018</a>, 2 Comments
                                </div><!-- End .entry-meta -->

                                <h3 class="entry-title">
                                    <a href="single.jsp">Quisque a lectus.</a>
                                </h3><!-- End .entry-title -->

                                <div class="entry-content">
                                    <p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. </p>
                                    <a href="single.jsp" class="read-more">READ MORE</a>
                                </div><!-- End .entry-content -->
                            </div><!-- End .entry-body -->
                        </article><!-- End .entry -->
                    </div><!-- End .owl-carousel -->

                    <div class="more-container text-center mt-1">
                        <a href="single.jsp" class="btn btn-outline-lightgray btn-more btn-round"><span>View more articles</span><i class="icon-long-arrow-right"></i></a>
                    </div><!-- End .more-container -->
                </div><!-- End .container -->
            </div><!-- End .blog-posts -->
        </main><!-- End .main -->
        
         
         <div class="cta bg-image bg-dark pt-4 pb-5 mb-0" style="background-image: url(assets/images/demos/demo-10/bg-2.jpg);">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-sm-10 col-md-8 col-lg-6">
                            <div class="cta-heading text-center">
                                <h3 class="cta-title text-white">Subscribe for Our Newsletter</h3><!-- End .cta-title -->
                                <p class="cta-desc text-white">and receive <span class="font-weight-normal">$20 coupon</span> for first shopping</p><!-- End .cta-desc -->
                            </div><!-- End .text-center -->
						<form action="UserSubscribe" method="post">
						<%
							if(user == null) {
						%>
							<div class="input-group input-group-round">
								<input type="email" name="email" class="form-control form-control-white" placeholder="Enter your Email Address" aria-label="Email Adress" required>
								<div class="input-group-append">
									<a onclick="return confirmationsub()" href="#" class="btn btn-white" type="submit">
										<span>Subscribe</span><i class="icon-long-arrow-right"></i>
									</a>
								</div>
								<!-- .End .input-group-append -->
							</div>
							<!-- .End .input-group -->
						
						<%
							} else {
						%>
							<div class="input-group input-group-round">
								<input type="hidden" name="id" value="<%=user.getId()%>">
								<input type="email" name="email" class="form-control form-control-white" placeholder="Enter your Email Address" aria-label="Email Adress" required>
								<div class="input-group-append">
									<button class="btn btn-white" type="submit">
										<span>Subscribe</span><i class="icon-long-arrow-right"></i>
									</button>
								</div>
								<!-- .End .input-group-append -->

							</div>
							<!-- .End .input-group -->
						<%
							}
						%>
						</form>
					</div><!-- End .col-sm-10 col-md-8 col-lg-6 -->
                    </div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .cta -->
          
                 
                                   
    <%@include file="footer.jsp" %>
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

    <!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

    <%@include file="mobile-menu.jsp" %>

    <!-- <div class="container newsletter-popup-container mfp-hide" id="newsletter-popup-form">
        <div class="row justify-content-center">
            <div class="col-10">
                <div class="row no-gutters bg-white newsletter-popup-content">
                    <div class="col-xl-3-5col col-lg-7 banner-content-wrap">
                        <div class="banner-content text-center">
                            <img src="assets/images/popup/newsletter/logo.png" class="logo" alt="logo" width="60" height="15">
                            <h2 class="banner-title">get <span>25<light>%</light></span> off</h2>
                            <p>Subscribe to the Molla eCommerce newsletter to receive timely updates from your favorite products.</p>
                            <form action="#">
                                <div class="input-group input-group-round">
                                    <input type="email" class="form-control form-control-white" placeholder="Your Email Address" aria-label="Email Adress" required>
                                    <div class="input-group-append">
                                        <button class="btn" type="submit"><span>go</span></button>
                                    </div>.End .input-group-append
                                </div>.End .input-group
                            </form>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="register-policy-2" required>
                                <label class="custom-control-label" for="register-policy-2">Do not show this popup again</label>
                            </div>End .custom-checkbox
                        </div>
                    </div>
                    <div class="col-xl-2-5col col-lg-5 ">
                        <img src="assets/images/popup/newsletter/img-1.jpg" class="newsletter-img" alt="newsletter">
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    
    <%
		int b1=1;
	%>
	<%
		for (Product p : productlist) {
	%>
	<script type="text/javascript">
	function confirmation<%out.print(b1);%>() {
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
		title: '<p style="font-size:15px;">Please First <a href="login.jsp">Login</a></p>'
		})}
	</script>
	<%
		b1++;
	%>
	<%
		}
	%>
	
	<script type="text/javascript">
	function confirmationsub() {
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
		title: '<p style="font-size:15px;">Please First <a href="login.jsp">Login</a></p>'
		})}
	</script>
    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/jquery.hoverIntent.min.js"></script>
    <script src="assets/js/jquery.waypoints.min.js"></script>
    <script src="assets/js/superfish.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/bootstrap-input-spinner.js"></script>
    <script src="assets/js/jquery.plugin.min.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/demos/demo-10.js"></script>
    
</body>


<!-- Mirrored from portotheme.com/html/molla/index-10.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:17:10 GMT -->
</html>