<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.ProjectConn"%>
<%@page import="java.sql.Connection"%>
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
				
				<%
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
						
						UserDao userdao=new UserDao();
					%>
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
                                <%for(Product p:list2) {%>
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
                                    <%l++; %>
									<%} %>
                                </div><!-- End .row -->
                            </div><!-- End .products -->
							
							<%if(list2.size()==0){ %>
							<!-- <p align="center">No product found</p> -->
							<img class="rounded mx-auto d-block" style="width:400px;height:200px;" alt="no product found" src="assets/images/demos/demo-10/no-product-found.png">
							<%}else if(list2.size()==6){ %>
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
							<%} %>
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
												<%for(Category c:categories) {%>
												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														 <a href="shop.jsp?id=<%=c.getId()%>">
														<%-- <input type="checkbox" class="custom-control-input" id="cat-<%=c.getId()%>"> --%>
														<label class="custom-control-label" for="cat-<%=c.getId()%>"><%=c.getCname()%></label>
														</a>
													</div><!-- End .custom-checkbox -->
													<span class="item-count">
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
													%></span>
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

        <%@include file="footer.jsp" %>
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

		<%
		int b1=1;
	%>
	<%
	 for(Product p:list2) {
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
    <script src="assets/js/wNumb.js"></script>
    <script src="assets/js/bootstrap-input-spinner.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/nouislider.min.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>


<!-- Mirrored from portotheme.com/html/molla/category-4cols.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:21:40 GMT -->
</html>