<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Panel</title>
    <!-- base:css -->
    <link rel="stylesheet" href="./admin/admin-assets/vendors/typicons/typicons.css">
    <link rel="stylesheet" href="./admin/admin-assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="./admin/admin-assets/css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="assets/images/demos/demo-10/shoe-logo-footers.png" />
</head>

<body>
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper d-flex align-items-center auth px-0">
                <div class="row w-100 mx-0">
                    <div class="col-lg-4 mx-auto">
                        <div class="auth-form-light py-5 px-4 px-sm-5">
                            <div class="brand-logo text-center">
                                <img src="assets/images/demos/demo-10/shoe-logo.png" alt="logo">
                            </div>
                            <h4 class='text-center'>Welcome Back!</h4>
                            <h6 class="font-weight-light mb-4 text-center">Login in to continue.</h6>
                           <%
									String msg = request.getParameter("msg");
									if ("notmatch".equals(msg)) {
								%>
								<div class="alert alert-warning alert-dismissible fade show"
									role="alert">
									<strong> New & Confirm</strong> New Password Does Not Matched.
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<%
									}
								%>
                            <form method="POST" action="AdminNewPassword">
                                <div class="form-group">
                                    <input type="password" name="password" onblur="checkpassword()" class="form-control form-control-lg" id="password" placeholder="New Password">
                                    <span class='text-danger' id="passworderr" style="font-size:14px;"></span>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="confPassword" onblur="checkpassword()" class="form-control form-control-lg" id="password" placeholder="Confirm Password">
                                    <span class='text-danger' id="passworderr" style="font-size:14px;"></span>
                                </div>
                                <div class="mt-3">
                                    <button onclick="return validate()" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="admin-index.jsp">Forgot Password</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- base:js -->
    <script src="./admin/admin-assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script src="./admin/admin-assets/js/off-canvas.js"></script>
    <script src="./admin/admin-assets/js/hoverable-collapse.js"></script>
    <script src="./admin/admin-assets/js/template.js"></script>
    <script src="./admin/admin-assets/js/settings.js"></script>
    <script src="./admin/admin-assets/js/todolist.js"></script>
    <script>
        function checkusername(){
            let username = document.getElementById("username").value;
            let usernameerr = document.getElementById("usernameerr");
            if(username == ""){
                usernameerr.innerHTML = "Please enter the username";
            }
            else{
                usernameerr.innerHTML = "";
            }
        }
        function checkpassword(){
            let password = document.getElementById("password").value;
            let passworderr = document.getElementById("passworderr");
            if(password == ""){
                passworderr.innerHTML = "Please enter the password";
            }
            else{
                passworderr.innerHTML = "";
            }
        }
        function validate(){
            let username = document.getElementById("username").value;
            let usernameerr = document.getElementById("usernameerr");
            let password = document.getElementById("password").value;
            let passworderr = document.getElementById("passworderr");
            if(username == "" && password == ""){
                usernameerr.innerHTML = "Please enter the username";
                passworderr.innerHTML = "Please enter the password";
                return false;
            }
            else if(username == ""){
                usernameerr.innerHTML = "Please enter the username";
                passworderr.innerHTML = "";
                return false;
            }
            else if(password == ""){
                usernameerr.innerHTML = "";
                passworderr.innerHTML = "Please enter the password";
                return false;
            }
            else{
                return true;
            }
        }
    </script>
    <!-- endinject -->
</body>

</html>