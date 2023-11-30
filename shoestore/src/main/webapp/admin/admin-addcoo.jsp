<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Add country of origin</h4>
                   
                    <form class="forms-sample" action="insertcoo.jsp" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="exampleInputName1">Country of origin</label>
                                    <input type="text" id="catname" name="catname" class="form-control" placeholder="Category Name" onblur="checkCatName()">
                                    <span id="catnameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Image</label>
                                    <input type="file" name="promainimg" id="promainimg" class="file-upload-default" onchange="">
                                    <div class="input-group col-xs-12">
                                        <input type="text" id="promainimg-text" class="form-control file-upload-info" disabled placeholder="Upload Main Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="promainimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" onclick="return validate()" class="btn btn-primary mr-2">Submit</button>
                                <a href="coo.jsp" class="btn btn-light">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function checkCatName() {
        let catname = document.getElementById('catname').value;
        let catnameerr = document.getElementById('catnameerr');
        let m = /^[a-zA-Z ]+$/
        if (catname == "") {
            catnameerr.innerHTML = "Please enter the category name";
        } else if (!catname.match(m)) {
            catnameerr.innerHTML = "Category name can only have letters";
        } else {
            catnameerr.innerHTML = "";
        }
    }

    function validate() {

        let catname = document.getElementById('catname').value;
        let catnameerr = document.getElementById('catnameerr');
        let m = /^[a-zA-Z ]+$/

        if (catname == "") {
            catnameerr.innerHTML = "Please enter the category name";
            return false;
        } else if (!catname.match(m)) {
            catnameerr.innerHTML = "Category name can only have letters";
            return false;
        } else {
            return true
        }
    }
</script>
<%@include file="admin-footer.jsp"%>