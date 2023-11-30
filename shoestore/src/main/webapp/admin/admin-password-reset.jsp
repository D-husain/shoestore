<%@include file="admin-header.jsp"%>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>So Moorish - Admin Panel</title>
    <!-- base:css -->
    <link rel="stylesheet" href="vendors/typicons/typicons.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="vendors/select2/select2.min.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="images/favicon.png" />



    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <style>
        ::-webkit-scrollbar {
            width: 3px;
            height: 3px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background-color: #d4d4d4;
            border-radius: 5px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #ba2026;
            border-radius: 5px;
        }
    </style>
</head>

<div class="content-wrapper">
    <div class="row justify-content-center align-items-center" style="height:90vh">
        <div class="col-md-6 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Reset Password</h4>
                    <div class="mt-5" id="resetform">
                    <form class="forms-sample" action="resetpasswordaction.jsp" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <input type="hidden" name="token" value="<?php echo $token; ?>"/>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="exampleInputName1">Email</label>
                                    <input type="text" name="email" class="form-control" value="<?php echo $email; ?>" id="exampleInputName1" placeholder="registered email" readonly>
                                </div>
                            </div>
                            <div class="col-12">
                                 <div class="form-group">
                                    <label for="exampleInputName1">Password</label>
                                    <input type="password" name="pass" class="form-control" value="" id="pass" onblur="checkpass()" placeholder="new password">
                                    <span style="font-size:14px" class="text-danger" id="passerr"></span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="exampleInputName1">Confirm password</label>
                                    <input type="password" name="cpass" class="form-control" value="" id="cpass" onblur="checkcpass()" placeholder="confirm password">
                                    <span style="font-size:14px" class="text-danger" id="cpasserr"></span>
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" onclick="return validate()" class="btn btn-primary mr-2">Submit</button>
                                <a href="https://somoorish.com.au/admin/" class="btn btn-light">Cancel</a>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

function checkpass(){
    let pass = document.getElementById('pass').value;
    let passerr = document.getElementById('passerr');
    let pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/
     if(pass == ""){
            passerr.innerHTML = "Please enter the new password";
        }
        else if(!pass.match(pattern)){
            passerr.innerHTML = "Password should contain one special character and one number";
        }
        else{
            passerr.innerHTML = ""
        }
        
}
function checkcpass(){
    let cpass = document.getElementById('cpass').value;
    let cpasserr = document.getElementById('cpasserr');
    let pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/
     if(cpass == ""){
            cpasserr.innerHTML = "Please confirm your password";
        }
        else if(!cpass.match(pattern)){
            cpasserr.innerHTML = "Confirm password should contain one special character and one number";
        }
        else{
            cpasserr.innerHTML = ""
        }
        
}

    function validate(){
        let pass = document.getElementById('pass').value;
        let passerr = document.getElementById('passerr');
        let cpass = document.getElementById('cpass').value;
        let cpasserr = document.getElementById('cpasserr');
        let pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/
        
        
        if(pass == "" && cpass == ""){
            passerr.innerHTML = "Please enter the new password";
            cpasserr.innerHTML = "Please confirm your password";
            return false;
        }
        else if(pass == ""){
            passerr.innerHTML = "Please enter the new password";
            cpasserr.innerHTML = ""
            return false
        }
        else if(!pass.match(pattern)){
            passerr.innerHTML = "Password should contain one special character and one number";
            cpasserr.innerHTML = ""
            return false
        }
        else if(cpass == ""){
            cpasserr.innerHTML = "Please confirm your password";
            passerr.innerHTML = ""
            return false
        }
        else if(!cpass.match(pattern)){
            cpasserr.innerHTML = "Confirm password should contain one special character and one number";
            passerr.innerHTML = ""
            return false
        }
        else{
            return true
        }
        
    }
</script>
<script src="vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="vendors/chart.js/Chart.min.js"></script>
<script src="vendors/select2/select2.min.js"></script>
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="js/off-canvas.js"></script>
<script src="js/hoverable-collapse.js"></script>
<script src="js/template.js"></script>
<script src="js/settings.js"></script>
<script src="js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="js/file-upload.js"></script>
<script src="js/dashboard.js"></script>
<script src="js/select2.js"></script>
<!-- End custom js for this page-->

<script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>
</body>

</html>