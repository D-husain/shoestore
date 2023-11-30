<%@page import="connection.ProjectConn"%>
<%@page import="dao.UserDao"%>
<%@page import="pojo.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="admin-header.jsp" %>
<div class="content-wrapper">
    <div class="row">
        <div class="col-xl-12 grid-margin stretch-card flex-column">
            <h5 class="mb-2 text-titlecase">Admin Dashboard</h5>
            <div class="row">
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-users.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-user-check text-primary bx-md'></i></h4>
                                <h4 class="mb-3">User</h4>
                                <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM user";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-inquiries.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-message-dots text-primary bx-md'></i></h4>
                                <h4 class="mb-3">Inquiry</h4>
                                <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM contact";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-subscribers.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-user-check text-primary bx-md'></i></h4>
                                <h4 class="mb-3">Subscribe</h4>
                                <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM subscribe";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-categories.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-category text-primary bx-md'></i></h4>
                                <h4 class="mb-3">Categories</h4>
                               <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM category";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-products.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-cube text-primary bx-md'></i></h4>
                                <h4 class="mb-3">Products</h4>
                                <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM product";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-teams.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bxs-group text-primary bx-md'></i></h4>
                                <h4 class="mb-3">Teams</h4>
                                <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM team";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-coupons.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bxs-coupon text-primary bx-md'></i></h4>
                                <h4 class="mb-3">Coupons</h4>
                                <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM coupon";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-sliders.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-slideshow bx-sm mr-2 text-primary bx-md'></i></h4>
                                <h4 class="mb-3">Slider</h4>
                                <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM slider";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-reviews.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-star bx-sm mr-2 text-primary bx-md'></i></h4>
                                <h4 class="mb-3">Reviews</h4>
                                <h4>
                                <%
										try
										{
											Connection con=ProjectConn.createConnection();
											Statement st=con.createStatement();
											String strQuery = "SELECT COUNT(*) FROM reviews";
											ResultSet rs = st.executeQuery(strQuery);
											String Countrow="";
											while(rs.next()){
											Countrow = rs.getString(1);
											out.println(Countrow);
											}
											}
											catch (Exception e){
											e.printStackTrace();
										}
									%>
                               </h4>
                            </div>
                        </a>
                    </div>
                </div>
                
            </div>
        </div>

	<div class="col-xl-12 grid-margin stretch-card flex-column">
            <h5 class="mb-2 text-titlecase">Orders</h5>
            <div class="row">
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-orders.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-package text-primary bx-md'></i></h4>
                                <h4 class="mb-3 text-center">All Orders</h4>
                                <h4> 
                                <%
	                                UserDao udao=new UserDao();
	                                List<Order> orderlist=udao.viewOrder();
                                %>
                                
                                <% int size=orderlist.size();%>
                                	
                                <% out.print(size);%>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-pendingorders.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bxs-hourglass text-primary bx-md'></i></h4>
                                <h4 class="mb-3 text-center">Pending Orders</h4>
                                <h4>
                                <%
	                                List<Order> pending=udao.pending();
	                                session.setAttribute("order", pending);
                                %>
                                
                                <% int size1=pending.size();%>
                                	
                                <% out.print(size1);%>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-activeorders.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-check-circle text-primary bx-md'></i></h4>
                                <h4 class="mb-3 text-center">Active Orders</h4>
                                 <h4>
                                <%
	                                List<Order> active=udao.active();
	                                session.setAttribute("order", active);
                                %>
                                
                                <% int size2=active.size();%>
                                	
                                <% out.print(size2);%>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-shippingorders.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bxs-truck text-primary bx-md'></i></h4>
                                <h4 class="mb-3 text-center">Shipping Orders</h4>
                                <h4>
                                <%
	                                List<Order> shipping=udao.shipping();
                                %>
                                
                                <% int size3=shipping.size();%>
                                	
                                <% out.print(size3);%>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-deliverdorders.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-clipboard text-primary bx-md'></i></h4>
                                <h4 class="mb-3 text-center">Delivered Orders</h4>
                            <h4>
                                <%
	                                List<Order> deliver=udao.Deliverd();
                                %>
                                
                                <% int size4=deliver.size();%>
                                	
                                <% out.print(size4);%>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-cancelledorders.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-task-x text-primary bx-md'></i></h4>
                                <h4 class="mb-3 text-center">Cancelled Orders</h4>
                             	<h4>
                                <%
	                                List<Order> cancel=udao.Cancelled();
                                %>
                                
                                <% int size5=cancel.size();%>
                                	
                                <% out.print(size5);%>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 grid-margin stretch-card">
                    <div class="card">
                        <a href="admin-sales.jsp" style="text-decoration: none;color:black;">
                            <div class="card-body d-flex flex-column justify-content-between align-items-center">
                                <h4><i class='bx bx-money text-primary bx-md'></i></h4>
                                <h4 class="mb-3 text-center">Sales</h4>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%@include file="admin-footer.jsp" %>