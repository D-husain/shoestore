<%@page import="pojo.Coupon"%>
<%@page import="java.util.List"%>
<%@page import="dao.AdminDao"%>
<%@include file="admin-header.jsp"%>
<div class="content-wrapper">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Coupons</h4>
                    <button data-toggle="modal" data-target="#addmodal" class="btn btn-primary btn-icon-text">
                        <i class="typcn typcn-upload btn-icon-prepend"></i>
                        Add Coupon
                    </button>
                    <div class="table-responsive mt-2">
                       <%
                       		AdminDao adao=new AdminDao();
                       		List<Coupon> list=adao.viewCoupon();
                       %>
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Coupon code</th>
                                    <th>Coupon type</th>
                                    <th>Coupon value</th>
                                    <th>Minimum cart value</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            			<%for(Coupon c:list){ %>
                                        <tr>
                                            <td id="id"></td>
                                            <td><%=c.getCode()%></td>
                                            <td><%=c.getType() %></td>
                                            <td><%=c.getValue()%></td>
                                            <td><%=c.getMvalue()%></td>

                                            <td>
                                                <button data-toggle="modal" data-target="#deletemodal<%=c.getId()%>" class="btn btn-sm btn-danger btn-icon-text text-decoration-none">Delete
                                                    <i class="typcn typcn-delete btn-icon-append"></i>
                                                </button>
                                            </td>
                                        </tr>
                                       <%} %>

										<%for(Coupon c:list){ %>
                                        <div class="modal fade" id="deletemodal<%=c.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Delete Coupon</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        You really want to delete <span class='text-primary'><%=c.getCode()%></span> coupon ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                        <a href="CouponDelete?id=<%=c.getId()%>" type="button" class="btn btn-primary">Yes</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                       <%} %>

								<%
									if (list.size() == 0) {
								%>
								<tr>
									<th colspan="6">No Coupons Found</th>
								</tr>
								<%
									}
								%>

                            </tbody>
                        </table>
                        <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Add Coupon</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                   <form method="post" action="AddCoupon">
                                    <div class="modal-body">
                                            <div class="row">
                                                <div class="col-12">

                                                    <div class="form-group">
                                                        <label for="exampleInputName1">Coupon Code</label>
                                                        <input type="text" name="code" class="form-control" id="couponcode" onblur="checkcouponcode()" placeholder="Coupon Code">
                                                        <span id="couponcodeerr" class="text-danger" style="font-size:14px"></span>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="exampleInputName1">Coupon Type</label>
                                                        <select name="type" id="coupontype" onchange="checkcoupontype()" class="form-control">
                                                            <option value="">Select type</option>
                                                            <option value="Percantage">Percantage</option>
                                                        </select>
                                                        <span id="coupontypeerr" class="text-danger" style="font-size:14px"></span>
                                                    </div>
                                                </div>
                                                <div class="col-12">

                                                    <div class="form-group">
                                                        <label for="exampleInputName1">Coupon Value</label>
                                                        <input type="text" name="value" class="form-control" id="couponval" onblur="checkcouponval()" placeholder="Coupon Value">
                                                        <span id="couponvalerr" class="text-danger" style="font-size:14px"></span>
                                                    </div>
                                                </div>
                                                <div class="col-12">

                                                    <div class="form-group">
                                                        <label for="exampleInputName1">Minimum cart value</label>
                                                        <input type="text" name="mvalue" class="form-control" id="mincartvalue" onblur="checkmincartvalue()" placeholder="Coupon Minimum Cart Value">
                                                        <span id="mincartvalueerr" class="text-danger" style="font-size:14px"></span>
                                                    </div>
                                                </div>

                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        <button type="submit" onclick="return validate()" class="btn btn-primary">Confirm</button>
                                    </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

function checkcouponcode(){
    let couponcode = document.getElementById('couponcode').value;
        let couponcodeerr = document.getElementById('couponcodeerr');
        
        if(couponcode == ""){
            couponcodeerr.innerHTML = "Please enter the coupon code";
        }
        else{
            couponcodeerr.innerHTML = "";
        }
}

function checkcoupontype(){
    let coupontype = document.getElementById('coupontype').value;
        let coupontypeerr = document.getElementById('coupontypeerr');
        
        if(coupontype == ""){
            coupontypeerr.innerHTML = "Please select the coupon type";
        }
        else{
            coupontypeerr.innerHTML = "";
        }
}
function checkcouponval(){
    let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
    	let couponval = document.getElementById('couponval').value;
        let couponvalerr = document.getElementById('couponvalerr');
        
        if(couponval == ""){
            couponvalerr.innerHTML = "Please enter the coupon value";
        }
        else if(!couponval.match(m)){
            couponvalerr.innerHTML = "Coupon value can only have numbers";
        }
        else{
            couponvalerr.innerHTML = "";
        }
}
function checkmincartvalue(){
    let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
    let mincartvalue = document.getElementById('mincartvalue').value;
        let mincartvalueerr = document.getElementById('mincartvalueerr');
        
        if(mincartvalue == ""){
            mincartvalueerr.innerHTML = "Please enter the minimum cart value";
        }
        else if(!mincartvalue.match(m)){
            mincartvalueerr.innerHTML = "Minimum cart value can only have numbers";
        }
        else{
            mincartvalueerr.innerHTML = "";
        }
}

    function validate(){
        let couponcode = document.getElementById('couponcode').value;
        let couponcodeerr = document.getElementById('couponcodeerr');
        let coupontype = document.getElementById('coupontype').value;
        let coupontypeerr = document.getElementById('coupontypeerr');
        let couponval = document.getElementById('couponval').value;
        let couponvalerr = document.getElementById('couponvalerr');
        let mincartvalue = document.getElementById('mincartvalue').value;
        let mincartvalueerr = document.getElementById('mincartvalueerr');
        let m = /^(\d*([.,](?=\d{1}))?\d+)+((?!\2)[.,]\d\d)?$/
        
        if(couponcode == "" && coupontype == "" && couponval == "" && mincartvalue == ""){
            couponcodeerr.innerHTML = "Please enter the coupon code";
            coupontypeerr.innerHTML = "Please select the coupon type";
            couponvalerr.innerHTML = "Please enter the coupon value";
            mincartvalueerr.innerHTML = "Please enter the minimum cart value";
            return false;
        }
        else if(couponcode == ""){
            couponcodeerr.innerHTML = "Please enter the coupon code";
            coupontypeerr.innerHTML = "";
            couponvalerr.innerHTML = "";
            mincartvalueerr.innerHTML = "";
            return false;
        }
        else if(coupontype == ""){
            couponcodeerr.innerHTML = "";
            coupontypeerr.innerHTML = "Please select the coupon type";
            couponvalerr.innerHTML = "";
            mincartvalueerr.innerHTML = "";
            return false;
        }
        else if(couponval == ""){
            couponcodeerr.innerHTML = "";
            coupontypeerr.innerHTML = "";
            couponvalerr.innerHTML = "Please enter the coupon value";
            mincartvalueerr.innerHTML = "";
            return false;
        }
        else if(!couponval.match(m)){
            couponcodeerr.innerHTML = "";
            coupontypeerr.innerHTML = "";
            couponvalerr.innerHTML = "Coupon value can only have numbers";
            mincartvalueerr.innerHTML = "";
            return false;
        }
        else if(mincartvalue == ""){
            couponcodeerr.innerHTML = "";
            coupontypeerr.innerHTML = "";
            couponvalerr.innerHTML = "Please enter the minimum cart value";
            mincartvalueerr.innerHTML = "";
            return false;
        }
        else if(!mincartvalue.match(m)){
            couponcodeerr.innerHTML = "";
            coupontypeerr.innerHTML = "";
            couponvalerr.innerHTML = "Minimum cart value can only have numbers";
            mincartvalueerr.innerHTML = "";
            return false;
        }
        else{
            return true;
        }
    }
</script>
<%@include file="admin-footer.jsp"%>