<!DOCTYPE html>
<html lang="en">
<head>
<!-- <!-- <style type="text/css">
.trans:hover .img {
	transform: scale(1.2,1.2);
	transition :transform 1s ;
	transition-timing-function: cubic-bezier(0.4, 0, 1, 1);
}
.trans{
overflow: hidden;
background-color: red;
/* height: 250px; */
} 
</style> -->
</head>
<body>
    <div class="page-wrapper">
        <%@include file="header.jsp" %>

        <main class="main">
            <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Contact us</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->
            <div class="container trans">
	        	<div class="page-header page-header-big text-center img" style="background-image: url('assets/images/demos/demo-10/slider/slide-1.jpg')">
        			<h1 class="page-title text-white">Contact us<span class="text-white">keep in touch with us</span></h1>
	        	</div><!-- End .page-header -->
            </div><!-- End .container -->

            <div class="page-content pb-0">
                <div class="container">
                	<div class="row">
                		<div class="col-lg-6 mb-2 mb-lg-0">
                			<h2 class="title mb-1">Contact Information</h2><!-- End .title mb-2 -->
                			<p class="mb-3">Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.</p>
                			<div class="row">
                				<div class="col-sm-7">
                					<div class="contact-info">
                						<h3>The Office</h3>

                						<ul class="contact-list">
                							<li>
                								<i class="icon-map-marker"></i>
	                							70 Washington Square South New York, NY 10012, United States
	                						</li>
                							<li>
                								<i class="icon-phone"></i>
                								<a href="tel:#">+91 97245 79296</a>
                							</li>
                							<li>
                								<i class="icon-envelope"></i>
                								<a href="mailto:#">info@Molla.com</a>
                							</li>
                						</ul><!-- End .contact-list -->
                					</div><!-- End .contact-info -->
                				</div><!-- End .col-sm-7 -->

                				<div class="col-sm-5">
                					<div class="contact-info">
                						<h3>The Office</h3>

                						<ul class="contact-list">
                							<li>
                								<i class="icon-clock-o"></i>
	                							<span class="text-dark">Monday-Saturday</span> <br>11am-7pm ET
	                						</li>
                							<li>
                								<i class="icon-calendar"></i>
                								<span class="text-dark">Sunday</span> <br>11am-6pm ET
                							</li>
                						</ul><!-- End .contact-list -->
                					</div><!-- End .contact-info -->
                				</div><!-- End .col-sm-5 -->
                			</div><!-- End .row -->
                		</div><!-- End .col-lg-6 -->
                		<div class="col-lg-6">
                			<h2 class="title mb-1">Got Any Questions?</h2><!-- End .title mb-2 -->
                			<p class="mb-2">Use the form below to get in touch with the sales team</p>

                			<form action="UserContact" method="post" class="contact-form mb-3">
                				<div class="row">
                					<div class="col-sm-6">
                                        <label for="cname" class="sr-only">Name</label>
                						<input type="text" name="name" class="form-control" id="cname" placeholder="Name *" required>
                					</div><!-- End .col-sm-6 -->

                					<div class="col-sm-6">
                                        <label for="cemail" class="sr-only">Email</label>
                						<input type="email" name="email" class="form-control" id="cemail" placeholder="Email *" required>
                					</div><!-- End .col-sm-6 -->
                				</div><!-- End .row -->

                				<div class="row">
                					<div class="col-sm-6">
                                        <label for="cphone" class="sr-only">Phone</label>
                						<input type="tel" name="contact" class="form-control" id="cphone" placeholder="Phone">
                					</div><!-- End .col-sm-6 -->

                					<div class="col-sm-6">
                                        <label for="csubject" class="sr-only">Subject</label>
                						<input type="text" name="subject" class="form-control" id="csubject" placeholder="Subject">
                					</div><!-- End .col-sm-6 -->
                				</div><!-- End .row -->

                                <label for="cmessage" class="sr-only">Message</label>
                				<textarea class="form-control" name="message" cols="30" rows="4" id="cmessage" required placeholder="Message *"></textarea>

                				<button type="submit" class="btn btn-outline-primary-2 btn-minwidth-sm">
                					<span>SUBMIT</span>
            						<i class="icon-long-arrow-right"></i>
                				</button>
                			</form><!-- End .contact-form -->
                		</div><!-- End .col-lg-6 -->
                	</div><!-- End .row -->

                	<hr class="mt-4 mb-5">

                	<div class="stores mb-4 mb-lg-5">
	                	<h2 class="title text-center mb-3">Our Stores</h2><!-- End .title text-center mb-2 -->

	                	<div class="row">
	                		<div class="col-lg-6">
	                			<div class="store">
	                				<div class="row">
	                					<div class="col-sm-5 col-xl-6">
	                						<figure class="store-media mb-2 mb-lg-0">
	                							<img src="assets/images/stores/img-1.jpg" alt="image">
	                						</figure><!-- End .store-media -->
	                					</div><!-- End .col-xl-6 -->
	                					<div class="col-sm-7 col-xl-6">
	                						<div class="store-content">
	                							<h3 class="store-title">Wall Street Plaza</h3><!-- End .store-title -->
	                							<address>88 Pine St, New York, NY 10005, USA</address>
	                							<div><a href="tel:#">+1 987-876-6543</a></div>

	                							<h4 class="store-subtitle">Store Hours:</h4><!-- End .store-subtitle -->
                								<div>Monday - Saturday 11am to 7pm</div>
                								<div>Sunday 11am to 6pm</div>

                								<a href="#" class="btn btn-link" target="_blank"><span>View Map</span><i class="icon-long-arrow-right"></i></a>
	                						</div><!-- End .store-content -->
	                					</div><!-- End .col-xl-6 -->
	                				</div><!-- End .row -->
	                			</div><!-- End .store -->
	                		</div><!-- End .col-lg-6 -->

	                		<div class="col-lg-6">
	                			<div class="store">
	                				<div class="row">
	                					<div class="col-sm-5 col-xl-6">
	                						<figure class="store-media mb-2 mb-lg-0">
	                							<img src="assets/images/stores/img-2.jpg" alt="image">
	                						</figure><!-- End .store-media -->
	                					</div><!-- End .col-xl-6 -->

	                					<div class="col-sm-7 col-xl-6">
	                						<div class="store-content">
	                							<h3 class="store-title">One New York Plaza</h3><!-- End .store-title -->
	                							<address>88 Pine St, New York, NY 10005, USA</address>
	                							<div><a href="tel:#">+1 987-876-6543</a></div>

	                							<h4 class="store-subtitle">Store Hours:</h4><!-- End .store-subtitle -->
												<div>Monday - Friday 9am to 8pm</div>
												<div>Saturday - 9am to 2pm</div>
												<div>Sunday - Closed</div>

                								<a href="#" class="btn btn-link" target="_blank"><span>View Map</span><i class="icon-long-arrow-right"></i></a>
	                						</div><!-- End .store-content -->
	                					</div><!-- End .col-xl-6 -->
	                				</div><!-- End .row -->
	                			</div><!-- End .store -->
	                		</div><!-- End .col-lg-6 -->
	                	</div><!-- End .row -->
                	</div><!-- End .stores -->
                </div><!-- End .container -->
            	<div id="map"></div><!-- End #map -->
            </div><!-- End .page-content -->
        </main><!-- End .main -->

		<%
			String msg = request.getParameter("msg");
			if ("contact".equals(msg)) {
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
				title: '<p style="font-size:15px;">Contact successfully</p>'
				})
			</script>
		<%
			}
		%>
		<%
			if ("false".equals(msg)) {
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
				title: '<p style="font-size:15px;">Contact Faild.</p>'
				})
			</script>
		<%
			}
		%>

		<%@include file="footer.jsp" %>
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

    <!-- Mobile Menu -->
    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

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

    <!-- Google Map -->
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDc3LRykbLB-y8MuomRUIY0qH5S6xgBLX4"></script>

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


<!-- Mirrored from portotheme.com/html/molla/contact.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:22:19 GMT -->
</html>