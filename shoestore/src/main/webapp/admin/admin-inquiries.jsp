<%@page import="dao.UserDao"%>
<%@page import="pojo.Contact"%>
<%@page import="java.util.List"%>
<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Inquiries</h4>
                    
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
                            <input type="text" class="form-control form-control-sm" style="width: 300px;" id="myInput" placeholder="search for inquiry" />
                        </div>
                    </div>
                    <% 	
                    	int c=1;
                    	UserDao udao=new UserDao();
                    	List<Contact> list=udao.viewContact();
                        session.setAttribute("contact", list);    		
                    %>
                    <div class="table-responsive mt-2">

                        <table class="table table-hover table-striped" id="myTable">
                            <thead>
                                <tr id="heading">
                                    <th>Sr. No.</th>
                                    <th>Inquirer Name</th>
                                    <th>Email</th>
                                    <th>Contact Number</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%for(Contact contact:list){ %>
								<tr>
									<td id="id">
									</td>
									<td>
										<%=contact.getName()%>
									</td>
									<td>
										<%=contact.getEmail()%>
									</td>
									<td>
										<%=contact.getContact()%>
									</td>

									<td>
										<button data-toggle="modal" data-target="#replymodal<%out.print(c); %>"
											class="btn btn-sm btn-secondary btn-icon-text mr-2 text-decoration-none">
											Reply <i class="typcn typcn-mail btn-icon-append"></i>
										</button>
									</td>
								</tr>
								<%c++; %>
								<%} %>
								
								<%int c1=1; %>
								<%for(Contact contact:list){ %>
								<div class="modal fade" id="replymodal<%out.print(c1); %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Send Reply</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
												<%
													if (contact.getReplay() == null) {
												%>
												<form method="post" action="ReplayMessage">
													<div class="modal-body">
                                                            <input type="hidden" name="email" value="<%=contact.getEmail()%>">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <label>Inquirer Message</label>
                                                                    <div class="form-group">
                                                                    <textarea readonly class="form-control" name="message" id="exampleTextarea1" rows="4" placeholder="your message" style="resize:auto"><%out.print(contact.getMessage()); %></textarea>
																	<%-- <input type="text" name="message" class="form-control"
																		id="name_id" name="message" value="<%=contact.getMessage()%>"
																		readonly placeholder="Enter your Message" required /> --%>
																</div>
																<input type="hidden" name="id" value="<%=contact.getId()%>"> 
                                                                </div>
                                                                <div class="col-12">
                                                                    <label>Your reply</label>
                                                                    <div class="form-group">
                                                                        <textarea class="form-control" name="reply" id="exampleTextarea1" rows="6" placeholder="your message" style="resize:auto"></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                        <button type="submit" class="btn btn-primary">Send</button>
                                                    </div>
                                                </form>
											<%}else{%>
											<div class="modal-body">
                                                 <div class="row">
                                                       <div class="col-12">
                                                              <label>Inquirer Message</label>
                                                                <div class="form-group">
                                                                   <p><%=contact.getMessage()%></p>
                                                                </div>
                                                        </div>
                                                           <div class="col-12">
                                                                <label>Your Reply</label>
                                                                   <div class="form-group">
                                                                     <p><%=contact.getReplay()%></p>
                                                                    </div>
                                                           </div>
                                                                    
                                                   </div>
                                                   <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                   </div>
                                            </div>
							    			<%} %>
                                            </div>
                                        </div>
                                        </div>
                                        <%c1++; %>
                                       <%} %>
                                    <%if(list.size()==0){ %>
                                    <tr>
                                        <th align="center" colspan="6">No Inquiry Found</th>
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