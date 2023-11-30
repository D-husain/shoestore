<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Reviews"%>
<%@page import="pojo.Product"%>
<html lang="en">
<body>
    <div class="page-wrapper">
        <%@include file="header.jsp" %>

        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">product<span>Shop</span></h1>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav mb-2">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Shop</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->
				
				<%-- <%
					int l=1;
						String cat = request.getParameter("id");
						List<Product> list2 = null;
						if (cat == null || cat.equals("all")) {
							list2 = adao.viewProduct();
						} else {
							Integer cid = Integer.parseInt(cat);
							list2 = adao.viewcategoryById(cid);
						}
						List<Category> clist1 = adao.ShowCategory();
					%> --%>
					
            <div class="page-content">
                <div class="container">
                	<div class="row">
                		<div class="col-lg-9">
                			<div class="toolbox">
                				<div class="toolbox-left">
                					<div class="toolbox-info">
                					</div><!-- End .toolbox-info -->
                				</div><!-- End .toolbox-left -->

                				<div class="toolbox-right">
                					<div class="toolbox-sort">
                						<label for="sortby">Sort by:</label>
                						<div class="select-custom">
											<select name="sortby" id="sortby" class="form-control">
												<option value="popularity" selected="selected">Most Popular</option>
												<option value="rating">Most Rated</option>
												<option value="date">Date</option>
											</select>
										</div>
                					</div><!-- End .toolbox-sort -->
                				</div><!-- End .toolbox-right -->
                			</div><!-- End .toolbox -->

                            <div class="products mb-3">
                                <div class="row ">
								<%	
								int l=1;
									List<Product> products = (List<Product>) session.getAttribute("products");
								%>
								 <% if (products != null && !products.isEmpty()) { %>
								   <% for (Product p : products) { %>
								<div class="col-6 col-md-4 col-lg-4 col-xl-3 p-3">
                                        <div class="product product-7 text-center">
                                            <figure class="product-media">
                                                <span class="product-label label-new">New</span>
                                                <a href="product-detail.jsp?id=<%=p.getId()%>">
                                                    <img src="image/Product/<%=p.getImage1()%>" alt="Product image" class="product-image" >
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
													<button
														class="btn-product-icon btn-wishlist btn-expandable border-0"><span>add
															to wishlist</span></button>
													<%
														} else {
													%>
													<a onclick="return confirmation<%out.print(l);%>()" href="#"
														class="btn-product-icon btn-wishlist btn-expandable"><span>add
															to wishlist</span></a>
													<%
														}
													%>
												</form>
                                                    <!-- <a href="#" class="btn-product-icon btn-wishlist btn-expandable"><span>add to wishlist</span></a> -->
                                                </div><!-- End .product-action-vertical -->

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
														<button class="btn-product btn-cart border-0 "><span>add
																to cart</span>
														</button>
														<%
														 	} else if (ava.equals("no")) {
														%>
														<button style="cursor: no-drop;" disabled class="btn-product btn-cart border-0"><span>OUT OF STOCK</span>
														</button>
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
														
														
														<a class="btn-product btn-cart" onclick="return confirmation<%out.print(l);%>()" href="#" >
														<span>add to cart</span></a>
														
														
														<%
														 	} else if (ava.equals("no")) {
														%>
														<a style="cursor: no-drop;" href="#" class="btn-product btn-cart disabled">
														<span>OUT OF STOCK</span></a>
														<%
														    }
														%> 	
			
														<%
															}
														%>
													</form>
                                                </div><!-- End .product-action -->
                                            </figure><!-- End .product-media -->

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="shop.jsp?id=<%=p.getCategory().getId()%>"><%=p.getCategory().getCname()%></a>
                                                </div><!-- End .product-cat -->
                                                <h3 class="product-title"><a href="product-detail.jsp?id=<%=p.getId()%>"><%=p.getPname()%></a></h3><!-- End .product-title -->
                                                <div class="product-price">
                                                    &#8377;<%=p.getPrice()%>
                                                </div><!-- End .product-price -->
                                                <% 	
                                                	UserDao userdao=new UserDao();
				                                	List<Reviews> relist=userdao.ViewReview(p.getId());
				                                	session.setAttribute("reviews", relist);
				                                %>
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
                                                    <%  int size=relist.size();%>
                                                    <span class="ratings-text">( <% out.print(size);%> Reviews )</span>
                                                </div><!-- End .rating-container -->
                                            </div><!-- End .product-body -->
                                        </div><!-- End .product -->
                                    </div><!-- End .col-sm-6 col-lg-4 col-xl-3 -->
								 <% } %>
								  <%l++; %>
						            <% } else { %>
						                <img class="rounded mx-auto d-block" style="width:400px;height:200px;" alt="no product found" src="assets/images/demos/demo-10/no-product-found.png">
						            <% } %>
								<%-- <%if(products.size()==0){ %>
								<!-- <h1 align="center">No product found</h1> -->
								<img class="rounded mx-auto d-block" style="width:400px;height:200px;" alt="no product found" src="assets/images/demos/demo-10/no-product-found.png">
								<%} %> --%>
							</div><!-- End .row -->
                            </div><!-- End .products -->
							
							<%-- <%if(list2.size()==0){ %>
							<p align="center">No product found</p>
							<%} %>
							<%if(list2.size()==6){ %>
                			<nav aria-label="Page navigation">
							    <ul class="pagination justify-content-center">
							        <li class="page-item disabled">
							            <a class="page-link page-link-prev" href="#" aria-label="Previous" tabindex="-1" aria-disabled="true">
							                <span aria-hidden="true"><i class="icon-long-arrow-left"></i></span>Prev
							            </a>
							        </li>
							        <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
							        <li class="page-item"><a class="page-link" href="#">2</a></li>
							        <li class="page-item"><a class="page-link" href="#">3</a></li>
							        <li class="page-item-total">of 6</li>
							        <li class="page-item">
							            <a class="page-link page-link-next" href="#" aria-label="Next">
							                Next <span aria-hidden="true"><i class="icon-long-arrow-right"></i></span>
							            </a>
							        </li>
							    </ul>
							</nav>
							<%} %> --%>
                		</div><!-- End .col-lg-9 -->
                		<aside class="col-lg-3 order-lg-first">
                			<div class="sidebar sidebar-shop">
                				<div class="widget widget-clean">
                					<label>Filters:</label>
                					<a href="#" class="sidebar-filter-clear">Clean All</a>
                				</div><!-- End .widget widget-clean -->

                				<div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-1" role="button" aria-expanded="true" aria-controls="widget-1">
									        Category
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-1">
										<div class="widget-body">
											<div class="filter-items filter-items-count">
											<%List<Category> categories=adao.ShowCategory(); 
											%>
											 <% int categorysize=categories.size();%>
												<%for(Category c:categories) {%>
												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<!-- <input type="checkbox" class="custom-control-input" id="cat-1"> -->
														<a href="shop.jsp?id=<%=c.getId()%>">
														<label class="custom-control-label" for="cat-1"><%=c.getCname()%></label>
														</a>
													</div><!-- End .custom-checkbox -->
													<%-- <span class="item-count"><% out.print(categorysize);%></span> --%>
												</div><!-- End .filter-item -->
												<%} %>

											</div><!-- End .filter-items -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget -->

                			</div><!-- End .sidebar sidebar-shop -->
                		</aside><!-- End .col-lg-3 -->
                	</div><!-- End .row -->
                </div><!-- End .container -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

        <footer class="footer">
        	<div class="footer-middle">
	            <div class="container">
	            	<div class="row">
	            		<div class="col-sm-6 col-lg-3">
	            			<div class="widget widget-about">
	            				<img src="assets/images/logo.png" class="footer-logo" alt="Footer Logo" width="105" height="25">
	            				<p>Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. </p>

	            				<div class="social-icons">
	            					<a href="#" class="social-icon" target="_blank" title="Facebook"><i class="icon-facebook-f"></i></a>
	            					<a href="#" class="social-icon" target="_blank" title="Twitter"><i class="icon-twitter"></i></a>
	            					<a href="#" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
	            					<a href="#" class="social-icon" target="_blank" title="Youtube"><i class="icon-youtube"></i></a>
	            					<a href="#" class="social-icon" target="_blank" title="Pinterest"><i class="icon-pinterest"></i></a>
	            				</div><!-- End .soial-icons -->
	            			</div><!-- End .widget about-widget -->
	            		</div><!-- End .col-sm-6 col-lg-3 -->

	            		<div class="col-sm-6 col-lg-3">
	            			<div class="widget">
	            				<h4 class="widget-title">Useful Links</h4><!-- End .widget-title -->

	            				<ul class="widget-list">
	            					<li><a href="about.jsp">About Molla</a></li>
	            					<li><a href="#">How to shop on Molla</a></li>
	            					<li><a href="#">FAQ</a></li>
	            					<li><a href="contact.jsp">Contact us</a></li>
	            					<li><a href="login.jsp">Log in</a></li>
	            				</ul><!-- End .widget-list -->
	            			</div><!-- End .widget -->
	            		</div><!-- End .col-sm-6 col-lg-3 -->

	            		<div class="col-sm-6 col-lg-3">
	            			<div class="widget">
	            				<h4 class="widget-title">Customer Service</h4><!-- End .widget-title -->

	            				<ul class="widget-list">
	            					<li><a href="#">Payment Methods</a></li>
	            					<li><a href="#">Money-back guarantee!</a></li>
	            					<li><a href="#">Returns</a></li>
	            					<li><a href="#">Shipping</a></li>
	            					<li><a href="#">Terms and conditions</a></li>
	            					<li><a href="#">Privacy Policy</a></li>
	            				</ul><!-- End .widget-list -->
	            			</div><!-- End .widget -->
	            		</div><!-- End .col-sm-6 col-lg-3 -->

	            		<div class="col-sm-6 col-lg-3">
	            			<div class="widget">
	            				<h4 class="widget-title">My Account</h4><!-- End .widget-title -->

	            				<ul class="widget-list">
	            					<li><a href="#">Sign In</a></li>
	            					<li><a href="cart.jsp">View Cart</a></li>
	            					<li><a href="#">My Wishlist</a></li>
	            					<li><a href="#">Track My Order</a></li>
	            					<li><a href="#">Help</a></li>
	            				</ul><!-- End .widget-list -->
	            			</div><!-- End .widget -->
	            		</div><!-- End .col-sm-6 col-lg-3 -->
	            	</div><!-- End .row -->
	            </div><!-- End .container -->
	        </div><!-- End .footer-middle -->

	        <div class="footer-bottom">
	        	<div class="container">
	        		<p class="footer-copyright">Copyright © 2019 Molla Store. All Rights Reserved.</p><!-- End .footer-copyright -->
	        		<figure class="footer-payments">
	        			<img src="assets/images/payments.png" alt="Payment methods" width="272" height="20">
	        		</figure><!-- End .footer-payments -->
	        	</div><!-- End .container -->
	        </div><!-- End .footer-bottom -->
        </footer><!-- End .footer -->
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

    <!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

    <div class="mobile-menu-container">
        <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="icon-close"></i></span>

            <form action="#" method="get" class="mobile-search">
                <label for="mobile-search" class="sr-only">Search</label>
                <input type="search" class="form-control" name="mobile-search" id="mobile-search" placeholder="Search in..." required>
                <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
            </form>
            
            <nav class="mobile-nav">
                <ul class="mobile-menu">
                    <li class="active">
                        <a href="index.jsp">Home</a>

                        <ul>
                            <li><a href="index-1.jsp">01 - furniture store</a></li>
                            <li><a href="index-2.jsp">02 - furniture store</a></li>
                            <li><a href="index-3.jsp">03 - electronic store</a></li>
                            <li><a href="index-4.jsp">04 - electronic store</a></li>
                            <li><a href="index-5.jsp">05 - fashion store</a></li>
                            <li><a href="index-6.jsp">06 - fashion store</a></li>
                            <li><a href="index-7.jsp">07 - fashion store</a></li>
                            <li><a href="index-8.jsp">08 - fashion store</a></li>
                            <li><a href="index-9.jsp">09 - fashion store</a></li>
                            <li><a href="index-10.jsp">10 - shoes store</a></li>
                            <li><a href="index-11.jsp">11 - furniture simple store</a></li>
                            <li><a href="index-12.jsp">12 - fashion simple store</a></li>
                            <li><a href="index-13.jsp">13 - market</a></li>
                            <li><a href="index-14.jsp">14 - market fullwidth</a></li>
                            <li><a href="index-15.jsp">15 - lookbook 1</a></li>
                            <li><a href="index-16.jsp">16 - lookbook 2</a></li>
                            <li><a href="index-17.jsp">17 - fashion store</a></li>
                            <li><a href="index-18.jsp">18 - fashion store (with sidebar)</a></li>
                            <li><a href="index-19.jsp">19 - games store</a></li>
                            <li><a href="index-20.jsp">20 - book store</a></li>
                            <li><a href="index-21.jsp">21 - sport store</a></li>
                            <li><a href="index-22.jsp">22 - tools store</a></li>
                            <li><a href="index-23.jsp">23 - fashion left navigation store</a></li>
                            <li><a href="index-24.jsp">24 - extreme sport store</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="category.jsp">Shop</a>
                        <ul>
                            <li><a href="category-list.jsp">Shop List</a></li>
                            <li><a href="category-2cols.jsp">Shop Grid 2 Columns</a></li>
                            <li><a href="category.jsp">Shop Grid 3 Columns</a></li>
                            <li><a href="category-4cols.jsp">Shop Grid 4 Columns</a></li>
                            <li><a href="category-boxed.jsp"><span>Shop Boxed No Sidebar<span class="tip tip-hot">Hot</span></span></a></li>
                            <li><a href="category-fullwidth.jsp">Shop Fullwidth No Sidebar</a></li>
                            <li><a href="product-category-boxed.jsp">Product Category Boxed</a></li>
                            <li><a href="product-category-fullwidth.jsp"><span>Product Category Fullwidth<span class="tip tip-new">New</span></span></a></li>
                            <li><a href="cart.jsp">Cart</a></li>
                            <li><a href="checkout.jsp">Checkout</a></li>
                            <li><a href="wishlist.jsp">Wishlist</a></li>
                            <li><a href="#">Lookbook</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="product.jsp" class="sf-with-ul">Product</a>
                        <ul>
                            <li><a href="product.jsp">Default</a></li>
                            <li><a href="product-centered.jsp">Centered</a></li>
                            <li><a href="product-extended.jsp"><span>Extended Info<span class="tip tip-new">New</span></span></a></li>
                            <li><a href="product-gallery.jsp">Gallery</a></li>
                            <li><a href="product-sticky.jsp">Sticky Info</a></li>
                            <li><a href="product-sidebar.jsp">Boxed With Sidebar</a></li>
                            <li><a href="product-fullwidth.jsp">Full Width</a></li>
                            <li><a href="product-masonry.jsp">Masonry Sticky Info</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Pages</a>
                        <ul>
                            <li>
                                <a href="about.jsp">About</a>

                                <ul>
                                    <li><a href="about.jsp">About 01</a></li>
                                    <li><a href="about-2.jsp">About 02</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="contact.jsp">Contact</a>

                                <ul>
                                    <li><a href="contact.jsp">Contact 01</a></li>
                                    <li><a href="contact-2.jsp">Contact 02</a></li>
                                </ul>
                            </li>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="faq.jsp">FAQs</a></li>
                            <li><a href="404.jsp">Error 404</a></li>
                            <li><a href="coming-soon.jsp">Coming Soon</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="blog.jsp">Blog</a>

                        <ul>
                            <li><a href="blog.jsp">Classic</a></li>
                            <li><a href="blog-listing.jsp">Listing</a></li>
                            <li>
                                <a href="#">Grid</a>
                                <ul>
                                    <li><a href="blog-grid-2cols.jsp">Grid 2 columns</a></li>
                                    <li><a href="blog-grid-3cols.jsp">Grid 3 columns</a></li>
                                    <li><a href="blog-grid-4cols.jsp">Grid 4 columns</a></li>
                                    <li><a href="blog-grid-sidebar.jsp">Grid sidebar</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Masonry</a>
                                <ul>
                                    <li><a href="blog-masonry-2cols.jsp">Masonry 2 columns</a></li>
                                    <li><a href="blog-masonry-3cols.jsp">Masonry 3 columns</a></li>
                                    <li><a href="blog-masonry-4cols.jsp">Masonry 4 columns</a></li>
                                    <li><a href="blog-masonry-sidebar.jsp">Masonry sidebar</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Mask</a>
                                <ul>
                                    <li><a href="blog-mask-grid.jsp">Blog mask grid</a></li>
                                    <li><a href="blog-mask-masonry.jsp">Blog mask masonry</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Single Post</a>
                                <ul>
                                    <li><a href="single.jsp">Default with sidebar</a></li>
                                    <li><a href="single-fullwidth.jsp">Fullwidth no sidebar</a></li>
                                    <li><a href="single-fullwidth-sidebar.jsp">Fullwidth with sidebar</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="elements-list.jsp">Elements</a>
                        <ul>
                            <li><a href="elements-products.jsp">Products</a></li>
                            <li><a href="elements-typography.jsp">Typography</a></li>
                            <li><a href="elements-titles.jsp">Titles</a></li>
                            <li><a href="elements-banners.jsp">Banners</a></li>
                            <li><a href="elements-product-category.jsp">Product Category</a></li>
                            <li><a href="elements-video-banners.jsp">Video Banners</a></li>
                            <li><a href="elements-buttons.jsp">Buttons</a></li>
                            <li><a href="elements-accordions.jsp">Accordions</a></li>
                            <li><a href="elements-tabs.jsp">Tabs</a></li>
                            <li><a href="elements-testimonials.jsp">Testimonials</a></li>
                            <li><a href="elements-blog-posts.jsp">Blog Posts</a></li>
                            <li><a href="elements-portfolio.jsp">Portfolio</a></li>
                            <li><a href="elements-cta.jsp">Call to Action</a></li>
                            <li><a href="elements-icon-boxes.jsp">Icon Boxes</a></li>
                        </ul>
                    </li>
                </ul>
            </nav><!-- End .mobile-nav -->

            <div class="social-icons">
                <a href="#" class="social-icon" target="_blank" title="Facebook"><i class="icon-facebook-f"></i></a>
                <a href="#" class="social-icon" target="_blank" title="Twitter"><i class="icon-twitter"></i></a>
                <a href="#" class="social-icon" target="_blank" title="Instagram"><i class="icon-instagram"></i></a>
                <a href="#" class="social-icon" target="_blank" title="Youtube"><i class="icon-youtube"></i></a>
            </div><!-- End .social-icons -->
        </div><!-- End .mobile-menu-wrapper -->
    </div><!-- End .mobile-menu-container -->

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
    <script src="assets/js/wNumb.js"></script>
    <script src="assets/js/bootstrap-input-spinner.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/nouislider.min.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>


<!-- Mirrored from portotheme.com/html/molla/category-4cols.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:21:40 GMT -->
</html>