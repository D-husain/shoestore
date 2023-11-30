<!DOCTYPE html>
<%@page import="pojo.States"%>
<%@page import="pojo.Cities"%>
<html lang="en">

<body>
    <div class="page-wrapper">
        <%@include file="header.jsp" %>

        <main class="main">
            <nav aria-label="breadcrumb" class="breadcrumb-nav border-0 mb-0">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Login</li>
                    </ol>
                </div><!-- End .container -->
            </nav><!-- End .breadcrumb-nav -->
            <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('assets/images/demos/demo-10/banners/banner-4.jpg')">
            	<div class="container">
            		<div class="form-box">
            			<div class="form-tab">
	            			<ul class="nav nav-pills nav-fill" role="tablist">
							    <li class="nav-item">
							        <a class="nav-link active" id="signin-tab-2" data-toggle="tab" href="#signin-2" role="tab" aria-controls="signin-2" aria-selected="false">Login</a>
							    </li>
							    <li class="nav-item">
							        <a class="nav-link" id="register-tab-2" data-toggle="tab" href="#register-2" role="tab" aria-controls="register-2" aria-selected="true">Register</a>
							    </li>
							</ul>
							<div class="tab-content">
							    <div class="tab-pane fade show active" id="signin-2" role="tabpanel" aria-labelledby="signin-tab-2">
							    	<form action="UserLogin" method="post">
							    		<div class="form-group">
							    			<label for="singin-email-2">Email address *</label>
							    			<input type="email" class="form-control" id="singin-email-2" name="email" required>
							    		</div><!-- End .form-group -->

							    		<div class="form-group">
							    			<label for="singin-password-2">Password *</label>
							    			<input type="password" class="form-control" id="singin-password-2" name="password" required>
							    		</div><!-- End .form-group -->

							    		<div class="form-footer">
							    			<button type="submit" class="btn btn-outline-primary-2">
			                					<span>LOG IN</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>

			                				<div class="custom-control custom-checkbox">
												<input type="checkbox" required class="custom-control-input" id="signin-remember-2">
												<label class="custom-control-label" for="signin-remember-2">Remember Me</label>
											</div><!-- End .custom-checkbox -->

											<a href="forgotpassword.jsp" class="forgot-link">Forgot Your Password?</a>
							    		</div><!-- End .form-footer -->
							    	</form>
							    	<div class="form-choice">
								    	<p class="text-center">or sign in with</p>
								    	<div class="row">
								    		<div class="col-sm-6">
								    			<a href="LoginServlet" class="btn btn-login btn-g">
								    				<i class="icon-google"></i>
								    				Login With Google
								    			</a>
								    		</div><!-- End .col-6 -->
								    		<div class="col-sm-6">
								    			<a href="FacebookLoginServlet" class="btn btn-login btn-f">
								    				<i class="icon-facebook-f"></i>
								    				Login With Facebook
								    			</a>
								    		</div><!-- End .col-6 -->
								    	</div><!-- End .row -->
							    	</div><!-- End .form-choice -->
							    </div><!-- .End .tab-pane -->
							    <%	
							    	UserDao userdao=new UserDao();
							    	List<Cities> cities=userdao.showcities();
									List<States> state=userdao.showStates();
							    %>
							    <div class="tab-pane fade" id="register-2" role="tabpanel" aria-labelledby="register-tab-2">
							    	<form action="UserRegister" method="post">
							    		<div class="form-group">
							    			<label for="register-email-2">Your first name *</label>
							    			<input type="text" class="form-control" id="register-email-2" name="fname" required>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-email-2">Your last name *</label>
							    			<input type="text" class="form-control" id="register-email-2" name="lname" required>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-email-2">Your email address *</label>
							    			<input type="email" class="form-control" id="register-email-2" name="email" required>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-email-2">Your contact number *</label>
							    			<input type="tel" class="form-control" id="register-email-2" name="contact" required>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-email-2">Your address *</label>
							    			<textarea class="form-control" id="register-email-2" name="address" required></textarea>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-email-2">Your state *</label>
							    			<select name="state" class="form-control" id="register-email-2">
										    <option selected="selected" disabled="disabled">Select State</option>
										    <% for (States s : state) { %>
										        <option value="<%=s.getName()%>"><%=s.getName()%></option>
										    <% } %>
										    </select>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-email-2">Your city *</label>
							    			<select name="city" class="form-control">
										    <option selected="selected" disabled="disabled">Select City</option>
										    <% 
										       for (States s : state) {
										       /* int a = s.getId();  */
										       List<Cities> clist = userdao.ViewCities(s.getId());
										       for (Cities c2 : clist) {
										    %>
										       <option value="<%=c2.getCity()%>"><%=c2.getCity()%></option>
										    <% 
										       }}
										    %>
										    </select>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-password-2">Your country *</label>
							    			<input type="text" class="form-control" id="register-password-2" name="country" required>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-password-2">Your zipcode *</label>
							    			<input type="tel" class="form-control" id="register-password-2" name="zip" required>
							    		</div><!-- End .form-group -->
							    		
							    		<div class="form-group">
							    			<label for="register-password-2">Your password *</label>
							    			<input type="password" class="form-control" id="register-password-2" name="password" required>
							    		</div><!-- End .form-group -->

							    		<div class="form-footer">
							    			<button type="submit" class="btn btn-outline-primary-2">
			                					<span>SIGN UP</span>
			            						<i class="icon-long-arrow-right"></i>
			                				</button>

			                				<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="register-policy-2" required>
												<label class="custom-control-label" for="register-policy-2">I agree to the <a href="#myModal" data-toggle="modal">privacy policy</a> *</label>
											</div><!-- End .custom-checkbox -->
							    		</div><!-- End .form-footer -->
							    	</form>

								<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true"><h4 class="modal-title">x</h4></button>
												
											</div>
											<h2>Privacy Policy</h2> <p> Crispy Fhres built the Drag Racing Lights app as a Commercial app. This SERVICE is provided by
							                    Crispy Fhres  and is intended for use as is.
							                  </p> <p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure
							                    of Personal Information if anyone decided to use my Service.
							                  </p> <p>If you choose to use my Service, then you agree to the collection and use of information in
							                    relation to this policy. The Personal Information that I collect is used for providing and improving
							                    the Service. I will not use or share your information with anyone except as described
							                    in this Privacy Policy.
							                  </p> <p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is
							                    accessible at Drag Racing Lights unless otherwise defined in this Privacy Policy.
							                  </p> <p><strong>Information Collection and Use</strong></p> <p>For a better experience, while using our Service, I may require you to provide us with certain
							                    personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.
							                  </p> <p>The app does use third party services that may collect information used to identify you.</p> <div><p>Link to privacy policy of third party service providers used by the app</p> <ul><li><a href="https://www.google.com/policies/privacy/" target="_blank">Google Play Services</a></li><!----><!----><!----><!----><!----><!----><!----></ul></div> <p><strong>Log Data</strong></p> <p> I want to inform you that whenever you use my Service, in a case of
							                    an error in the app I collect data and information (through third party products) on your phone
							                    called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address,
							                    device name, operating system version, the configuration of the app when utilizing my Service,
							                    the time and date of your use of the Service, and other statistics.
							                  </p> <p><strong>Cookies</strong></p> <p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers.
							                    These are sent to your browser from the websites that you visit and are stored on your device's internal
							                    memory.
							                  </p> <p>This Service does not use these “cookies” explicitly. However, the app may use third party code and
							                    libraries that use “cookies” to collect information and improve their services. You have the option to
							                    either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose
							                    to refuse our cookies, you may not be able to use some portions of this Service.
							                  </p> <p><strong>Service Providers</strong></p> <p> I may employ third-party companies and individuals due to the following reasons:</p> <ul><li>To facilitate our Service;</li> <li>To provide the Service on our behalf;</li> <li>To perform Service-related services; or</li> <li>To assist us in analyzing how our Service is used.</li></ul> <p> I want to inform users of this Service that these third parties have access to
							                    your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However,
							                    they are obligated not to disclose or use the information for any other purpose.
							                  </p> <p><strong>Security</strong></p> <p> I value your trust in providing us your Personal Information, thus we are striving
							                    to use commercially acceptable means of protecting it. But remember that no method of transmission over
							                    the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee
							                    its absolute security.
							                  </p> <p><strong>Links to Other Sites</strong></p> <p>This Service may contain links to other sites. If you click on a third-party link, you will be directed
							                    to that site. Note that these external sites are not operated by me. Therefore, I strongly
							                    advise you to review the Privacy Policy of these websites. I have no control over
							                    and assume no responsibility for the content, privacy policies, or practices of any third-party sites
							                    or services.
							                  </p> <p><strong>Children’s Privacy</strong></p> <p>These Services do not address anyone under the age of 13. I do not knowingly collect
							                    personally identifiable information from children under 13. In the case I discover that a child
							                    under 13 has provided me with personal information, I immediately delete this from
							                    our servers. If you are a parent or guardian and you are aware that your child has provided us with personal
							                    information, please contact me so that I will be able to do necessary actions.
							                  </p> <p><strong>Changes to This Privacy Policy</strong></p> <p> I may update our Privacy Policy from time to time. Thus, you are advised to review
							                    this page periodically for any changes. I will notify you of any changes by posting
							                    the new Privacy Policy on this page. These changes are effective immediately after they are posted on
							                    this page.
							                  </p> <p><strong>Contact Us</strong></p> <p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact
							                    me.
							                  </p> <p>This privacy policy page was created at <a href="https://privacypolicytemplate.net" target="_blank">privacypolicytemplate.net</a>
							                    and modified/generated by <a href="https://app-privacy-policy-generator.firebaseapp.com/" target="_blank">App
							                      Privacy Policy Generator</a></p>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->

								<!-- <div class="form-choice">
								    	<p class="text-center">or sign in with</p>
								    	<div class="row">
								    		<div class="col-sm-6">
								    			<a href="#" class="btn btn-login btn-g">
								    				<i class="icon-google"></i>
								    				Login With Google
								    			</a>
								    		</div>End .col-6
								    		<div class="col-sm-6">
								    			<a href="#" class="btn btn-login  btn-f">
								    				<i class="icon-facebook-f"></i>
								    				Login With Facebook
								    			</a>
								    		</div>End .col-6
								    	</div>End .row
							    	</div>End .form-choice -->
							    </div><!-- .End .tab-pane -->
							</div><!-- End .tab-content -->
						</div><!-- End .form-tab -->
            		</div><!-- End .form-box -->
            	</div><!-- End .container -->
            </div><!-- End .login-page section-bg -->
        </main><!-- End .main -->

        <%@include file="footer.jsp" %>
    </div><!-- End .page-wrapper -->
    <button id="scroll-top" title="Back to Top"><i class="icon-arrow-up"></i></button>

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

	<%
								String msg = request.getParameter("msg");
								if ("register".equals(msg)) {
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
								  title: '<p style="font-size:15px;">Register successfully</p>'
								})
								</script>
							<%
								}
							%>
							<%
							if ("invalid".equals(msg)) {
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
								  title: '<p style="font-size:15px;">Invalid email/password</p>'
								})
								</script>
							<%
								}
							%>
							<%
							if ("sem".equals(msg)) {
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
								  title: '<p style="font-size:15px;">Email already used </p>'
								})
								</script>
							<%
								}
							%>
							<%
							if ("change".equals(msg)) {
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
								  title: '<p style="font-size:15px;">Password reset successfully</p>'
								})
								</script>
							<%
								}
							%>
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


<!-- Mirrored from portotheme.com/html/molla/login.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Dec 2021 07:22:20 GMT -->
</html>