<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Sproduct"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="pojo.Reviews"%>
<%@page import="pojo.Product"%>
<%
LocalDateTime now = LocalDateTime.now();
System.out.println("Before Formatting: " + now);
DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
String formatDateTime = now.format(format);
%>
<% Sproduct sp=(Sproduct)session.getAttribute("sproduct"); %>
<html lang="en">
<head>
<link rel="stylesheet" href="assets/css/sizeguide.css">
<link rel="stylesheet" href="assets/css/rating.css">
<style type="text/css">
.variable-single-item{
 color: #a6c76c;
}
</style>
</head>
<body>
    <div class="page-wrapper">
        <%@include file="header.jsp" %>
			<%	
				Integer id = Integer.parseInt(request.getParameter("id"));
				Product p = new Product();
				p = adao.getProductById(id);
				session.setAttribute("p", p);
				
				UserDao udao=new UserDao();
				List<Reviews> relist=udao.ViewReview(p.getId());
				session.setAttribute("review", relist);
			%>
			<% int size=relist.size();%>
        <main class="main">
            <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                <div class="container d-flex align-items-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="shop.jsp?id=<%=p.getCategory().getId()%>"><%=p.getCategory().getCname()%></a></li>
                        <li class="breadcrumb-item"><a href="#"><%=p.getPname()%></a></li>
                    </ol>

                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->

            <div class="page-content">
                <div class="container">
                    <div class="product-details-top">
                     
                        <div class="row">
                            <div class="col-md-6">
                                <div class="product-gallery product-gallery-separated">
                                    <span class="product-label label-sale">Sale</span>
                                    <figure class="product-separated-item">
                                        <img src="image/Product/<%=p.getImage1()%>" data-zoom-image="image/Product/<%=p.getImage1()%>" alt="product image">

                                        <a href="#" id="btn-separated-gallery" class="btn-product-gallery">
                                            <i class="icon-arrows"></i>
                                        </a>
                                    </figure>

                                    <figure class="product-separated-item">
                                        <img src="image/Product/<%=p.getImage2()%>" data-zoom-image="image/Product/<%=p.getImage2()%>" alt="product image">
                                    </figure>

                                    <figure class="product-separated-item">
                                        <img src="image/Product/<%=p.getImage3()%>" data-zoom-image="image/Product/<%=p.getImage3()%>" alt="product image">
                                    </figure>

                                    <figure class="product-separated-item">
                                        <img src="image/Product/<%=p.getImage4()%>" data-zoom-image="image/Product/<%=p.getImage4()%>" alt="product image">
                                    </figure>
                                </div><!-- End .product-gallery -->
                            </div><!-- End .col-md-6 -->

                            <div class="col-md-6">
                                <div class="product-details sticky-content">
                                <form action="AddCart" method="post">
                                    <h1 class="product-title"><%=p.getPname() %></h1><!-- End .product-title -->
                                    <input type="hidden" name="pname" value="<%=p.getPname()%>"> 
									<%
									    ArrayList<Reviews> reviewsList = (ArrayList<Reviews>) session.getAttribute("review");
									
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
                                       		<input type="hidden" name="pid" value="<%=p.getId()%>"> 
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
                                        <a class="ratings-text" href="#product-accordion" id="review-link">( <% out.print(size);%> Reviews )</a>
                                    </div><!-- End .rating-container -->
                                    <div class="product-price">
                                        <span class="new-price">&#8377;<%=p.getPrice()%></span>
                                        <span class="old-price">&#8377;<%=p.getDprice()%></span>
                                        <input type="hidden" name="price" value="<%=p.getPrice()%>"> 
                                    </div><!-- End .product-price -->
									<div class="variable-single-item">
										<div>
											<span><i class="icon-checkmark-circled"></i></span>
											<%=p.getQty()%>
											IN STOCK
										</div>
									</div>
									<div class="product-content">
                                        <p><%=p.getDescription()%> </p>
                                    </div><!-- End .product-content -->

                                    <div class="details-filter-row details-row-size">
	                                        <label for="size">Size:</label>
                                        <div class="select-custom">
                                            <select name="size" onblur="checksize" id="size" class="form-control">
                                                <option disabled selected="selected">Select a size</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                            </select>
                                            <span id='sizeerr' class='text-danger'></span>
                                        </div><!-- End .select-custom -->

                                        <a href="#" class="size-guide" onclick="openSizeGuide()"><i class="icon-th-list"></i>size guide</a>
                                        <div class="size-guide-modal" id="sizeGuideModal">
									    <div class="modal-content">
									      <span class="close-btn" onclick="closeSizeGuide()">&times;</span>
									      <h2>Size Guide</h2>
									      <!-- Your size guide content goes here -->
                                        		<img class="rounded mx-auto d-block" style="width:500px;height:500px;" src="assets/Shoe_Size.webp" alt="product image">
									    </div>
									  </div>
  
                                    </div><!-- End .details-filter-row -->

                                    <div class="details-filter-row details-row-size">
                                        <label for="qty">Qty:</label>
                                        <div class="product-details-quantity">
                                            <input type="number" id="qty" name="qty" class="form-control" value="1" min="1" max="<%=p.getQty()%>" step="1" data-decimals="0" required>
                                        </div><!-- End .product-details-quantity -->
                                    </div><!-- End .details-filter-row -->
                                    <div class="product-details-action">
										<%
											if (user != null) {
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
											<input type="hidden" name="id" value="<%=user.getId()%>">
										    <button type="submit" onclick="return checkvalidate()" id="size" class="btn-product btn-cart"><span>add to cart</span></button>
										<%
											} else if (ava.equals("no")) {
										%>
											<button style="cursor:no-drop;" disabled class="btn-product btn-cart"><span>OUT OF STOCK</span></button>
										<%
											} 
										%>
										
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
										 <a onclick="return confirmationpro()" href="#" class="btn-product btn-cart"><span>add to cart</span></a>
										<%
											 } else if (ava.equals("no")) {
										%>
											<a style="cursor:no-drop;" href="#" class="btn-product btn-cart disabled"><span>OUT OF STOCK</span></a>
										
										<%
											 }}
										%>

									</div><!-- End .product-details-action -->
									</form>
									

                                    <div class="product-details-footer">
                                        <div class="product-cat">
                                            <span>Category:</span>
                                            <a href="shop.jsp?id=<%=p.getCategory().getId()%>"><%=p.getCategory().getCname()%></a>
                                        </div><!-- End .product-cat -->

                                        <div class="social-icons social-icons-sm">
                                            <span class="social-label">Share:</span>
                                            <a href="#" class="social-icon" title="Facebook" target="_blank"><i class="icon-facebook-f"></i></a>
                                            <a href="#" class="social-icon" title="Twitter" target="_blank"><i class="icon-twitter"></i></a>
                                            <a href="#" class="social-icon" title="Instagram" target="_blank"><i class="icon-instagram"></i></a>
                                            <a href="#" class="social-icon" title="Pinterest" target="_blank"><i class="icon-pinterest"></i></a>
                                        </div>
                                    </div><!-- End .product-details-footer -->

                                    <div class="accordion accordion-plus product-details-accordion" id="product-accordion">
                                        <div class="card card-box card-sm">
                                            <div class="card-header" id="product-desc-heading">
                                                <h2 class="card-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" href="#product-accordion-desc" aria-expanded="false" aria-controls="product-accordion-desc">
                                                        Description
                                                    </a>
                                                </h2>
                                            </div><!-- End .card-header -->
                                            <div id="product-accordion-desc" class="collapse" aria-labelledby="product-desc-heading" data-parent="#product-accordion">
                                                <div class="card-body">
                                                    <div class="product-desc-content">
                                                        <p><%=p.getDescription()%></p>
                                                    </div><!-- End .product-desc-content -->
                                                </div><!-- End .card-body -->
                                            </div><!-- End .collapse -->
                                        </div><!-- End .card -->

                                        <div class="card card-box card-sm">
                                            <div class="card-header" id="product-info-heading">
                                                <h2 class="card-title">
                                                    <a role="button" data-toggle="collapse" href="#product-accordion-info" aria-expanded="false" aria-controls="product-accordion-info">
                                                        Additional Information
                                                    </a>
                                                </h2>
                                            </div><!-- End .card-header -->
                                            <div id="product-accordion-info" class="collapse" aria-labelledby="product-info-heading" data-parent="#product-accordion">
                                                <div class="card-body">
                                                    <div class="product-desc-content">
                                                        <p><%=p.getInfo()%></p>

                                                        <h3>Fabric & care</h3>
                                                        <ul>
                                                            <li>100% Polyester</li>
                                                            <li>Do not iron</li>
                                                            <li>Do not wash</li>
                                                            <li>Do not bleach</li>
                                                            <li>Do not tumble dry</li>
                                                            <li>Professional dry clean only</li>
                                                        </ul>

                                                        <h3>Size</h3>
                                                        <p><%=p.getSize()%></p>
                                                    </div><!-- End .product-desc-content -->
                                                </div><!-- End .card-body -->
                                            </div><!-- End .collapse -->
                                        </div><!-- End .card -->

                                        <div class="card card-box card-sm">
                                            <div class="card-header" id="product-shipping-heading">
                                                <h2 class="card-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" href="#product-accordion-shipping" aria-expanded="false" aria-controls="product-accordion-shipping">
                                                        Shipping & Returns
                                                    </a>
                                                </h2>
                                            </div><!-- End .card-header -->
                                            <div id="product-accordion-shipping" class="collapse" aria-labelledby="product-shipping-heading" data-parent="#product-accordion">
                                                <div class="card-body">
                                                    <div class="product-desc-content">
                                                        <p>We deliver to over 100 countries around the world. For full details of the delivery options we offer, please view our <a href="#">Delivery information</a><br>
                                                        We hope youâll love every purchase, but if you ever need to return an item you can do so within a month of receipt. For full details of how to make a return, please view our <a href="#">Returns information</a></p>
                                                    </div><!-- End .product-desc-content -->
                                                </div><!-- End .card-body -->
                                            </div><!-- End .collapse -->
                                        </div><!-- End .card -->
										<%
											List<Reviews> rlist=udao.ViewReview(p.getId());
										%>
										<% int sizes=rlist.size();%>
                                        <div class="card card-box card-sm">
                                            <div class="card-header" id="product-review-heading">
                                                <h2 class="card-title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" href="#product-accordion-review" aria-expanded="false" aria-controls="product-accordion-review">
                                                        Reviews (<% out.print(sizes);%>)
                                                    </a>
												</h2>
                                            </div><!-- End .card-header -->
                                            <%
												if(user != null) {
												boolean hasReviewed = false; // Flag to check if user has reviewed
														
												 for (Reviews review : rlist) { // Assuming rlist is a list of reviews
													 if (review.getUser().getId() == user.getId() && review.getProduct().getId() == p.getId()) {
														  hasReviewed = true;
														   break;
												 }
													}
														
												if (!hasReviewed) { // Only show review button and modal if not reviewed
											%>
											<a href="#" class="size-guide" onclick="openreview()"><i class="icon-th-star"></i>Customer Review</a>
											<div class="modal p-5" id="reviewModal">
												<div class="modal-content">
													<form action="AddReview" method="post">
														<!-- Your size guide content goes here -->
														<!-- Modal Header -->
														<input type="hidden" name="uid" value="<%=user.getId()%>">
														<div class="modal-header">
															<h4 class="modal-title">Review</h4>
														</div>
														<!-- Modal body -->
														<input type="hidden" name="pid" value="<%=p.getId()%>">
														<div class="row">
															<div class="col-10 mx-auto">
																<div class="modal-body rate mb-5"
																	style="margin: 20px 0;">
																	<input type="radio" id="star5" name="rate" value="5" />
																	<label for="star5" title="text">5 stars</label> 
																	<input type="radio" id="star4" name="rate" value="4" /> 
																	<label for="star4" title="text">4 stars</label> 
																	<input type="radio" id="star3" name="rate" value="3" /> 
																	<label for="star3" title="text">3 stars</label> 
																	<input type="radio" id="star2" name="rate" value="2" /> 
																	<label for="star2" title="text">2 stars</label> 
																	<input type="radio" id="star1" name="rate" value="1" /> 
																	<label for="star1" title="text">1 star</label><br>
																	<br>
																</div>
																<div class="my-5">
																	<input type="text" name="rtital" placeholder="Enter Your Review Tital"
																		class="form-control mb-3 border-dark">
																	<textarea name="review" id="" placeholder="Enetr Your Review"
																		class="form-control border-dark" cols="30" rows="5"></textarea>
																</div>
																<input type="hidden" name="rdate" value="<%=formatDateTime%>">
															</div>
														</div>
														<!-- Modal footer -->
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary"
																data-bs-dismiss="modal">Save</button>
															<button type="button" onclick="closereview()"
																class="btn btn-danger" data-bs-dismiss="modal">Close</button>
														</div>
													</form>
												</div>
											</div>
										<%
										    }
										}
										%>
                                            <div id="product-accordion-review" class="collapse" aria-labelledby="product-review-heading" data-parent="#product-accordion">
                                                <div class="card-body">
                                                    <div class="reviews">
                                                    	<%
                                                    		for (Reviews r : rlist) {
                                                    	%>
                                                        <div class="review">
                                                            <div class="row no-gutters">
                                                                <div class="col-auto">
                                                                    <h4><a href="#"><%=r.getUser().getFname() %>.</a></h4>
																<%
																	Integer rate =r.getRating();
																	pageContext.setAttribute("rate", rate);
																%>
																<%
																	String rates = pageContext.getAttribute("rate").toString();
																%>
																<div class="ratings-container">
																	<div class="ratings">
																		<%
																			if (rates.equals("1")) {
																		%>
																		<div class="ratings-val" style="width: ;"></div>
																		<%
																			} else if (rates.equals("2")) {
																		%>
																		<div class="ratings-val" style="width: 40%;"></div>
																		<%
																			} else if (rates.equals("3")) {
																		%>
																		<div class="ratings-val" style="width: 60%;"></div>
																		<%
																			} else if (rates.equals("4")) {
																		%>
																		<div class="ratings-val" style="width: 80%;"></div>
																		<%
																			} else if (rates.equals("5")) {
																		%>
																		<div class="ratings-val" style="width: 100%;"></div>
																		<%
																			}
																		%>
																	</div>
																	<!-- End .ratings -->
																</div>
																<!-- End .rating-container -->
                                                                    <p class="result<%=r.getId()%>"></p>
                                                                    
                                                                </div><!-- End .col -->
                                                                <div class="col">
                                                                    <h4><%=r.getReviewtitle()%></h4>

                                                                    <div class="review-content">
                                                                        <p><%=r.getReview()%></p>
                                                                    </div><!-- End .review-content -->

                                                                    <div class="review-action">
                                                                        <a href="#"><i class="icon-thumbs-up"></i>Helpful (2)</a>
                                                                        <a href="#"><i class="icon-thumbs-down"></i>Unhelpful (0)</a>
                                                                    </div><!-- End .review-action -->
                                                                </div><!-- End .col-auto -->
                                                            </div><!-- End .row -->
                                                        </div><!-- End .review -->
														<%} %>
														<%if(rlist.size()==0){ %>
														<h3>No Review</h3>
														<%} %>
                                                    </div><!-- End .reviews -->
                                                </div><!-- End .card-body -->
                                            </div><!-- End .collapse -->
                                        </div><!-- End .card -->
                                    </div><!-- End .accordion -->
                                </div><!-- End .product-details -->
                            </div><!-- End .col-md-6 -->
                        </div><!-- End .row -->
                      
                    </div><!-- End .product-details-top -->
                    
                    <%
                                                    		for (Reviews r : rlist) {
                                                    	%>
                    <script type="text/javascript">
					    const reviewDateTimeValue = '<%= r.getReviewdate() %>'; 
					 const reviewDateTime = new Date(reviewDateTimeValue);
						   const currentDateTime = new Date();
						   const timeDifference = currentDateTime - reviewDateTime;
						 const daysAgo = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
						const hoursAgo = Math.floor((timeDifference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
						  const resultElement = document.querySelector('.result<%=r.getId()%>');
						  resultElement.textContent = `${daysAgo} days and ${hoursAgo} hours ago`;
					 </script>
					 <%} %>
                    
<!-- <div class="container" style="position:relative;">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
            Open modal
        </button>
        
</div> -->
                    <hr class="mt-3 mb-5">

				<%
					String cat = p.getCategory().getId().toString();
					List<Product> productlist = null;
					if (cat == null || cat.equals("all")) {
						productlist = adao.viewProduct();
					} else {
						Integer cid = Integer.parseInt(cat);
						productlist = adao.viewcategoryById(cid);
					}
					List<Category> clist1 = adao.ShowCategory();
					
				%>
				
				<h2 class="title text-center mb-4">You May Also Like</h2><!-- End .title text-center -->
                    <div class="owl-carousel owl-simple carousel-equal-height carousel-with-shadow" data-toggle="owl" 
                        data-owl-options='{
                            "nav": false, 
                            "dots": true,
                            "margin": 20,
                            "loop": false,
                            "responsive": {
                                "0": {
                                    "items":1
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
                                    "nav": true,
                                    "dots": false
                                }
                            }
                        }'>

					<%for(Product pro:productlist) {%>
					<%
						List<Reviews> reviewlist = udao.ViewReview(pro.getId());
							session.setAttribute("review", reviewlist);
					%>
					<%
						int reviewsize = reviewlist.size();
					%>
					<div class="product product-7">
                            <figure class="product-media">
                                <span class="product-label label-new">New</span>
                                <a href="product-detail.jsp?id=<%=pro.getId()%>">
                                    <img src="image/Product/<%=pro.getImage1()%>" alt="Product image" class="product-image">
                                </a>

                                <div class="product-action-vertical">
                                    <a href="#" class="btn-product-icon btn-wishlist btn-expandable"><span>add to wishlist</span></a>
                                </div><!-- End .product-action-vertical -->

                                <div class="product-action">
                                    <a href="#" class="btn-product btn-cart"><span>add to cart</span></a>
                                </div><!-- End .product-action -->
                            </figure><!-- End .product-media -->

                            <div class="product-body">
                                <div class="product-cat">
                                    <a href="shop.jsp?id=<%=pro.getCategory().getId()%>"><%=pro.getCategory().getCname()%></a>
                                </div><!-- End .product-cat -->
                                <h3 class="product-title"><a href="product-detail.jsp?id=<%=pro.getId()%>"><%=pro.getPname()%></a></h3><!-- End .product-title -->
                                <div class="product-price">
                                    &#8377;<%=pro.getPrice()%>
                                </div><!-- End .product-price -->
                                <div class="ratings-container">
                                    <div class="ratings">
                                        <div class="ratings-val" style="width:56%;"></div><!-- End .ratings-val -->
                                    </div><!-- End .ratings -->
                                    <span class="ratings-text">( <% out.print(reviewsize);%> Reviews )</span>
                                </div><!-- End .rating-container -->

                            </div><!-- End .product-body -->
                        </div><!-- End .product -->
						<%} %>
                    </div><!-- End .owl-carosel -->
                </div><!-- End .container -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

        <%@include file="footer.jsp" %>
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>
	
	<!-- sticky bar -->
	<div class="sticky-bar">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <figure class="product-media">
                        <a href="product.html">
                            <img src="image/Product/<%=p.getImage1()%>" alt="Product image">
                        </a>
                    </figure><!-- End .product-media -->
                    <h4 class="product-title"><a href="product-detail.jsp?id=<%=p.getId()%>"><%=p.getPname()%></a></h4><!-- End .product-title -->
                </div><!-- End .col-6 -->

                <div class="col-6 justify-content-end">
                    <div class="product-price">
                       <%=p.getPrice()%>
                    </div><!-- End .product-price -->
                    <div class="product-details-quantity">
                        <input type="number" id="qty" name="qty" class="form-control" value="1" min="1" max="10" step="1" data-decimals="0" required>
                    </div><!-- End .product-details-quantity -->
					<div class="product-details-action">
					 <form action="AddCart" method="post">
					 <input type="hidden" name="pname" value="<%=p.getPname()%>"> 
			          <input type="hidden" name="price" value="<%=p.getPrice()%>"> 
			           <input type="hidden" name="pid" value="<%=p.getId()%>"> 
			           <input type="hidden" name="qty" value="1">
			           <input type="hidden" name="size" value="<%=p.getSize()%>">
					<%
						if (user != null) {
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
						<input type="hidden" name="id" value="<%=user.getId()%>">
						<button type="submit" onclick="return checkvalidate()" class="btn-product btn-cart"><span>add to cart</span></button>
					<%
						} else if (ava.equals("no")) {
					%>
						<button style="cursor:no-drop;" disabled class="btn-product btn-cart"><span>OUT OF STOCK</span></button>
					<%
						} 
					%>
										
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
						<a onclick="return confirmationpro()" href="#" class="btn-product btn-cart"><span>add to cart</span></a>
					<%
					    } else if (ava.equals("no")) {
					%>
						<a style="cursor:no-drop;" href="#" class="btn-product btn-cart disabled"><span>OUT OF STOCK</span></a>
										
					<%
						}}
					%>
					</form>
					</div><!-- End .product-details-action -->
                    <div class="product-details-action">
                    <form action="AddWishlist" method="post">
		                <input type="hidden" name="pname" value="<%=p.getPname()%>">
						<input type="hidden" name="price" value="<%=p.getPrice()%>">
						<input type="hidden" name="pid" value="<%=p.getId()%>">
					<%
						if (user != null) {
					%>
						<input type="hidden" name="id" value="<%=user.getId()%>"> 
						<button class="btn-product btn-wishlist border-0 bg-white" title="Wishlist"><span>add to wishlist</span></button>
					<%
						} else {
					%>
						<a onclick="return confirmation()" href="#" class="btn-product btn-wishlist" title="Wishlist"><span>add to wishlist</span></a>
					<%
						}
					%>
					</form>
                    </div><!-- End .product-details-action -->
                </div><!-- End .col-6 -->
            </div><!-- End .row -->
        </div><!-- End .container -->
    </div>
    <!-- End .sticky-bar -->
	
    <!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->
	
	<script type="text/javascript">
	function confirmation() {
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
	
	<script type="text/javascript">
	function confirmationpro() {
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
	<script type="text/javascript">
	 var size = document.getElementById("size").value;
	 function checksize(){
	    	var size = document.getElementById("size").value;
	   	   
	    	if(size == ""){
	    		document.getElementById("sizeerr").style.display = 'block';
	    		document.getElementById("sizeerr").innerHTML = 'Please select size';
	    	}
	    	else{
	    		document.getElementById("sizeerr").style.display = 'none';
	    		document.getElementById("sizeerr").innerHTML = '';
	    	}
	    }
	 function checkvalidate(){
		 var size = document.getElementById("size").value;
     	
     	if(size == ""){
     		document.getElementById("sizeerr").style.display = 'block';
    		document.getElementById("sizeerr").innerHTML = 'Please select size';
    		document.getElementById("sizeerr").style.display = 'none';
    		document.getElementById("sizeerr").innerHTML = '';
     		return false;
     	}
     	else{
     		return true;	
     	}
     }
	</script>
	<script type="text/javascript">
	// Function to open the size guide modal
	function openSizeGuide() {
	  var sizeGuideModal = document.getElementById("sizeGuideModal");
	  sizeGuideModal.style.display = "block";
	}
	// Function to close the size guide modal
	function closeSizeGuide() {
	  var sizeGuideModal = document.getElementById("sizeGuideModal");
	  sizeGuideModal.style.display = "none";
	}
	</script>
	
	<script type="text/javascript">
	// Function to open the size guide modal
	function openreview() {
	  var sizeGuideModal = document.getElementById("reviewModal");
	  sizeGuideModal.style.display = "block";
	}
	// Function to close the size guide modal
	function closereview() {
	  var sizeGuideModal = document.getElementById("reviewModal");
	  sizeGuideModal.style.display = "none";
	}
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
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/jquery.elevateZoom.min.js"></script>
    <script src="assets/js/bootstrap-input-spinner.js"></script>
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/jquery.sticky-kit.min.js"></script>
    <!-- Main JS File -->
    <script src="assets/js/main.js"></script>
</body>


<!-- Mirrored from portotheme.com/html/molla/product-sticky.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:22:01 GMT -->
</html>