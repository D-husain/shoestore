<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Edit sub category : <span class="text-primary"><?php echo $fetch['name']; ?></span></h4>
                    <?php

                    if (isset($_SESSION['err'])) {
                        echo $_SESSION['err'];
                        unset($_SESSION['err']);
                    }
                    ?>
                    <form class="forms-sample" action="updatesubcategory.jsp" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <input type="hidden" name="id" value="<?php echo $fetch['id']; ?>" />
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="exampleInputName1">Category</label>
                                    <select name="category" id="cat" class="form-control" onchange="checkcategory()">
                                        <option value="" hidden selected disabled>Select category</option>
                                        <?php
                                        $sql2 = "SELECT * FROM category";
                                        $res2 = mysqli_query($conn, $sql2);
                                        while ($fetch2 = mysqli_fetch_assoc($res2)) {
                                        ?>
                                            <option value="<?php echo $fetch2['id']; ?>" ></option>
                                        <?php
                                        } ?>
                                    </select>
                                    <span id="caterr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="exampleInputName1">Sub Category Name</label>
                                    <input type="text" value="<?php echo $fetch['name']; ?>" id="catname" name="catname" class="form-control" placeholder="Category Name" onblur="checkCatName()">
                                    <span id="catnameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Availability</label>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-check">
                                                <label for="availability1" class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="availability" id="availability1" value="yes" >
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
                            </div>
                            <div class="col-12">
                                <button type="submit" onclick="return validate()" class="btn btn-primary mr-2">Submit</button>
                                <a href="subcategory.jsp" class="btn btn-light">Cancel</a>
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
    function checkcategory() {
        let cat = document.getElementById('cat').value;
        let caterr = document.getElementById('caterr');
        if (cat == "") {
            caterr.innerHTML = "Please enter the category name";
        }
        else {
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