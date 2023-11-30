<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Edit GiftBox : <span class="text-primary"><?php echo $fetch['boxname']; ?></span></h4>
                    <?php
                    if (isset($_SESSION['err'])) {
                        echo $_SESSION['err'];
                        unset($_SESSION['err']);
                    }
                    ?>
                    <form class="forms-sample" action="updategiftbox.jsp" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <input type="hidden" name="id" value="<?php echo $fetch['id']; ?>">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputName1">GiftBox Name</label>
                                    <input type="text" name="giftname" class="form-control" id="giftname" onblur="checkgiftname()" placeholder="Giftbox Name" value="<?php echo $fetch['boxname']; ?>">
                                    <span id="giftnameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Products</label>
                                    <select name="products[]" class="js-example-basic-multiple w-100" id="products" onchange="checkproduct()" multiple="multiple">
                                        <option value="">Select product</option>
                                        <?php
                                        $sql = "SELECT * FROM product";
                                        $res = mysqli_query($conn, $sql);
                                        while ($f = mysqli_fetch_array($res)) {
                                        ?>
                                            <option value="<?php echo $f['id']; ?></option>
                                        <?php
                                        }

                                        ?>
                                    </select>
                                    <span id="productserr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Product Price</label>
                                    <input type="text" name="giftprice" class="form-control" id="giftprice" onblur="checkgiftprice()" placeholder="Giftbox Price" value="<?php echo $fetch['price']; ?>">
                                    <span id="giftpriceerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Product Discount Price</label>
                                    <input type="text" name="giftdisprice" class="form-control" id="giftdisprice" onblur="checkgiftdisprice()" placeholder="Giftbox Discount Price" value="<?php echo $fetch['rpri']; ?>">
                                    <span id="giftdispriceerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">GiftBox Description</label>
                                    <textarea class="form-control" name="giftdesc" id="prodesc" rows="7" placeholder="Product Description" onblur="checkprodesc()" style="resize:auto"><?php echo $fetch['detailsinfo']; ?></textarea>
                                    <span id="prodeserr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">GiftBox Information</label>
                                    <textarea class="form-control" name="giftinfo" id="proinfo" rows="7" placeholder="Product Information" onblur="checkproinfo()" style="resize:auto"><?php echo $fetch['productinfo']; ?></textarea>
                                    <span id="proinfoerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div style="height:230px">
                                            <h6>Giftbox Main Image:</h6>
                                            <img src="<?php echo $fetch['primaryimg']; ?>" alt="bimage" width="150" /><br />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div style="height:230px">
                                            <h6>Giftbox Second Image:</h6>
                                            <?php
                                            if ($fetch['img2'] == "giftboximage/") {
                                                echo "<p>No image uploaded</p>";
                                            } else {
                                            ?>
                                                <img src="<?php echo $fetch['img2']; ?>" alt="bimage" width="150" /><br />
                                                <a href="" class="btn btn-sm btn-primary mt-1">Remove</a>
                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div style="height:230px">
                                            <h6>Giftbox Third Image:</h6>
                                            <?php
                                            if ($fetch['img3'] == "giftboximage/") {
                                                echo "<p>No image uploaded</p>";
                                            } else {
                                            ?>
                                                <img src="<?php echo $fetch['img3']; ?>" alt="bimage" width="150" /><br />
                                                <a href="" class="btn btn-sm btn-primary mt-1">Remove</a>
                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div style="height:230px">
                                            <h6>Giftbox Fourth Image:</h6>
                                            <?php
                                            if ($fetch['img4'] == "giftboximage/") {
                                                echo "<p>No image uploaded</p>";
                                            } else {
                                            ?>
                                                <img src="<?php echo $fetch['img4']; ?>" alt="bimage" width="150" /><br />
                                                <a href="" class="btn btn-sm btn-primary mt-1">Remove</a>
                                            <?php
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>GiftBox Main Image</label>
                                    <input type="hidden" name="giftmaincurrimg" value="<?php echo $fetch['primaryimg']; ?>" />
                                    <input type="file" name="giftmainimg" class="file-upload-default" id="promainimg" onchange="checkpromainimg()">
                                    <div class="input-group col-xs-12">
                                        <input type="text" id="promainimg-text" class="form-control file-upload-info" disabled placeholder="Upload Main Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="promainimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Second Image</label>
                                    <input type="hidden" name="giftsecondcurrimg" value="<?php echo $fetch['img2']; ?>" />
                                    <input type="file" name="giftsecondimg" class="file-upload-default" id="prosecondimg" onchange="checkprosecondimg()">
                                    <div class="input-group col-xs-12">
                                        <input type="text" id="prosecondimg-text" class="form-control file-upload-info" disabled placeholder="Upload Second Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="prosecondimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Third Image</label>
                                    <input type="hidden" name="giftthirdcurrimg" value="<?php echo $fetch['img3']; ?>" />
                                    <input type="file" name="giftthirdimg" id="prothirdimg" class="file-upload-default" onchange="checkprothirdimg()">
                                    <div class="input-group col-xs-12">
                                        <input type="text" id="prothirdimg-text" class="form-control file-upload-info" disabled placeholder="Upload Third Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="prothirdimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Fourth Image</label>
                                    <input type="hidden" name="giftfourthcurrimg" value="<?php echo $fetch['img4']; ?>" />
                                    <input type="file" name="giftfourthimg" id="profourthimg" class="file-upload-default" onchange="checkprofourthimg()">
                                    <div class="input-group col-xs-12">
                                        <input type="text" id="profourthimg-text" class="form-control file-upload-info" disabled placeholder="Upload Fourth Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="profourthimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>GiftBox Quality</label>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" value="Glutin free" class="form-check-input" name="quality[]" >
                                            Glutin Free
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" value="Without Egg" class="form-check-input" name="quality[]" >
                                            Without Egg
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" value="Vegan Friendly" class="form-check-input" name="quality[]" >
                                            Vegan Friendly
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Availability</label>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-check">
                                                <label for="availability1" class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="availability" id="availability1" value="yes">
                                                    In Stock
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="form-check">
                                                <label for="availability2" class="form-check-label">
                                                    <input type="radio" class="form-check-input" name="availability" id="availability2" value="no" >
                                                    Out of Stock
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" onclick="return validate()" class="btn btn-primary mr-2">Submit</button>
                                <a href="giftboxes.jsp" class="btn btn-light">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

function checkgiftname(){
let proname = document.getElementById('giftname').value;
let pronameerr = document.getElementById('giftnameerr');
    if(proname == ""){
        pronameerr.innerHTML = "Please enter the giftbox name";
    }
    else{
        pronameerr.innerHTML = "";
    }
}

function checkproduct(){
let procat = document.getElementById('products').value;
let procaterr = document.getElementById('productserr');
    if(procat == ""){
        procaterr.innerHTML = "Please select the product";
    }
    else{
        procaterr.innerHTML = "";
    }
}
function checkgiftprice(){
    let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/;
    let proprice = document.getElementById('giftprice').value;
    let propriceerr = document.getElementById('giftpriceerr');
    if(proprice == ""){
        propriceerr.innerHTML = "Please enter the giftbox price";
    }
    else if(!proprice.match(m)){
        propriceerr.innerHTML = "Price can only have number";
    }
    else{
        propriceerr.innerHTML = "";
    }
}
function checkgiftdisprice(){
    let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
    let prodisprice = document.getElementById('giftdisprice').value;
    let prodispriceerr = document.getElementById('giftdispriceerr');
              if(prodisprice == ""){
                  prodispriceerr.innerHTML = "";
              }
              else if(!prodisprice.match(m)){
                prodispriceerr.innerHTML = "Price can only have number";
              }
              else{
                propriceerr.innerHTML = "";
              }
}
function checkprodesc(){
              let prodesc = document.getElementById('prodesc').value;
              let prodescerr = document.getElementById('prodeserr');

              if(prodesc == ''){
                  prodescerr.innerHTML = "Please enter the giftbox description";
              }
              else{
                  prodescerr.innerHTML = "";
              }
             }
function checkproinfo(){
              let proinfo = document.getElementById('proinfo').value;
              let proinfoerr = document.getElementById('proinfoerr');

              if(proinfo == ''){
                proinfoerr.innerHTML = "Please enter the giftbox information";
              }
              else{
                  proinfoerr.innerHTML = "";
              }
             }
function checkpromainimg(){
            var fi = document.getElementById('promainimg');
            if (fi.files.length > 0) {      // FIRST CHECK IF ANY FILE IS SELECTED.
    
                for (var i = 0; i <= fi.files.length - 1; i++) {
                    var fileName, fileExtension, fileSize, fileType, fileSize2;
    
                    // FILE NAME AND EXTENSION.
                    fileName = fi.files.item(i).name;
                    fileExtension = fileName.replace(/^.*\./, '');
                    readImageFile(fi.files.item(i));
                    fileSize = fi.files.item(i).size;
                    fileSize2 = Math.round((fileSize / 1024));
                    if ((fileExtension == 'png' || fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'webp') && (fileSize2 <= 1024)) {
                    }
                    else {
                        document.getElementById('promainimg').value = "";
                        document.getElementById('promainimg-text').value = "";
                        document.getElementById('promainimgerr').innerHTML = "Please select valid file format";
                    }
                }
                function readImageFile(file) {
                    var reader = new FileReader(); // CREATE AN NEW INSTANCE.
    
                    reader.onload = function (e) {
                        var img = new Image();
                        img.src = e.target.result;
    
                        img.onload = function () {
                            var w = this.width;
                            var h = this.height;
    
                            if(w > 0 && h > 0){
                                document.getElementById('promainimgerr').innerHTML = "";
                            }
                            else{
                                document.getElementById('promainimg').value="";
                                document.getElementById('promainimg-text').value="";
                                document.getElementById('promainimgerr').style.display ="block";
                                document.getElementById('promainimgerr').innerHTML = "Please select image with dimension 300x200";
                            }
                        }
                    };
                    reader.readAsDataURL(file);
                }
            }
        }
function checkprosecondimg(){
            var fi = document.getElementById('prosecondimg');
            if (fi.files.length > 0) {      // FIRST CHECK IF ANY FILE IS SELECTED.
    
                for (var i = 0; i <= fi.files.length - 1; i++) {
                    var fileName, fileExtension, fileSize, fileType, fileSize2;
    
                    // FILE NAME AND EXTENSION.
                    fileName = fi.files.item(i).name;
                    fileExtension = fileName.replace(/^.*\./, '');
                    readImageFile(fi.files.item(i));
                    fileSize = fi.files.item(i).size;
                    fileSize2 = Math.round((fileSize / 1024));
                    if ((fileExtension == 'png' || fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'webp') && (fileSize2 <= 1024)) {
                    }
                    else {
                        document.getElementById('prosecondimg').value = "";
                        document.getElementById('prosecondimg-text').value = "";
                        document.getElementById('prosecondimgerr').innerHTML = "Please select valid file format";
                    }
                }
                function readImageFile(file) {
                    var reader = new FileReader(); // CREATE AN NEW INSTANCE.
    
                    reader.onload = function (e) {
                        var img = new Image();
                        img.src = e.target.result;
    
                        img.onload = function () {
                            var w = this.width;
                            var h = this.height;
    
                            if(w == 300 && h == 200){
                                document.getElementById('prosecondimgerr').innerHTML = "";
                            }
                            else{
                                document.getElementById('prosecondimg').value="";
                                document.getElementById('prosecondimg-text').value="";
                                document.getElementById('prosecondimgerr').style.display ="block";
                                document.getElementById('prosecondimgerr').innerHTML = "Please select image with dimension 300x200";
                            }
                        }
                    };
                    reader.readAsDataURL(file);
                }
            }
        }
function checkprothirdimg(){
            var fi = document.getElementById('prothirdimg');
            if (fi.files.length > 0) {      // FIRST CHECK IF ANY FILE IS SELECTED.
    
                for (var i = 0; i <= fi.files.length - 1; i++) {
                    var fileName, fileExtension, fileSize, fileType, fileSize2;
    
                    // FILE NAME AND EXTENSION.
                    fileName = fi.files.item(i).name;
                    fileExtension = fileName.replace(/^.*\./, '');
                    readImageFile(fi.files.item(i));
                    fileSize = fi.files.item(i).size;
                    fileSize2 = Math.round((fileSize / 1024));
                    if ((fileExtension == 'png' || fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'webp') && (fileSize2 <= 1024)) {
                    }
                    else {
                        document.getElementById('prothirdimg').value = "";
                        document.getElementById('prothirdimg-text').value = "";
                        document.getElementById('prothirdimgerr').innerHTML = "Please select valid file format";
                    }
                }
                function readImageFile(file) {
                    var reader = new FileReader(); // CREATE AN NEW INSTANCE.
    
                    reader.onload = function (e) {
                        var img = new Image();
                        img.src = e.target.result;
    
                        img.onload = function () {
                            var w = this.width;
                            var h = this.height;
    
                            if(w == 300 && h == 200){
                                document.getElementById('prothirdimgerr').innerHTML = "";
                            }
                            else{
                                document.getElementById('prothirdimg').value="";
                                document.getElementById('prothirdimg-text').value="";
                                document.getElementById('prothirdimgerr').style.display ="block";
                                document.getElementById('prothirdimgerr').innerHTML = "Please select image with dimension 300x200";
                            }
                        }
                    };
                    reader.readAsDataURL(file);
                }
            }
        }
function checkprofourthimg(){
            var fi = document.getElementById('profourthimg');
            if (fi.files.length > 0) {      // FIRST CHECK IF ANY FILE IS SELECTED.
    
                for (var i = 0; i <= fi.files.length - 1; i++) {
                    var fileName, fileExtension, fileSize, fileType, fileSize2;
    
                    // FILE NAME AND EXTENSION.
                    fileName = fi.files.item(i).name;
                    fileExtension = fileName.replace(/^.*\./, '');
                    readImageFile(fi.files.item(i));
                    fileSize = fi.files.item(i).size;
                    fileSize2 = Math.round((fileSize / 1024));
                    if ((fileExtension == 'png' || fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'webp') && (fileSize2 <= 1024)) {
                    }
                    else {
                        document.getElementById('profourthimg').value = "";
                        document.getElementById('profourthimg-text').value = "";
                        document.getElementById('profourthimgerr').innerHTML = "Please select valid file format";
                    }
                }
                function readImageFile(file) {
                    var reader = new FileReader(); // CREATE AN NEW INSTANCE.
    
                    reader.onload = function (e) {
                        var img = new Image();
                        img.src = e.target.result;
    
                        img.onload = function () {
                            var w = this.width;
                            var h = this.height;
    
                            if(w == 300 && h == 200){
                                document.getElementById('profourthimgerr').innerHTML = "";
                            }
                            else{
                                document.getElementById('profourthimg').value="";
                                document.getElementById('profourthimg-text').value="";
                                document.getElementById('profourthimgerr').style.display ="block";
                                document.getElementById('profourthimgerr').innerHTML = "Please select image with dimension 300x200";
                            }
                        }
                    };
                    reader.readAsDataURL(file);
                }
            }
        }
             
    function validate(){
        
    var proname = document.getElementById('giftname').value;
    var pronameerr = document.getElementById('giftnameerr');
    var procat = document.getElementById('products').value;
    var procaterr = document.getElementById('productserr');
    var m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/;
    var proprice = document.getElementById('giftprice').value;
    var propriceerr = document.getElementById('giftpriceerr');
    var prodisprice = document.getElementById('giftdisprice').value;
    var prodispriceerr = document.getElementById('giftdisprice');
    var prodesc = document.getElementById('prodesc').value;
    var prodescerr = document.getElementById('prodeserr');
    var proinfo = document.getElementById('proinfo').value;
    var proinfoerr = document.getElementById('proinfoerr');
    var promainimg = document.getElementById('promainimg').value;
    var promainimgerr = document.getElementById('promainimgerr');
        
        if(proname == "" && procat == "" && proprice == "" && prodesc == "" && proinfo == ""){
            pronameerr.innerHTML = "Please enter the giftbox name";
            procaterr.innerHTML = "Please select the product";
            propriceerr.innerHTML = "Please enter the giftbox price";
            prodescerr.innerHTML = "Please enter the giftbox description";
            proinfoerr.innerHTML = "Please enter the giftbox information";
            return false;
        }
        else if(proname == ""){
            pronameerr.innerHTML = "Please enter the giftbox name";
            procaterr.innerHTML = "";
            propriceerr.innerHTML = "";
            prodispriceerr.innerHTML = "";
            prodescerr.innerHTML = "";
            proinfoerr.innerHTML = "";
            return false;
        }
        else if(procat == ""){
            pronameerr.innerHTML = "";
            procaterr.innerHTML = "Please select the product";
            propriceerr.innerHTML = "";
            prodispriceerr.innerHTML = "";
            prodescerr.innerHTML = "";
            proinfoerr.innerHTML = "";
            return false;
        }
        else if(proprice == ""){
            pronameerr.innerHTML = "";
            procaterr.innerHTML = "";
            propriceerr.innerHTML = "Please enter the giftbox price";
            prodispriceerr.innerHTML = "";
            prodescerr.innerHTML = "";
            proinfoerr.innerHTML = "";
            return false;
        }
        else if(!proprice.match(m)){
            pronameerr.innerHTML = "";
            procaterr.innerHTML = "";
            propriceerr.innerHTML = "Price can only have number";
            prodispriceerr.innerHTML = "";
            prodescerr.innerHTML = "";
            proinfoerr.innerHTML = "";
            return false;
        }
        else if(prodesc == ""){
            pronameerr.innerHTML = "";
            procaterr.innerHTML = "";
            propriceerr.innerHTML = "";
            prodispriceerr.innerHTML = "";
            prodescerr.innerHTML = "Please enter the giftbox description";
            proinfoerr.innerHTML = "";
            return false;
        }
        else if(proinfo == ""){
            pronameerr.innerHTML = "";
            procaterr.innerHTML = "";
            propriceerr.innerHTML = "";
            prodispriceerr.innerHTML = "";
            prodescerr.innerHTML = "";
            proinfoerr.innerHTML = "Please enter the giftbox information";
            return false;
        }
        else{
            return true
        }
    }
</script>
<%@include file="admin-footer.jsp"%>