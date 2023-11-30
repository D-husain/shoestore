<%@page import="pojo.Sproduct"%>
<%@page import="dao.UserDao"%>
<%@page import="pojo.Order"%>
<%@page import="java.util.List"%>
<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Cancelled Orders</h4>
                   
                    <div class="d-flex justify-content-end align-items-center  mt-5 mb-2">
                        <!-- <p class="text-sm text-primary">*Click on order id to show full details</p> -->
                        <div class="d-flex justify-content-end align-items-center ">
                            <select class="form-control form-control-sm" name="state" id="maxRows" style="width: 150px;margin-right:20px">
                                <option value="5000">Show All</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="50">50</option>
                                <option value="70">70</option>
                                <option value="100">100</option>
                            </select>
                            <input type="text" class="form-control form-control-sm" style="width: 300px;" id="myInput" placeholder="search for order" />
                        </div>
                    </div>
                    <% 
                    	int oo=1;
 						UserDao udao=new UserDao();
 		            	List<Order>list =udao.Cancelled();
 					   %>
                    <div class="px-3">
                        <div class="table-responsive mt-2">

                            <table class="table table-hover table-striped" id="myTable">
                                <thead>
                                    <tr id="heading">
                                        <th>Sr. No.</th>
                                        <th>Order Id</th>
                                        <th>Customer Name</th>
                                        <th>Email</th>
                                        <th>Order Date</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    	<%for(Order o:list){ %>
                                         <tr>
                                               <td id="id">
										</td>
										<td style="cursor: pointer;" data-toggle="modal" data-target="#detailmodal<%out.print(oo); %>"><%=o.getId()%></td>
										<td>
											<%=o.getUser().getFname()%> <%=o.getUser().getLname()%>
										</td>
										<td>
											<%=o.getUser().getEmail()%>
										</td>
										<td>
											<%=o.getOdate()%>
										</td>
                                         <td>
                                             <%
											    Integer status =o.getStatus();
											    pageContext.setAttribute("statu", status.toString());
											%> 
											<%
			 									String statu = (String) pageContext.getAttribute("statu");
			 								%> 

										 	<%
								 				if (statu.equals("1")) {
											%>
												<label class="badge badge-primary">Pending</label>
											<%
								 				} else if(statu.equals("2")) {
											%>
												<label class="badge badge-info">Active</label>
											<%	
												}else if(statu.equals("3")){ 
											%>
												<label class="badge badge-warning text-white">Shipping</label> 
											<%	
												}else if(statu.equals("4")){ 
											%>
												<label class="badge badge-success">Delivered</label> 
											<% 
												}else if(statu.equals("5")){ 
											%>
												<label class="badge badge-danger">Cancelled</label>
											<%
												} 
											%>

                                           </td>
                                                <td>
                                                    <button data-toggle="modal" data-target="#detailmodal<%out.print(oo); %>" class="btn btn-sm btn-secondary text-white btn-icon-text mr-2 text-decoration-none">Details
                                                        <i class="typcn typcn-eye btn-icon-append"></i>
                                                    </button>
                                                    <!-- <a href="" class="btn-sm btn-danger btn-icon-text text-decoration-none">Cancel
                                                        <i class="typcn typcn-delete btn-icon-append"></i>
                                                    </a> -->
                                                </td>
                                            </tr>
                                            <%oo++;%>
                                            <%} %>
                                            
                                            <%int oo3=1; %>
											<%for(Order o:list){ %>
                                            <div class="modal fade" id="detailmodal<%out.print(oo3); %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLongTitle">Order Details</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body p-5">
                                                            <div class="row g-4">
                                                                <div class="col-md-3">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Order Id</h6>
                                                                    <h4 style="margin-bottom: 20px;"><%=o.getId()%></h4>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Order Date</h6>
                                                                    <h4 style="margin-bottom: 20px;"><%=o.getOdate()%></h4>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Customer Details</h6>
                                                                    <h6 style="margin-bottom: 10px;font-size:14px" class="text-secondary">Name : <span class="text-body"><%=o.getUser().getFname()%></span></h6>
                                                                    <h6 style="margin-bottom: 10px;font-size:14px" class="text-secondary">Email : <span class="text-body"><%=o.getUser().getEmail()%></span></h6>
                                                                    <h6 style="margin-bottom: 10px;font-size:14px" class="text-secondary">Phone : <span class="text-body"><%=o.getUser().getContact()%></span></h6>
                                                                    <h6 style="margin-bottom: 10px;font-size:14px;line-height:1.2" class="text-secondary">Address : <span class="text-body"><%=o.getShippingAddress().getAddress1()%>, <%=o.getShippingAddress().getCity()%>,<%=o.getShippingAddress().getCountry()%>, <%=o.getShippingAddress().getZip()%></span></h6>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Product Details</h6>
                                                                    <div class="row">
                                                                        <div class="col-md-1">
                                                                            <h6 style="margin-bottom: 10px;font-size:16px" class="text-body">Sr. No.</h6>
                                                                        </div>
                                                                        <div class="col-md-5">
                                                                            <h6 style="margin-bottom: 10px;font-size:16px" class="text-body">Product Name</h6>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <h6 style="margin-bottom: 10px;font-size:16px" class="text-body">Price</h6>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <h6 style="margin-bottom: 10px;font-size:16px" class="text-body">Quantity</h6>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <h6 style="margin-bottom: 10px;font-size:16px" class="text-body">Total</h6>
                                                                        </div>
                                                                    </div>
                                                                    <%
                                                                    	int id = o.getId();
                                                                    	List<Sproduct> olist=udao.getSproductDetailsByOrderId(o.getId());
                                                                    %>
                                                                    <%
                                                                    	for(Sproduct order:olist){
                                                                    %>
                                                                        <div class="row">
                                                                            <div class="col-md-1">
                                                                                <h6 style="margin-bottom: 10px;font-size:14px" class="text-secondary" id="id"></h6>
                                                                            </div>
                                                                            <div class="col-md-5">
                                                                                <h6 style="margin-bottom: 10px;font-size:14px" class="text-secondary"><%=order.getPname()%></h6>
                                                                            </div>
                                                                            <div class="col-md-2">
                                                                                <h6 style="margin-bottom: 10px;font-size:14px" class="text-secondary">&#8377; <%=order.getPrice()%></h6>
                                                                            </div>
                                                                            <div class="col-md-2">
                                                                                <h6 style="margin-bottom: 10px;font-size:14px" class="text-secondary"><%=order.getQty()%></h6>
                                                                            </div>
                                                                            <div class="col-md-2">
                                                                                <h6 style="margin-bottom: 10px;font-size:14px" class="text-secondary">&#8377; <%=order.getTotal()%></h6>
                                                                            </div>
                                                                        </div>
                                                                    <%} %>
                                                                </div>
                                                                <div class="col-md-3 mt-4">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Order Payment</h6>
                                                                    <h4 style="margin-bottom: 20px;">&#8377; <%=o.getAmount()%></h4>
                                                                </div>
                                                                <div class="col-md-3 mt-4">
                                                                    <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Order Status</h6>
                                                                    <%
																	    Integer status =o.getStatus();
																	    pageContext.setAttribute("statu", status.toString());
																	%> 
																	<%
									 									String statu = (String) pageContext.getAttribute("statu");
									 								%> 
						
																 	<%
														 				if (statu.equals("1")) {
																	%>
																		<label class="badge badge-primary">Pending</label>
																	<%
														 				} else if(statu.equals("2")) {
																	%>
																		<label class="badge badge-info">Active</label>
																	<%	
																		}else if(statu.equals("3")){ 
																	%>
																		<label class="badge badge-warning text-white">Shipping</label> 
																	<%	
																		}else if(statu.equals("4")){ 
																	%>
																		<label class="badge badge-success">Delivered</label> 
																	<% 
																		}else if(statu.equals("5")){ 
																	%>
																		<label class="badge badge-danger">Cancelled</label>
																	<%
																		} 
																	%>
                                                                </div>
                                                                	<%
														 				if (statu.equals("5")) {
																	%>
                                                                    <div class="col-md-6 mt-4">
                                                                        <h6 style="margin-bottom: 10px;font-size:12px" class="text-primary">Order Cancellation Reason</h6>
                                                                        <h6 style="margin-bottom: 20px;"><%=o.getCancelorder()%></h6>
                                                                    </div>
                                                                	<%} %>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <%-- <a href="orderdeliverd?orderId=${o.orderId}" type="button" class="btn btn-success">Delived</a> --%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%oo3++; %>
                                            <%} %>
                                       <%
										if (list.size() == 0) {
									%>
									<tr>
										<th colspan="7">No Orders Found</th>
									</tr>
									<%
										}
									%>
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