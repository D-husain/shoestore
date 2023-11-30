<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Edit Country of Origin : <span class="text-primary"><?php echo $fetch['name']; ?></span></h4>
                    <?php
                    if (isset($_SESSION['err'])) {
                        echo $_SESSION['err'];
                        unset($_SESSION['err']);
                    }
                    ?>
                    <form class="forms-sample" action="updatecoo.jsp" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <input type="hidden" name="id" value="<?php echo $fetch['id']; ?>" />
                            <input type="hidden" name="old" value="<?php echo $fetch['image']; ?>" />
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="exampleInputName1">Country of origin</label>
                                    <input type="text" id="catname" value="<?php echo $fetch['name']; ?>" name="catname" class="form-control" placeholder="Category Name" onblur="checkCatName()">
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
                                <button type="submit" onclick="" class="btn btn-primary mr-2">Submit</button>
                                <a href="coo.jsp" class="btn btn-light">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('.jqte-test').jqte();

    // settings of status
    var jqteStatus = true;
    $(".status").click(function() {
        jqteStatus = jqteStatus ? false : true;
        $('.jqte-test').jqte({
            "status": jqteStatus
        })
    });
</script>
<%@include file="admin-footer.jsp"%>