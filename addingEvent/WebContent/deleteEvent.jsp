<%@page import="dao.bookings.*"%>
<%@page
	import="java.sql.*, java.time.*,java.time.format.DateTimeFormatter"%>
<%
	
	int id = Integer.parseInt(request.getParameter("bookingId"));
	new BookingsJdbcTemplate().delete(id);
	
%>
