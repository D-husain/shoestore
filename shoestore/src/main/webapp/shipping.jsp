<%@page import="pojo.User"%>
<%@page import="pojo.ShippingAddress"%>
<%@page import="dao.UserDao"%>
<%
		Integer id = Integer.parseInt(request.getParameter("uid"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String cname=request.getParameter("cname");
		String country =request.getParameter("country");
		String state=request.getParameter("state");
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		String city = request.getParameter("city");
		
		int zip =Integer.parseInt(request.getParameter("zip"));
		
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		String onote=request.getParameter("onote");
		
		
		UserDao dao = new UserDao();
		ShippingAddress s = new ShippingAddress();
		
		User u = dao.getUserById(id);
		
		s.setUser(u);
		s.setFname(fname);
		s.setLname(lname);
		s.setCname(cname);
		s.setCountry(country);
		s.setAddress1(add1);
		s.setAddress2(add2);
		s.setCity(city);
		s.setZip(zip);
		s.setContact(contact);
		s.setEmail(email);
		s.setOnote(onote);
		s.setState(state);
		
		dao.AddShipping(s);
		
		response.sendRedirect("confirm-order.jsp?msg=done");
%>