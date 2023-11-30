<%@page import="pojo.Admin"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	Admin admin = (Admin) session.getAttribute("admin");

	if (admin == null) {
		response.sendRedirect("admin-login.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Panel</title>
    <!-- base:css -->
    <link rel="stylesheet" href="./admin/admin-assets/vendors/typicons/typicons.css">
    <link rel="stylesheet" href="./admin/admin-assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="./admin/admin-assets/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="./admin/admin-assets/css/vertical-layout-light/style.css">
    <link rel="shortcut icon" href="assets/images/demos/demo-10/shoe-logo-footers.png" />
    <link type="text/css" rel="stylesheet" href="./admin/admin-assets/te/jquery-te-1.4.0.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script type="text/javascript" src="admin-assets/te/jquery-te-1.4.0.min.js" charset="utf-8"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <style>
        ::-webkit-scrollbar {
            width: 3px;
            height: 3px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background-color: #d4d4d4;
            border-radius: 5px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #ba2026;
            border-radius: 5px;
        }
        body {
 		 counter-reset: section;
			}

		#id::before {
 		 counter-increment: section;
  			content: "" counter(section) "";
		}
		.alert{
			color: #ba2026;
		}

        
    </style>
</head>

<body>
    <div class="container-scroller">
        <!-- partial:partials/_navbar.html -->
        <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="navbar-brand-wrapper d-flex justify-content-center">
                <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
                    <a class="navbar-brand brand-logo" href="admin-index.jsp"><img src="assets/images/demos/demo-10/shoe-logo-footers.png" alt="logo" style="width:fit-content" /></a>
                    <a class="navbar-brand brand-logo-mini" href="admin-index.jsp"><img src="assets/images/demos/demo-10/shoe-logo-footers.png" alt="logo" style="object-fit:cover;object-position:0% 30%"/></a>
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                        <span class="typcn typcn-th-menu"></span>
                    </button>
                </div>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                <ul class="navbar-nav navbar-nav-right">
                    <li class="nav-item nav-date dropdown">
                        <a class="nav-link d-flex justify-content-center align-items-center">
                            <h6 class="date mb-0">Date : <script>document.write(new Date().toDateString("en-US", {timeZone: "Australia/Sydney"}))</script>&nbsp;&nbsp;<span id="span"></span>
                            </h6>

						<script>
						var span = document.getElementById('span');
						
						function time() {
						  var date = new Date().toLocaleString("en-US", {timeZone: "Asia/Kolkata"});
						  var d = new Date(date);
						  var s = d.getSeconds();
						  var m = d.getMinutes();
						  var h = d.getHours();
						  span.textContent = 
						    ("0" + h).substr(-2) + " : " + ("0" + m).substr(-2) + " : " + ("0" + s).substr(-2);
						}
						
						setInterval(time, 1000);
						</script>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
                            <i class="typcn typcn-cog-outline mx-0"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
                             <a href="admin-editprofile.jsp" class="dropdown-item">
                                <i class="typcn typcn-cog-outline text-primary"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="admin-logout.jsp">
                                <i class="typcn typcn-eject text-primary"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                    <span class="typcn typcn-th-menu"></span>
                </button>
            </div>
        </nav>
        <div class="container-fluid page-body-wrapper">
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="admin-index.jsp">
                            <i class='bx bx-home bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-categories.jsp">
                            <i class='bx bx-category bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Categories</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-teams.jsp">
                            <i class='bx bxs-group bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Teams</span>
                        </a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="admin-coo.jsp">
                            <i class='bx bx-world bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Country Of Origin</span>
                        </a>
                    </li> -->
                    <li class="nav-item">
                        <a class="nav-link" href="admin-products.jsp">
                           <i class='bx bx-cube bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Products</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-sliders.jsp">
                            <i class='bx bx-slideshow bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Sliders</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-coupons.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: white;stroke:#ba2026;stroke-width:1.5px;margin-right:8px"><path d="M21 5H3a1 1 0 0 0-1 1v4h.893c.996 0 1.92.681 2.08 1.664A2.001 2.001 0 0 1 3 14H2v4a1 1 0 0 0 1 1h18a1 1 0 0 0 1-1v-4h-1a2.001 2.001 0 0 1-1.973-2.336c.16-.983 1.084-1.664 2.08-1.664H22V6a1 1 0 0 0-1-1zM9 9a1 1 0 1 1 0 2 1 1 0 1 1 0-2zm-.8 6.4 6-8 1.6 1.2-6 8-1.6-1.2zM15 15a1 1 0 1 1 0-2 1 1 0 1 1 0 2z"></path></svg>
                            <span class="menu-title">Coupons</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-inquiries.jsp">
                            <i class='bx bx-message-dots bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Inquiries</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-subscribers.jsp">
                            <i class='bx bx-user-check bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Subscribers</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-users.jsp">
                            <i class='bx bx-group bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Users</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-reviews.jsp">
                            <i class='bx bx-star bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Reviews</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
                            <i class='bx bx-package bx-sm mr-2 text-primary'></i>
                            <span class="menu-title">Orders</span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="charts">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="admin-orders.jsp">All orders</a></li>
                            </ul>
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="admin-pendingorders.jsp">Pending orders</a></li>
                            </ul>
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="admin-activeorders.jsp">Active orders</a></li>
                            </ul>
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="admin-shippingorders.jsp">Shipping orders</a></li>
                            </ul>
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="admin-deliverdorders.jsp">Delivered orders</a></li>
                            </ul>
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="admin-cancelledorders.jsp">Cancelled orders</a></li>
                            </ul>
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="admin-sales.jsp">Sales</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="main-panel">