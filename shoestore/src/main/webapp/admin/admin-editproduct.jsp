<%@page import="pojo.Product"%>
<%@page import="dao.AdminDao"%>
<%@page import="pojo.Category"%>
<%@page import="java.util.List"%>
<%@include file="admin-header.jsp"%>
<%
	Product p=(Product)session.getAttribute("p");
%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Edit Product</h4>
                    
                    <form class="forms-sample" action="EditProduct" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="<%=p.getId()%>">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Product Name</label>
                                    <input type="text" name="pname" class="form-control" value="<%=p.getPname()%>" id="proname" placeholder="Product Name" onblur="">
                                    <span id="pronameerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <%
                        	AdminDao adao=new AdminDao();
                        	List<Category>list =adao.ShowCategory();
                        	session.setAttribute("cat", list);
                        %>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Product Category</label>
                                    <select name="cname" id="procat" class="form-control">
                                        <option value="<%=p.getCategory().getCname()%>" disabled selected ><%out.print(p.getCategory().getCname()); %></option>
                                        <%
                                        	for(Category c:list){
                                        %>
										<option value="<%=c.getCname()%>"><%=c.getCname()%></option>
										<%
											}
										%>
                                    </select>
                                    <span id="procaterr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Product Size</label>
                                    <select name="size" id="procat" class="form-control">
                                        <option value="<%=p.getSize()%>" disabled selected ><%out.print(p.getSize());%></option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
                                    </select>
                                    <span id="procaterr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <!-- <div class="col-md-6">
                                <div class="form-group">
                                    <label>Product Sub Category</label>
                                    <select name="prosubcat" id="prosubcat" onchange="" class="form-control">
                                    </select>
                                    <span id="prosubcaterr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div> -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Product Image 1</label>
                                    <input type="file" name="image1" id="promainimg" class="file-upload-default" onchange="">
                                    <div class="input-group col-xs-12">
                                        <input type="text" id="promainimg-text" class="form-control file-upload-info" disabled placeholder="Upload Main Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="promainimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                                <div class="form-group">
                                    <label>Product Image 2</label>
                                    <input type="file" name="image2" id="promainimg" class="file-upload-default" onchange="">
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
                                    <label>Product Image 3</label>
                                    <input type="file" name="image3" id="promainimg" class="file-upload-default" onchange="">
                                    <div class="input-group col-xs-12">
                                        <input type="text" id="promainimg-text" class="form-control file-upload-info" disabled placeholder="Upload Main Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="promainimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                                <div class="form-group">
                                    <label>Product Image 4</label>
                                    <input type="file" name="image4" id="promainimg" class="file-upload-default" onchange="">
                                    <div class="input-group col-xs-12">
                                        <input type="text" id="promainimg-text" class="form-control file-upload-info" disabled placeholder="Upload Main Image">
                                        <span class="input-group-append">
                                            <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                                        </span>
                                    </div>
                                    <span id="promainimgerr" class="text-danger" style="font-size:14px"></span>
                                </div>	
                            </div>
                            <!-- <div class="col-md-6">
                                <div class="form-group">
                                    <label>Product Quality</label>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" value="Glutin free" class="form-check-input" name="quality[]">
                                            Glutin Free
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" value="Without Egg" class="form-check-input" name="quality[]">
                                            Without Egg
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" value="Vegan Friendly" class="form-check-input" name="quality[]">
                                            Vegan Friendly
                                        </label>
                                    </div>
                                </div>
                            </div> -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Product Description</label>
                                    <textarea class="form-control" name="description" id="prodesc" rows="7" placeholder="Product Description" style="resize:auto" onblur=""><%out.print(p.getDescription()); %></textarea>
                                    <span id="prodeserr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Information</label>
                                    <textarea class="form-control" name="info" id="ingredients" rows="7" placeholder="Product Information" style="resize:auto" onblur=""><%out.print(p.getInfo()); %></textarea>
                                    <span id="prodeserr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <!-- 
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Health Benefits</label>
                                    <textarea class="form-control" name="hb" id="hb" rows="7" placeholder="Product Description" style="resize:auto" onblur=""></textarea>
                                    <span id="prodeserr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Storage Instruction</label>
                                    <textarea class="form-control" name="si" id="si" rows="7" placeholder="Product Description" style="resize:auto" onblur=""></textarea>
                                    <span id="prodeserr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">How To Use</label>
                                    <textarea class="form-control" name="htu" id="" rows="7" placeholder="Product Description" style="resize:auto" onblur=""></textarea>
                                    <span id="prodeserr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="">Product Information</label>
                                    <textarea name="proinfo" id="proinfo" class="jqte-test" onblur="checkproinfo()"></textarea>
                                    <span id="proinfoerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Serving Per Pack</label>
                                    <input type="text" name="serveperpack" id="serveperpack" onblur="" class="form-control" placeholder="Serving Per Pack">
                                    <span id="serveperpackerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Serving Size</label>
                                    <input type="text" name="servepersize" id="servepersize" onblur="" class="form-control" placeholder="Serving Size">
                                    <span id="servepersizeerr" class="text-danger" style="font-size:14px"></span>
                                </div>
                            </div> -->
                            <!-- <div class="col-md-8">
                                <div class="form-group">
                                    <label>Nutrition Information</label>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Average Quantity</th>
                                                <th>Per Serve</th>
                                                <th>Per 100g</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <p class="font-weight-bold text-sm">Energy</p>
                                                </td>
                                                <td><input type="text" name="engserve" class="form-control" id="" placeholder="energy per serve"></td>
                                                <td><input type="text" name="enggrm" class="form-control" id="" placeholder="energy per 100g"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p class="font-weight-bold text-sm">Protein</p>
                                                </td>
                                                <td><input type="text" name="proserve" class="form-control" id="" placeholder="protein per serve"></td>
                                                <td><input type="text" name="progrm" class="form-control" id="" placeholder="protein per 100g"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p class="font-weight-bold text-sm">Fat, Total</p>
                                                </td>
                                                <td><input type="text" name="fatserve" class="form-control" id="" placeholder="Fat, Total per serve"></td>
                                                <td><input type="text" name="fatgrm" class="form-control" id="" placeholder="Fat, Total per 100g"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p class="font-weight-bold text-sm">Saturated</p>
                                                </td>
                                                <td><input type="text" name="saturserve" class="form-control" id="" placeholder="saturated per serve"></td>
                                                <td><input type="text" name="saturgrm" class="form-control" id="" placeholder="saturated per 100g"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p class="font-weight-bold text-sm">Carbohydrates</p>
                                                </td>
                                                <td><input type="text" name="carboserve" class="form-control" id="" placeholder="carbohydrates per serve"></td>
                                                <td><input type="text" name="carbogrm" class="form-control" id="" placeholder="carbohydrates per 100g"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p class="font-weight-bold text-sm">Sugars</p>
                                                </td>
                                                <td><input type="text" name="sugrserve" class="form-control" id="" placeholder="sugars per serve"></td>
                                                <td><input type="text" name="sugrgrm" class="form-control" id="" placeholder="sugars per 100g"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p class="font-weight-bold text-sm">Sodium</p>
                                                </td>
                                                <td><input type="text" name="sodiumserve" class="form-control" id="" placeholder="sodium per serve"></td>
                                                <td><input type="text" name="sodiumgrm" class="form-control" id="" placeholder="sodium per 100g"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div> -->
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Product Price</label>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Qty</th>
                                                <th>Price</th>
                                                <th>Dicount Price</th>
                                            </tr>
                                        </thead>
                                        <tbody id="your-father">
                                            <tr>
                                                <td>
                                                    <input type="text" name="qty" class="form-control" value="<%=p.getQty()%>" id="size1" placeholder="Qty">
                                                    <span id="sizeerr" class="text-danger" style="font-size:14px;margin-top:5px;display:block;"></span>
                                                    </td>
                                                <td>
                                                    <input type="text" name="price" class="form-control" id="price1" value="<%=p.getPrice()%>" placeholder="Price">
                                                    <span id="priceerr" class="text-danger" style="font-size:14px;margin-top:5px;display:block;"></span>
                                                    </td>
                                                    <td>
                                                    <input type="text" name="dprice" class="form-control" id="price1" value="<%=p.getDprice()%>" placeholder="Discount Price">
                                                    <span id="priceerr" class="text-danger" style="font-size:14px;margin-top:5px;display:block;"></span>
                                                    </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- <div class="col-md-6">
                                <div class="form-group">
                                    <label>Product size</label>
                                    <select name="size" id="coa" class="form-control">
                                        <option value="">Select size</option>
                                            <option value=""></option>
                                    </select>
                                </div>
                            </div>  -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Availability</label>
                                   	<%
								    	String availability =p.getAvailability();
								    	pageContext.setAttribute("ava", availability);
									%> 
									<%
 										String ava = (String) pageContext.getAttribute("ava");
 									%> 
 									<%
								 		if (ava.equals("yes")) {
									%>
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
                                    <%}else if (ava.equals("no")){ %>
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
                                                    <input type="radio" class="form-check-input" name="availability" id="availability2" value="no" checked>
                                                    Out of Stock
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <%} %>
                                </div>
                            </div> 
                            <div class="col-12">
                                <button type="submit" onclick="return validate()" class="btn btn-primary mr-2">Submit</button>
                                <a href="admin-products.jsp" class="btn btn-light">Cancel</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#procat').on('change', function() {
            var procat = $(this).val();
            $.ajax({
                url: "fetch_subcategory.jsp",
                type: "POST",
                data: 'procat=' + procat,
                success: function(result) {
                    $("#prosubcat").html(result);
                }
            });
        });
        $('.add-btn').click(function() {
            $('#your-father').append('<tr><td><input type="text" name="size" class="form-control" id="" placeholder="Size"></td><td><input type="text" name="price" class="form-control" id="" placeholder="Price"></td><td><button type="button" class="btn btn-danger remove-btn">Remove</button></td></tr>');
        });
        $('#your-father').on('click', '.remove-btn', function() {
            $(this).parentsUntil('#your-father').remove();
        });
    });

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