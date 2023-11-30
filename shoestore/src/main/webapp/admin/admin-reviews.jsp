<%@page import="pojo.Reviews"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDao"%>
<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Reviews</h4>
                    <div class="d-flex justify-content-end align-items-center  mt-5 mb-2">
                        <!-- <p class="text-sm text-primary">*Click on category name to show full details</p> -->
                        <div class="d-flex justify-content-end align-items-center ">
                            <select class="form-control form-control-sm" name="state" id="maxRows" style="width: 150px;margin-right:20px">
                                <option value="5000">Show All</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="50">50</option>
                                <option value="70">70</option>
                                <option value="100">100</option>
                            </select>
                            <input type="text" class="form-control form-control-sm" style="width: 300px;" id="myInput" placeholder="search for review" />
                        </div>
                    </div>
                    <%
                    	UserDao udao=new UserDao();
                        List<Reviews> rlist=udao.viewReview();
                    %>
                    <div class="table-responsive mt-2">
                        <table class="table table-hover table-striped" id="myTable">
                            <thead>
                                <tr id="heading">
                                    <th>Sr. No.</th>
                                    <th>Customer Name</th>
                                    <th>Product/Gift Name</th>
                                    <th>Rating</th>
                                    <th>Review Title</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                       <% for(Reviews r:rlist){ %>                          
                                        <tr>
                                            <td id="id"></td>
                                            <td><%=r.getUser().getFname()%> <%=r.getUser().getLname()%></td>
                                            <td><%=r.getProduct().getPname()%></td>
                                            <td>
											<% 
												int b=r.getRating(); 
												for (int i = 0; i<b ; i++) 
												{ 
											%>
                                                    <i class="typcn typcn-star btn-icon-append text-primary" style="font-size: 20px;"></i>
                                            <%
                                            	} 
                                            %>
                                            </td>
                                            <td><%=r.getReviewtitle()%></td>

                                            <td>
                                                <button data-toggle="modal" data-target="#detailmodal<%=r.getId()%>" class="btn btn-sm btn-secondary btn-icon-text mr-2 text-decoration-none">Details
                                                    <i class="typcn typcn-eye btn-icon-append"></i>
                                                </button>
                                                <button data-toggle="modal" data-target="#deletemodal<%=r.getId()%>" class="btn btn-sm btn-danger btn-icon-text mr-2 text-decoration-none">Delete
                                                    <i class="typcn typcn-delete btn-icon-append"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%} %>
	
										 <% for(Reviews r:rlist){ %>      
                                        <div class="modal fade" id="deletemodal<%=r.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Delete Review</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        You really want to delete this review ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                        <a href="DeleteReview?id=<%=r.getId()%>" type="button" class="btn btn-primary">Yes</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
										
										 <% for(Reviews r:rlist){ %>      
                                        <div class="modal fade" id="detailmodal<%=r.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Review Details</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-3">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Review Id</h6>
                                                                <h6 style="margin-bottom: 20px;"><%=r.getId()%></h6>
                                                            </div>
                                                            <div class="col-9">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Customer Name</h6>
                                                                <h6 style="margin-bottom: 20px;"><%=r.getUser().getFname()%> <%=r.getUser().getLname()%></h6>
                                                            </div>
                                                            <div class="col-6">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Review Rating</h6>
																<h6 style="margin-bottom: 20px;">
																	<%
																		int b = r.getRating();
																	%>
																	<%
																		for (int i = 0; i < b; i++) {
																	%>
																	<i class="typcn typcn-star btn-icon-append text-primary" style="font-size: 20px;"></i>
																	<%
																		}
																	%>
																</h6>
															</div>
                                                            <div class="col-6">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Review Date</h6>
                                                                <h6 style="margin-bottom: 20px;"><%=r.getReviewdate()%></h6>
                                                            </div>
                                                            <div class="col-12">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Review Title</h6>
                                                                <h6 style="margin-bottom: 20px;"><%=r.getReviewtitle()%></h6>
                                                            </div>
                                                            <div class="col-12">
                                                                <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Review</h6>
                                                                <p style="margin-bottom: 20px;"><%=r.getReview()%></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                        <%if(rlist.size()==0){ %>
                                    <tr>
                                        <th colspan="5">No Reviews Found</th>
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