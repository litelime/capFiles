<%@page
	import="java.sql.*, java.time.*,java.time.format.DateTimeFormatter"%>

<%
Connection dbconn;//the connection to the database. 

/*
	CONSTRUCTOR DBConnect(username, password)

	Creates a connection to the oracle database using the username and password
	arguments. 

*/

    final String oracleURL = "jdbc:oracle:thin:@localhost:1521:XE";

	 try {
            Class.forName("oracle.jdbc.OracleDriver");

    } catch (ClassNotFoundException e) {
            System.err.println("ClassNotFoundException: Error loading Oracle JDBC driver.");
            System.exit(-1);
    }

    // make and return a database connection to the user's
    // Oracle database
    dbconn = null;

    try {
            dbconn = DriverManager.getConnection(oracleURL,"PRMSAdmin","pass");
    } catch (SQLException e) {

            System.err.println("SQLException: Could not open JDBC connection.");
            System.err.println("Message:   " + e.getMessage());
            System.err.println("SQLState:  " + e.getSQLState());
            System.err.println("ErrorCode: " + e.getErrorCode());
            System.exit(-1);

    }
    /*
	"BOOKING_ID" NUMBER, 
	"RESOURCE_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"IS_ACTIVE" NUMBER DEFAULT 1, 
	"BOOKED_START_TIME" TIMESTAMP (6), 
	"BOOKED_END_TIME" TIMESTAMP (
)
	*/
	
    String date = request.getParameter("date");
	String[] dates = date.split("-");
	
	String timeTo = request.getParameter("timeTo");
	String timeFrom = request.getParameter("timeFrom");
	
    PreparedStatement stat = dbconn.prepareStatement("Insert into PRMSADMIN.BOOKINGS (BOOKING_ID,RESOURCE_ID,USER_ID,IS_ACTIVE,BOOKED_START_TIME,BOOKED_END_TIME) values (SEQ_BOOKING.NEXTVAL,?,?,?,?,?)");
   	stat.setString(1,"1001");
   	stat.setString(2,"101");
   	stat.setString(3,"1");
	
   	DateTimeFormatter format = DateTimeFormatter.ofPattern("uu/MM/dd HH:mm");
  
	String dates1 = dates[0]+""+timeFrom;
	String dates2 = dates[1]+" "+timeTo;
	dates2=dates2.trim();

   	LocalDateTime date1 = LocalDateTime.parse(dates1,format);
   	LocalDateTime date2 = LocalDateTime.parse(dates2,format);
   	Timestamp setter1 = new Timestamp( date1.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli());
   	Timestamp setter2 = new Timestamp( date1.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli());

   	stat.setTimestamp(4, setter1);
   	stat.setTimestamp(5, setter2);

	int ret = stat.executeUpdate();
	if(ret>0){
		out.write("Success");
	    response.sendRedirect("./dashboard.jsp");
	}

    
	
	
%>
