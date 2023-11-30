<%@page import="dao.AdminDao"%>
<%@page import="pojo.Product"%>
<%@page import="java.util.List"%>
<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Products</h4>
                    <a href="admin-addproduct.jsp" class="btn btn-primary btn-icon-text">
                        <i class="typcn typcn-upload btn-icon-prepend"></i>
                        Add Product
                    </a>
                    
                    <div class="d-flex justify-content-between align-items-center  mt-5">
                        <p class="text-sm text-primary" style="margin:auto 0">*Click on Product name to show full details</p>
                        <div class="d-flex justify-content-end align-items-center ">
                            <select class="form-control form-control-sm" name="state" id="maxRows" style="width: 150px;margin-right:20px">
                                <option value="5000">Show All</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="50">50</option>
                                <option value="70">70</option>
                                <option value="100">100</option>
                            </select>
                            <input type="text" class="form-control form-control-sm" style="width: 300px;" id="myInput" placeholder="search for product" />
                        </div>
                    </div>
                </div>
                <%
                int p=1;
				AdminDao adao=new AdminDao();
				List<Product> plist = adao.viewProduct();
				%>
                <div class="px-4">
                    <div class="table-responsive ">


                        <table class=" table table-hover table-striped" id="myTable">
                            <thead>
                                <tr id="heading">
                                    <th>Sr. No.</th>
                                    <th>Product Name</th>
                                    <th>Category</th>
                                  	<th>Quantity</th>
                                   	<th>Price</th>
                                   	<th>Stock</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
								<%for(Product pro:plist){ %>
									<tr>
										<td id="id"></td>
										<td style="cursor: pointer" data-toggle="modal"
											data-target="#detailmodal<%out.print(p);%>">
											<%=pro.getPname()%>
										</td>
										<td>
											<%=pro.getCategory().getCname()%>
										</td>
										<td>
											<%=pro.getQty()%>
										</td>
										<td class="text-capitalize">
											<%=pro.getPrice()%>
										</td>
										<td><%=pro.getAvailability()%></td>
										<td><a href="EditProduct?id=<%=pro.getId()%>"
											class="btn-sm btn-secondary btn-icon-text mr-2 text-decoration-none">Edit
												<i class="typcn typcn-pencil btn-icon-append"></i>
										</a>
											<button data-toggle="modal" data-target="#deletemodal<%=pro.getId()%>"
												class="btn btn-sm btn-danger">
												Delete <i class="typcn typcn-delete btn-icon-append"></i>
											</button></td>
									</tr>
									<%p++; %>
								<%} %>
								<%int p1=1; %>
								<%for(Product pro:plist){ %>
								<div class="modal fade" id="detailmodal<%out.print(p1);%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Product Details</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body p-5">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Product Name</h6>
                                                                <h4 style="margin-bottom: 20px;"><%=pro.getPname()%></h4>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Category Name</h6>
                                                                <h4 style="margin-bottom: 20px;"><%=pro.getCategory().getCname()%></h4>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Price</h6>
                                                                <h4 style="margin-bottom: 20px;"><%=pro.getPrice()%></h4>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Main Image</h6>
                                                                <img src="image/Product/<%=pro.getImage1()%>" alt="image" class="img-fluid" width="200" />
                                                            </div>
                                                            <div class="col-md-3">
                                                                <div class="row">
                                                                   <!-- <div class="col-md-6">
                                                                        <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Serving per pack</h6>
                                                                        <h4 style="margin-bottom: 20px;"><?php echo $row['servpck']; ?></h4>
                                                                    </div>-->
                                                                    <!--<div class="col-md-6">
                                                                        <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Serving size</h6>
                                                                        <h4 style="margin-bottom: 20px;"><?php echo $row['sersize']; ?></h4>
                                                                    </div>  -->
                                                                    <div class="col-md-6">
                                                                        <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Quality</h6>
                                                                        <%
                                                                        	if(plist.size()==0){ 
                                                                        %>
																			<p>No quality selected</p>
																		<%
																			}else{
																		%>
                                                                            <p style="margin-bottom: 20px;"><%=pro.getQty()%></p>
                                                                        <%} %>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Availability</h6>
                                                                        <h4 style="margin-bottom: 20px;"><%=pro.getAvailability()%></h4>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="col-md-6">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Product Description</h6>
                                                                <p style="margin-bottom: 20px;"><%=pro.getDescription()%></p>
                                                            </div>
                                                            <div class="col-md-6 mt-4">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Product Information</h6>
                                                                <p style="margin-bottom: 20px;"><%=pro.getInfo()%></p>
                                                            </div>
                                                            <!--
                                                            <div class="col-md-6 mt-4">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Health Benefits</h6>
                                                                <p style="margin-bottom: 20px;"><?php echo $row['b_health']; ?></p>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Storage Instruction</h6>
                                                                <p style="margin-bottom: 20px;"><?php echo $row['i_storage']; ?></p>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">How to Use</h6>
                                                                <p style="margin-bottom: 20px;"><?php echo $row['htu']; ?></p>
                                                            </div>-->
                                                            <!--<div class="col-md-6 mt-4">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Nutrition Information</h6>
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <p class="font-weight-bold" style="font-size: 16px;">Average Quantity</p>
                                                                        <p style="font-weight:500">Energy</p>
                                                                        <p style="font-weight:500">Protein</p>
                                                                        <p style="font-weight:500">Fat, Total</p>
                                                                        <p style="font-weight:500">Saturated</p>
                                                                        <p style="font-weight:500">Carbohydrates</p>
                                                                        <p style="font-weight:500">Sugars</p>
                                                                        <p style="font-weight:500">Sodiums</p>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <p class="font-weight-bold" style="font-size: 16px;">Per serve</p>
                                                                        <?php
                                                                        if ($row['engserve'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['engserve']; ?> KJ</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['proserve'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['proserve']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['fatserve'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['fatserve']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['saturserve'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['saturserve']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['carboserve'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['carboserve']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['sugrserve'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['sugrserve']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['sodimserve'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['sodimserve']; ?> mg</p>
                                                                        <?php
                                                                        }
                                                                        ?>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <p class="font-weight-bold" style="font-size: 16px;">Per 100g</p>
                                                                        <?php
                                                                        if ($row['enggrm'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['enggrm']; ?> KJ</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['progrm'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['progrm']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['fatgrm'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['fatgrm']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['saturgrm'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['saturgrm']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['carbogrm'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['carbogrm']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['sugrgrm'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['sugrgrm']; ?> g</p>
                                                                        <?php
                                                                        }
                                                                        ?>

                                                                        <?php
                                                                        if ($row['sodimgrm'] == "") {
                                                                            echo "<p>no information</p>";
                                                                        } else {
                                                                        ?>
                                                                            <p style="font-weight:500"><?php echo $row['sodimgrm']; ?> mg</p>
                                                                        <?php
                                                                        }
                                                                        ?>
                                                                    </div>
                                                                </div>
                                                            </div>-->
                                                            <!--
                                                            <div class="col-md-4 mt-4">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Product Price Details</h6>
                                                                <div class="row">
                                                                    <div class="col-md-2">
                                                                        <p class="font-weight-bold" style="font-size: 16px;">Sr.No</p>
                                                                    </div>
                                                                    <div class="col-md-5">
                                                                        <p class="font-weight-bold" style="font-size: 16px;">Per serve</p>
                                                                    </div>
                                                                    <div class="col-md-5">
                                                                        <p class="font-weight-bold" style="font-size: 16px;">Per 100g</p>
                                                                    </div>
                                                                    <?php
                                                                    $pid = $row['id'];
                                                                    $sg = 1;
                                                                    $qq = mysqli_query($conn, "SELECT * FROM size WHERE pro_id='$pid'");
                                                                    while ($pp = mysqli_fetch_assoc($qq)) {
                                                                    ?>
                                                                        <div class="col-md-2">
                                                                            <p style="font-weight:500"><?php echo $sg; ?></p>
                                                                        </div>
                                                                        <div class="col-md-5">
                                                                            <p style="font-weight:500"><?php echo $pp['size']; ?></p>
                                                                        </div>
                                                                        <div class="col-md-5">
                                                                            <p style="font-weight:500"><?php echo $pp['price'] ?></p>
                                                                        </div>
                                                                    <?php
                                                                        $sg++;
                                                                    }
                                                                    ?>
                                                                </div>
                                                            </div> -->
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <a href="EditProduct?id=<%=pro.getId()%>" type="button" class="btn btn-primary">Edit</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%p1++; %>
										<%} %>
										
										<%for(Product pro:plist){ %>
                                        <div class="modal fade" id="deletemodal<%=pro.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Delete Product</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        You really want to delete <span class='text-primary'><%=pro.getPname()%></span> product ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                        <a href="DeleteProduct?id=<%=pro.getId()%>" type="button" class="btn btn-primary">Yes</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                    <% if(plist.size()==0){%>
                                    <tr>
                                        <th colspan="7">
                                            <center>No Products Yet<center>
                                        </th>
                                    </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                    <div class='pagination-container my-4' style="width:fit-content;margin-left:auto">
                        <nav>
                            <ul class="pagination">
                                <li class="btn btn-sm btn-light m-1" data-page="prev">
                                    <span>
                                        < <span class="sr-only">(current)
                                    </span></span>
                                </li>
                                <li class="btn btn-sm btn-light m-1" data-page="next" id="prev">
                                    <span> > <span class="sr-only">(current)</span></span>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
    // function myFunction() {
    //     var input, filter, table, tr, td, i, txtValue;
    //     input = document.getElementById("myInput");
    //     filter = input.value.toUpperCase();
    //     table = document.getElementById("myTable");
    //     tr = table.getElementsByTagName("tr");
    //     for (i = 0; i < tr.length; i++) {
    //         td = tr[i].getElementsByTagName("td")[1];
    //         if (td) {
    //             txtValue = td.textContent || td.innerText;
    //             if (txtValue.toUpperCase().indexOf(filter) > -1) {
    //                 tr[i].style.display = "";
    //             } else {
    //                 tr[i].style.display = "none";
    //             }
    //         }
    //     }
    // }
    $(document).ready(function() {
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr:not(#heading)").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });


    function getPagination(table) {
        var lastPage = 1;

        $('#maxRows')
            .on('change', function(evt) {
                //$('.paginationprev').html('');						// reset pagination

                lastPage = 1;
                $('.pagination')
                    .find('li')
                    .slice(1, -1)
                    .remove();
                var trnum = 0; // reset tr counter
                var maxRows = parseInt($(this).val()); // get Max Rows from select option

                if (maxRows == 5000) {
                    $('.pagination').hide();
                } else {
                    $('.pagination').show();
                }

                var totalRows = $(table + ' tbody tr').length; // numbers of rows
                $(table + ' tr:gt(0)').each(function() {
                    // each TR in  table and not the header
                    trnum++; // Start Counter
                    if (trnum > maxRows) {
                        // if tr number gt maxRows

                        $(this).hide(); // fade it out
                    }
                    if (trnum <= maxRows) {
                        $(this).show();
                    } // else fade in Important in case if it ..
                }); //  was fade out to fade it in
                if (totalRows > maxRows) {
                    // if tr total rows gt max rows option
                    var pagenum = Math.ceil(totalRows / maxRows); // ceil total(rows/maxrows) to get ..
                    //	numbers of pages
                    for (var i = 1; i <= pagenum;) {
                        // for each page append pagination li
                        $('.pagination #prev')
                            .before(
                                '<li class="btn btn-sm btn-light m-1" data-page="' +
                                i +
                                '">\
								  <span>' +
                                i++ +
                                '<span class="sr-only">(current)</span></span>\
								</li>'
                            )
                            .show();
                    } // end for i
                } // end if row count > max rows
                $('.pagination [data-page="1"]').addClass('active'); // add active class to the first li
                $('.pagination li').on('click', function(evt) {
                    // on click each page
                    evt.stopImmediatePropagation();
                    evt.preventDefault();
                    var pageNum = $(this).attr('data-page'); // get it's number

                    var maxRows = parseInt($('#maxRows').val()); // get Max Rows from select option

                    if (pageNum == 'prev') {
                        if (lastPage == 1) {
                            return;
                        }
                        pageNum = --lastPage;
                    }
                    if (pageNum == 'next') {
                        if (lastPage == $('.pagination li').length - 2) {
                            return;
                        }
                        pageNum = ++lastPage;
                    }

                    lastPage = pageNum;
                    var trIndex = 0; // reset tr counter
                    $('.pagination li').removeClass('active'); // remove active class from all li
                    $('.pagination [data-page="' + lastPage + '"]').addClass('active'); // add active class to the clicked
                    // $(this).addClass('active');					// add active class to the clicked
                    limitPagging();
                    $(table + ' tr:gt(0)').each(function() {
                        // each tr in table not the header
                        trIndex++; // tr index counter
                        // if tr index gt maxRows*pageNum or lt maxRows*pageNum-maxRows fade if out
                        if (
                            trIndex > maxRows * pageNum ||
                            trIndex <= maxRows * pageNum - maxRows
                        ) {
                            $(this).hide();
                        } else {
                            $(this).show();
                        } //else fade in
                    }); // end of for each tr in table
                }); // end of on click pagination list
                limitPagging();
            })
            .val(10)
            .change();

        // end of on select change

        // END OF PAGINATION
    }

    function limitPagging() {
        // alert($('.pagination li').length)

        if ($('.pagination li').length > 7) {
            if ($('.pagination li.active').attr('data-page') <= 3) {
                $('.pagination li:gt(5)').hide();
                $('.pagination li:lt(5)').show();
                $('.pagination [data-page="next"]').show();
            }
            if ($('.pagination li.active').attr('data-page') > 3) {
                $('.pagination li:gt(0)').hide();
                $('.pagination [data-page="next"]').show();
                for (let i = (parseInt($('.pagination li.active').attr('data-page')) - 2); i <= (parseInt($('.pagination li.active').attr('data-page')) + 2); i++) {
                    $('.pagination [data-page="' + i + '"]').show();

                }

            }
        }
    }

    getPagination('#myTable');
</script>
<%@include file="admin-footer.jsp"%>