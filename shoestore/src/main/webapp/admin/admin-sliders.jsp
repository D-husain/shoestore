<%@page import="dao.AdminDao"%>
<%@page import="pojo.Slider"%>
<%@page import="java.util.List"%>
<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Sliders</h4>
                    <a href="admin-addslider.jsp" class="btn btn-primary btn-icon-text">
                        <i class="typcn typcn-upload btn-icon-prepend"></i>
                        Add Slider
                    </a>
                    <%
                    	int a=1;
                    	AdminDao adao=new AdminDao();
                    	List<Slider> slider=adao.viewSlider();
                    %>
                    <div class="table-responsive mt-2">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Slider Title</th>
                                    <th>category</th>
                                    <th>Slider Image</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            		 <%for(Slider s:slider){ %>
	                                        <tr>
                                            <td id="id"></td>
                                            <td><%=s.getTital()%></td>
                                            <td><%=s.getCategory().getCname()%></td>
                                            <td><img src="image/Product/<%=s.getImage()%>" alt="image" style="border-radius:0;width:100px;height:50px" /></td>
                                            <td>
                                                <a href="EditSlider?id=<%=s.getId()%>" class="btn-sm btn-secondary btn-icon-text mr-2 text-decoration-none">Edit
                                                    <i class="typcn typcn-pencil btn-icon-append"></i>
                                                </a>
                                                <button data-toggle="modal" data-target="#deletemodal<%=s.getId()%>" class="btn btn-sm btn-danger btn-icon-text text-decoration-none">Delete
                                                    <i class="typcn typcn-delete btn-icon-append"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%a++; %>
                                        <%} %>
											
										<%int a1=1; %>	
										<%for(Slider s:slider){ %>	
                                        <div class="modal fade" id="deletemodal<%=s.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Delete Slider</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        You really want to delete <span class='text-primary'><%=s.getTital()%></span> category ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                        <a href="DeleteSlider?id=<%=s.getId()%>" type="button" class="btn btn-primary">Yes</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%a1++; %>
                                       <%} %>
								<%if(slider.size()==0){ %>
								<tr>
									<th colspan="5">No Slider Found</th>
								</tr>
								<%
									}
								%>
							</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="admin-footer.jsp"%>