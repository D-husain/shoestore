<!DOCTYPE html>
<%@page import="pojo.Product"%>
<%@page import="pojo.Wishlist"%>
<%@page import="dao.UserDao"%>
<html lang="en">

<body>
    <div class="page-wrapper">
        <%@include file="header.jsp" %>

        <main class="main">
        	<div class="page-header text-center" style="background-image: url('assets/images/page-header-bg.jpg')">
        		<div class="container">
        			<h1 class="page-title">Wishlist<span>Shop</span></h1>
        		</div><!-- End .container -->
        	</div><!-- End .page-header -->
            <nav aria-label="breadcrumb" class="breadcrumb-nav">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Wishlist</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
            	<div class="container">
            	<%if(user !=null) {%>
					<table class="table table-wishlist table-mobile">
						<thead>
							<tr>
								<th>Product</th>
								<th>Price</th>
								<th>Stock Status</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
							<%
								int ws=1;
								UserDao udao=new UserDao();
								List<Wishlist> wlist=udao.showwishlist(user.getId());
							%>
						<tbody>
							<%for(Wishlist w:wlist){ %>
							<tr>
								<td class="product-col">
									<div class="product">
										<figure class="product-media">
											<a href="product-detail.jsp?id=<%=w.getProduct().getId()%>">
												<img src="image/Product/<%=w.getProduct().getImage1()%>" alt="Product image">
											</a>
										</figure>

										<h3 class="product-title">
											<a href="product-detail.jsp?id=<%=w.getProduct().getId()%>"><%=w.getProduct().getPname()%></a>
										</h3><!-- End .product-title -->
									</div><!-- End .product -->
								</td>
								<td class="price-col">&#8377;<%=w.getPrice()%></td>
								<%
								    String availability =w.getProduct().getAvailability();
								    pageContext.setAttribute("ava", availability);
								%> 
								<%
 									String ava = (String) pageContext.getAttribute("ava");
 								%> 
 								<%
								 	if (ava.equals("yes")) {
								%>
								<td class="stock-col"><span class="in-stock">In stock</span></td>
								<%
								 	} else if (ava.equals("no")) {
								%>
								<td class="stock-col"><span class="out-of-stock">Out of stock</span></td>
								<%
									} 
								%>
								
								<td class="action-col">
								<form action="AddCart" method="post">
								  <input type="hidden" name="pname" value="<%=w.getProduct().getPname()%>"> 
                                    <input type="hidden" name="price" value="<%=w.getPrice()%>"> 
                                     <input type="hidden" name="pid" value="<%=w.getProduct().getId()%>"> 
                                      <input type="hidden" name="qty" value="1">
                                       <input type="hidden" name="size" value="<%=w.getProduct().getSize()%>">
								<%
									if (user != null) {
								%> 
								<!---------- stock ---------->
								
 								<%
								 	if (ava.equals("yes")) {
								%>
								<button class="btn btn-block btn-outline-primary-2 ">
									<i class="icon-cart-plus"></i>Add to Cart
								</button> 
								<%
								 	} else if (ava.equals("no")) {
								%>
								<button class="btn btn-block btn-outline-primary-2 disabled">Out of Stock</button> 
								<%
								    }
								%> 	
								<!---------- stock ---------->
								<%
									} else {
								%>
									<a onclick="return confirmation<%out.print(ws);%>()" href="#" class="btn btn-block btn-outline-primary-2 "><i class="icon-cart-plus"></i>Add to Cart</a>
								<%
									}
								%> 
								<input type="hidden" name="id" value="<%=user.getId()%>"> 
								</form>	
								</td>
								<td class="remove-col"><button data-toggle="modal" data-target="#deletewishlist<%=w.getId()%>" class="btn-remove"><i class="icon-close"></i></button></td>
							</tr>
							
							<div class="modal fade" id="deletewishlist<%=w.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLongTitle">Remove Product</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<p>&nbsp; You want to remove this item from wishlist cart?</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
											<a href="DeleteWishlist?id=<%=w.getId()%>" type="button" class="btn btn-primary">Yes</a>
										</div>
									</div>
								</div>
							</div>
							<%ws++; %>
							
							<%} %>
						</tbody>
					</table>
					<!-- End .table table-wishlist -->
					<%if(wlist.size()==0){ %>
					<!-- <h3 align="center">Your wishlist is empty</h3> -->
					<img class="rounded mx-auto d-block" style="width:400px;height:250px;" alt="no product found" src="assets/images/demos/demo-10/wishlist empty.png">
					<%} %>
					<%}else{ %>
					<table class="table table-wishlist table-mobile">
						<thead>
							<tr>
								<th>Product</th>
								<th>Price</th>
								<th>Stock Status</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
					</table>
					<!-- End .table table-wishlist -->
						<!-- <h3 align="center">Your wishlist is empty</h3> -->
						<img class="rounded mx-auto d-block" style="width:400px;height:250px;" alt="no product found" src="assets/images/demos/demo-10/wishlist empty.png">
					<%} %>
	            	<div class="wishlist-share">
	            		<div class="social-icons social-icons-sm mb-2">
	            			<label class="social-label">Share on:</label>
	    					<a href="#" class="social-icon" title="Facebook" target="_blank"><i class="icon-facebook-f"></i></a>
	    					<a href="#" class="social-icon" title="Twitter" target="_blank"><i class="icon-twitter"></i></a>
	    					<a href="#" class="social-icon" title="Instagram" target="_blank"><i class="icon-instagram"></i></a>
	    					<a href="#" class="social-icon" title="Youtube" target="_blank"><i class="icon-youtube"></i></a>
	    					<a href="#" class="social-icon" title="Pinterest" target="_blank"><i class="icon-pinterest"></i></a>
	    				</div><!-- End .soial-icons -->
	            	</div><!-- End .wishlist-share -->
            	</div><!-- End .container -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

        <%@ include file="footer.jsp" %>
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

    <!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->
    <%
    	String msg=request.getParameter("msg");
    	if("match".equals(msg)){
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
								  title: '<p style="font-size:15px;">Product allredy in wishlist cart</p>'
								})
								</script>					
	<%} %>
	<%
    	if("add".equals(msg)){
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
								  title: '<p style="font-size:15px;">Product Add to wishlist cart</p>'
								})
								</script>					
	<%} %>
    <%@ include file="mobile-menu.jsp" %>

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


<!-- Mirrored from portotheme.com/html/molla/wishlist.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:21:47 GMT -->
</html>