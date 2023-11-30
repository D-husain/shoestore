<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Edit Profile : <span class="text-primary"><%=admin.getName()%></span></h4>
                     	<%
									String msg = request.getParameter("msg");
									if ("notmatch".equals(msg)) {
								%>
								<p class="alert">Email Does Not Exists.</p>
								<%
									}
								%>
                     
                    <form class="forms-sample" action="updateprofile" method="POST">
                        <div class="row">
                            <input type="hidden" name="id" value="<%=admin.getId()%>" />
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="exampleInputName1">Username</label>
                                    <input type="text" name="name" id="user" onblur="checkuser()" class="form-control" value="<%=admin.getName()%>" id="exampleInputName1" placeholder="Username">
                                    <span style="font-size:14px" class="text-danger" id="usererr"></span>
                                </div>
                            </div>

                            <div class="col-12">
                                <button type="submit" onclick="return validate()" class="btn btn-primary mr-2">Submit</button>
                               <button  type="reset" class="btn btn-light">Cancel</button>
                                <button id="resetbtn" type="button" class="btn btn-info">Reset Password</button>
                            </div>
                        </div>
                    </form>
                    <div class="mt-5" id="resetform">
                        <h4>Reset password</h4>
                    <form class="forms-sample" action="AdminReset" method="POST">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="exampleInputName1">Email</label>
                                    <input type="text" name="email" id="email" onblur="checkemail()" class="form-control" value="" id="exampleInputName1" placeholder="registered email">
                                    <span style="font-size:14px" class="text-danger" id="emailerr"></span>
                                </div>
                            </div>

                            <div class="col-12">
                                <button type="submit" onclick="return validate1()" class="btn btn-primary mr-2">Submit</button>
                                <button id="clsbtn" type="button" class="btn btn-light">Cancel</button>
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
    function checkuser(){
        let user = document.getElementById('user').value;
        let usererr = document.getElementById('usererr');
        if(user == ""){
            usererr.innerHTML = "Please enter the username";
        }
        else{
            usererr.innerHTML = "";
        }
    }
    function checkemail(){
        let email = document.getElementById('email').value;
        let emailerr = document.getElementById('emailerr');
        let pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
        if(email == ""){
            emailerr.innerHTML = "Please enter the email";
        }
        else if(!email.match(pattern)){
            emailerr.innerHTML = "Please enter valid email";
        }
        else{
            emailerr.innerHTML = "";
        }
    }
    
    
    function validate(){
        let user = document.getElementById('user').value;
        let usererr = document.getElementById('usererr');
        if(user == ""){
            usererr.innerHTML = "Please enter the username";
            return false;
        }
        else{
            usererr.innerHTML = "";
            return true;
        }
    }
    function validate1(){
        let email = document.getElementById('email').value;
        let emailerr = document.getElementById('emailerr');
        let pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
        if(email == ""){
            emailerr.innerHTML = "Please enter the email";
            return false;
        }
        else if(!email.match(pattern)){
            emailerr.innerHTML = "Please enter valid email";
        }
        else{
            emailerr.innerHTML = "";
            return true;
        }
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $('#resetform').hide();
    $('#resetbtn').click(function(){
        $('#resetform').toggle(300);
    })
    $('#clsbtn').click(function(){
        $('#resetform').toggle(200);
    })
})
</script>
<%@include file="admin-footer.jsp"%>