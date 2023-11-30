<%@page import="pojo.Team"%>
<%@include file="admin-header.jsp"%>
<%
	Team t=(Team)session.getAttribute("t");
%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Edit Team</h4>

                    <form class="forms-sample" action="EditTeam" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                	<input type="hidden" name="id" value="<%=t.getId()%>">
                                    <label for="exampleInputName1">Team Name</label>
                                    <input type="text" id="catname" name="name" value="<%=t.getName()%>" class="form-control" placeholder="Category Name" onblur="checkCatName()">
                                    <span id="catnameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                                
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="exampleInputName1">Team Position</label>
                                    <input type="text" id="catname" name="position" value="<%=t.getPosition()%>" class="form-control" placeholder="Category Name" onblur="checkCatName()">
                                    <span id="catnameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                                
                            </div>
                            
                            <div class="col-12">
                            <div class="form-group">
                                    <label>Team Image</label>
                                    <input type="file" name="img" value="<%=t.getImg()%>" id="promainimg" class="file-upload-default" onchange="">
                                    <div class="input-group col-xs-12">
                                        <input type="text" value="<%=t.getImg()%>" id="promainimg-text" class="form-control file-upload-info" disabled placeholder="Upload Category Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="promainimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                              </div>  
                            
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="exampleInputName1">Instagram link</label>
                                    <input type="url" id="catname" name="instagram" value="<%=t.getInstagram()%>" class="form-control" placeholder="Category Name" onblur="checkCatName()">
                                    <span id="catnameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                                
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="exampleInputName1">Twitter link</label>
                                    <input type="url" id="catname" name="twitter" value="<%=t.getTwitter()%>" class="form-control" placeholder="Category Name" onblur="checkCatName()">
                                    <span id="catnameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                                
                            </div>
                             <div class="col-4">
                                <div class="form-group">
                                    <label for="exampleInputName1">Facebook link</label>
                                    <input type="url" id="catname" name="facebook" value="<%=t.getFacebook()%>" class="form-control" placeholder="Category Name" onblur="checkCatName()">
                                    <span id="catnameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                                
                            </div>
                            <!-- <div class="col-md-4">
                                <div class="form-group">
                                    <label>Availability</label>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-check">
                                                <label for="availability1" class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="availability" id="availability1" value="yes" checked>
                                                    In Stock
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="form-check">
                                                <label for="availability2" class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="availability" id="availability2" value="no">
                                                    Out of Stock
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <div class="col-12">
                                <button type="submit" onclick="return validate()" class="btn btn-primary mr-2">Submit</button>
                                <a href="admin-teams.jsp" class="btn btn-light">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function checkCatName(){
        let catname = document.getElementById('catname').value;
        let catnameerr = document.getElementById('catnameerr');
        let m = /^[a-zA-Z ]+$/
        if(catname == ""){
            catnameerr.innerHTML = "Please enter the category name";
        }
        else if(!catname.match(m)){
            catnameerr.innerHTML = "Category name can only have letters";
        }
        else{
            catnameerr.innerHTML = "";
        }
    }
    function validate(){
        
    let catname = document.getElementById('catname').value;        
    let catnameerr = document.getElementById('catnameerr');
    let m = /^[a-zA-Z ]+$/
        
        if(catname == ""){
            catnameerr.innerHTML = "Please enter the category name";
            return false;
        }
        else if(!catname.match(m)){
            catnameerr.innerHTML = "Category name can only have letters";
            return false;
        }
        else{
            return true
        }
    }
</script>
<%@include file="admin-footer.jsp"%>