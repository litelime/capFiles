<%@page import="dao.bookings.*, dao.resources.*"%>
<%@page
	import="java.sql.*, java.util.*, java.time.*,java.time.format.DateTimeFormatter"%>
<%
	
    String date = request.getParameter("date");
	String[] dates = date.split("-");
	
	String timeTo = request.getParameter("timeTo");
	String timeFrom = request.getParameter("timeFrom");
	
   	DateTimeFormatter format = DateTimeFormatter.ofPattern("uu/MM/dd HH:mm");
  
	String dates1 = dates[0]+""+timeFrom;
	String dates2 = dates[1]+" "+timeTo;
	dates2=dates2.trim();

   	LocalDateTime date1 = LocalDateTime.parse(dates1,format);
   	LocalDateTime date2 = LocalDateTime.parse(dates2,format);
   	Timestamp setter1 = new Timestamp(date1.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli());
   	Timestamp setter2 = new Timestamp(date2.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli());

   	Bookings newB = new Bookings();
	newB.setIsActive(1);
	newB.setBookedStartTime(setter1);
	newB.setBookedEndTime(setter2);
	newB.setResourceId(1001);
	newB.setUserId(101);
   	
    new BookingsJdbcTemplate().insert(newB);
    List<Bookings> all = new BookingsJdbcTemplate().getAll();
    int id = 0 ;
    for(Bookings b : all){
    	if(b.getBookingId()>id)
    		id=b.getBookingId();
    }
	
	String resourceName = new ResourcesJdbcTemplate().search(newB.getResourceId()).getResourceName();

	out.write(newB.toString()+","+resourceName+","+id);

%>
