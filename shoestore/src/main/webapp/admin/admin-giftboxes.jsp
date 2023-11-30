<%@include file="admin-header.jsp" %>
<div class="content-wrapper">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">GiftBoxes</h4>
                    <a href="addgiftbox.jsp" class="btn btn-primary btn-icon-text">
                        <i class="typcn typcn-upload btn-icon-prepend"></i>
                        Add GiftBox
                    </a>
                    <?php
                    if (isset($_SESSION['succ'])) {
                        echo $_SESSION['succ'];
                        unset($_SESSION['succ']);
                    }
                    ?>
                    <div class="d-flex justify-content-between align-items-center  mt-5 mb-2">
                        <p class="text-sm text-primary">*Click on giftbox name to show full details</p>
                        <div class="d-flex justify-content-end align-items-center ">
                            <select class="form-control form-control-sm" name="state" id="maxRows" style="width: 150px;margin-right:20px">
                                <option value="5000">Show All</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="50">50</option>
                                <option value="70">70</option>
                                <option value="100">100</option>
                            </select>
                            <input type="text" class="form-control form-control-sm" style="width: 300px;" id="myInput" placeholder="search for giftbox" />
                        </div>
                    </div>
                    <div class="px-3">
                        <div class="table-responsive" >

                            <table class="table table-hover table-striped" id="myTable">
                                <thead>
                                    <tr id="heading">
                                        <th>Sr. No.</th>
                                        <th>Giftbox Name</th>
                                        <th>Product Price</th>
                                        <th>Discount Price</th>
                                        <th>Availability</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $sr = 1;
                                    if ($cnt > 0) {
                                        while ($row = mysqli_fetch_array($res)) {
                                    ?>
                                            <tr>
                                                <td><?php echo $sr; ?></td>
                                                <td style="cursor:pointer" data-toggle="modal" data-target="#detailmodal<?php echo $sr; ?>"><?php echo $row['boxname']; ?></td>
                                                <td>$ <?php echo $row['price']; ?></td>
                                                <td>
                                                    <?php
                                                    if ($row['rpri'] != "") {
                                                        echo "$ " . $row['rpri'];
                                                    }
                                                    ?>
                                                </td>
                                                <td><?php echo $row['availability']; ?></td>
                                                <td>
                                                    <a href="editgiftbox.jsp?id=<?php echo $row['id']; ?>" class="btn-sm btn-secondary btn-icon-text mr-2 text-decoration-none">Edit
                                                        <i class="typcn typcn-pencil btn-icon-append"></i>
                                                    </a>
                                                    <button data-toggle="modal" data-target="#deletemodal<?php echo $sr; ?>" class="btn btn-sm btn-danger">Delete <i class="typcn typcn-delete btn-icon-append"></i></button>
                                                </td>
                                            </tr>


                                            <div class="modal fade" id="detailmodal<?php echo $sr; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Giftbox Name</h6>
                                                                    <h4 style="margin-bottom: 20px;"><?php echo $row['boxname']; ?></h4>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Products</h6>
                                                                    <ul style="margin-bottom: 20px;">
                                                                        <?php
                                                                        $q = $row['products'];
                                                                        $arrq = explode(",", $q);
                                                                        foreach ($arrq as $p) {
                                                                            $f = "SELECT * FROM product WHERE id = '$p'";
                                                                            $fr = mysqli_query($conn, $f);
                                                                            $fd = mysqli_fetch_array($fr);
                                                                        ?>
                                                                            <li>
                                                                                <h6><?php echo $fd['name']; ?></h6>
                                                                            </li>
                                                                        <?php
                                                                        }

                                                                        ?>

                                                                    </ul>

                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">GiftBox Price</h6>
                                                                    <h4 style="margin-bottom: 20px;">$ <?php echo $row['price']; ?></h4>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Giftbox Discount Price</h6>
                                                                    <?php
                                                                    if ($row['rpri'] != "") {
                                                                    ?>
                                                                        <h4 style="margin-bottom: 20px;"><?php echo "$ " . $row['rpri']; ?></h4>
                                                                    <?php
                                                                    } else {
                                                                        echo "<p>discount price is empty</p>";
                                                                    }
                                                                    ?>

                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">GiftBox Description</h6>
                                                                    <p style="margin-bottom: 20px;"><?php echo $row['detailsinfo']; ?></p>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">GiftBox Information</h6>
                                                                    <p style="margin-bottom: 20px;"><?php echo $row['productinfo']; ?></p>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Main Image</h6>
                                                                    <img src='<?php echo $row['primaryimg']; ?>' alt="image" class="img-fluid" width="200" />
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Second Image</h6>
                                                                    <?php
                                                                    if ($row['img2'] == "giftboximage/") {
                                                                        echo "<p>No image uploaded</p>";
                                                                    } else {
                                                                    ?>
                                                                        <img src='<?php echo $row['img2']; ?>' alt="image" class="img-fluid" width="200" />
                                                                    <?php
                                                                    }

                                                                    ?>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Third Image</h6>
                                                                    <?php
                                                                    if ($row['img3'] == "giftboximage/") {
                                                                        echo "<p>No image uploaded</p>";
                                                                    } else {
                                                                    ?>
                                                                        <img src='<?php echo $row['img3']; ?>' alt="image" class="img-fluid" width="200" />
                                                                    <?php
                                                                    }

                                                                    ?>

                                                                </div>
                                                                <div class="col-md-3">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Fourth Image</h6>
                                                                    <?php
                                                                    if ($row['img4'] == "giftboximage/") {
                                                                        echo "<p>No image uploaded</p>";
                                                                    } else {
                                                                    ?>
                                                                        <img src='<?php echo $row['img4']; ?>' alt="image" class="img-fluid" width="200" />
                                                                    <?php
                                                                    }

                                                                    ?>

                                                                </div>
                                                                <div class="col-md-6 mt-4">

                                                                    <div class="row">
                                                                        <!-- <div class="col-md-3">
                                                                        <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Serving per pack</h6>
                                                                        <h4 style="margin-bottom: 20px;"><?php echo $row['servpck']; ?></h4>
                                                                    </div> -->

                                                                        <div class="col-md-6">
                                                                            <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Quality</h6>
                                                                            <?php
                                                                            if ($row['quality'] == "") {
                                                                                echo "<p>No quality selected</p>";
                                                                            } else {
                                                                            ?>
                                                                                <p style="margin-bottom: 20px;"><?php echo $row['quality']; ?></p>
                                                                            <?php

                                                                            } ?>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Availability</h6>
                                                                            <h4 style="margin-bottom: 20px;"><?php echo $row['availability']; ?></h4>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <a href="editgiftbox.jsp?id=<?php echo $row['id']; ?>" type="button" class="btn btn-primary">Edit</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal fade" id="deletemodal<?php echo $sr; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLongTitle">Delete GiftBox</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            You really want to delete <span class='text-primary'><?php echo $row['boxname']; ?></span> giftbox ?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                            <a href="deletegiftbox.jsp?id=<?php echo $row['id']; ?>" type="button" class="btn btn-primary">Yes</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php
                                            $sr++;
                                        }
                                    } else {
                                        ?>
                                        <tr>
                                            <th colspan="7">No Categories Found</th>
                                        </tr>
                                    <?php
                                    }

                                    ?>
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
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
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