<%@page import="java.util.*"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1">
<title>Dashboard</title>

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/dashboard.css" />
<link rel="stylesheet" href="css/daterangepicker.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />

<script src="js/jquery.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/daterangepicker.js"></script>
<script src="js/fullcalendar.js"></script>

</head>

<body>

	<%
		
	%>


	<div class="container" id="allPage">
		<nav class="navbar navbar-default navbar-static-top">
			<div class="container-fluid">
				<a class="navbar-brand navbar-right" href="#"> <img class="logo"
					alt="Syntel Logo" src="syntel-logo.png">
				</a>
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"> <img class="book-logo"
						alt="Syntel Logo" src="book-logo.png">
					</a>

				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Dashboard</a></li>
						<li><a href="#">Make a Booking</a></li>
						<li><a href="#">Account</a></li>
						<li><a href="#">Add A Resource</a></li>
						<li><a href="#">Log Out</a></li>
					</ul>



				</div>
			</div>
		</nav>

		<div class="container" id="rows">

			<div class="row">

				<div class="col-lg-12">
					<div class="panel">

						<div class="panel-body">
							<div id="dispCal"></div>
						</div>
					</div>
					<!--Panel-->
				</div>
				<!--Col-->

			</div>
			<!--Row-->
		</div>

	</div>
	<!--All Page-->

	<!--Edit Event Modal -->
	<div class="modal fade" id="changeEventModal" tabindex="-1"
		role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Change Event</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="eventChangeBody">
					<div class="input-group">
						<div class="input-group-addon">
							<span class='glyphicon glyphicon-calendar'></span> <span
								class="input-group-text">Room</span>
						</div>
						<input class="form-control input-md" type="text" id="editRoom"
							name="editRoom" readonly="readonly" />
					</div>
					<div class="input-group">
						<div class="input-group-addon">
							<span class='glyphicon glyphicon-calendar'></span> <span
								class="input-group-text">From</span>
						</div>
						<input class="form-control input-md" type="text"
							placeholder="DD-MM" id="editDate" name="editDate" required />
					</div>

					<div class="input-group">
						<div class="input-group-addon">
							<span class='glyphicon glyphicon-time'></span> <span
								class="input-group-text">From</span>
						</div>
						<input class="form-control input-md" type="time"
							placeholder="HH:MM" id="editTimeFrom" name="editTimeFrom"
							required>
					</div>

					<div class="input-group">
						<div class="input-group-addon">
							<span class='glyphicon glyphicon-time'></span> <span
								class="input-group-text">To</span>
						</div>
						<input class="form-control input-md" type="time"
							placeholder="HH:MM" id="editTimeTo" name="editTimeTo" required>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger">Delete</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<!--Add Event Modal -->
	<div class="modal fade" id="addEventModal" tabindex="-1" role="dialog"
		aria-labelledby="eventModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addEventLabel">Add Event</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="./addEvent.jsp">

					<div class="modal-body" id="eventAddBody">
						<div class="input-group">
							<div class="input-group-addon">
								<span class='glyphicon glyphicon-calendar'></span> <span
									class="input-group-text">Room</span>
							</div>
							<input class="form-control input-md" type="text" id="room"
								name="room" readonly="readonly" />
						</div>
						<div class="input-group">
							<div class="input-group-addon">
								<span class='glyphicon glyphicon-calendar'></span> <span
									class="input-group-text">From</span>
							</div>
							<input class="form-control input-md" type="text"
								placeholder="DD-MM" id="date" name="date" required />
						</div>

						<div class="input-group">
							<div class="input-group-addon">
								<span class='glyphicon glyphicon-time'></span> <span
									class="input-group-text">From</span>
							</div>
							<input class="form-control input-md" type="time"
								placeholder="HH:MM" id="timeFrom" name="timeFrom" required>
						</div>

						<div class="input-group">
							<div class="input-group-addon">
								<span class='glyphicon glyphicon-time'></span> <span
									class="input-group-text">To</span>
							</div>
							<input class="form-control input-md" type="time"
								placeholder="HH:MM" id="timeTo" name="timeTo" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<button type='submit' class="btn btn-primary">Add Event</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<script>
		var active = "view";

		$(document)
				.ready(
						function() {

							console.log("Ready");

							$('input[name="date"]').daterangepicker({
								minDate : moment().startOf('hour'),
								alwaysShowCalendars : true,
								locale : {
									format : 'YY/MM/DD'
								}
							});

							$('input[name="editDate"]').daterangepicker({
								minDate : moment().startOf('hour'),
								alwaysShowCalendars : true,
								locale : {
									format : 'YY/MM/DD'
								}
							});

							$("#view").css("background-color", "lightblue");

							$('#dispCal')
									.fullCalendar(
											{
												header : {
													left : 'prev,next today',
													center : 'title',
													right : 'agendaWeek,agendaDay'
												},
												height : 500,
												defaultDate : '2018-08-07',
												defaultView : 'agendaWeek',
												selectable : true,
												selectConstraint : {
													start : moment().startOf(
															'day'),
													end : moment().startOf(
															'day').add(6,
															'months'),
												},
												select : function(startDate,
														endDate) {
													$("#roomName").html(
															"Scrum 3");
													$("#date").data(
															'daterangepicker')
															.setStartDate(
																	startDate);
													$("#date")
															.data(
																	'daterangepicker')
															.setEndDate(endDate);
													$("#timeFrom")
															.val(
																	startDate
																			.format("HH:mm"));
													$("#timeTo")
															.val(
																	endDate
																			.format("HH:mm"));
													$("#addEventModal").modal(
															"show");
												},

												eventMouseover : function(
														calEvent, js) {
													var tooltip = '<div class="tooltipevent" style="width:100px;height:100px;background:lightblue;position:absolute;z-index:10001;">'
															+ calEvent.title
															+ "<br/>"
															+ calEvent.start
																	.format('MM/DD, h:mm a')
															+ '</div>';
													$("body").append(tooltip);
													$(this)
															.mouseover(
																	function(e) {
																		$(this)
																				.css(
																						'z-index',
																						10000);
																		$(
																				'.tooltipevent')
																				.fadeIn(
																						'500');
																		$(
																				'.tooltipevent')
																				.fadeTo(
																						'10',
																						1.9);
																	})
															.mousemove(
																	function(e) {
																		$(
																				'.tooltipevent')
																				.css(
																						'top',
																						e.pageY + 10);
																		$(
																				'.tooltipevent')
																				.css(
																						'left',
																						e.pageX + 20);
																	});

												},

												eventMouseout : function(
														calEvent, jsEvent) {
													$(this).css('z-index', 8);
													$('.tooltipevent').remove();
												},

												eventClick : function(calEvent,
														jsEvent, view) {

													$("#editDate")
															.data(
																	'daterangepicker')
															.setStartDate(
																	calEvent.start);
													$("#editDate")
															.data(
																	'daterangepicker')
															.setEndDate(
																	calEvent.end);
													$("#editTimeFrom")
															.val(
																	calEvent.start
																			.format("HH:mm"));
													$("#editTimeTo")
															.val(
																	calEvent.end
																			.format("HH:mm"));
													$("#editRoom").val(
															calEvent.title);

													$("#changeEventModal")
															.modal('show');

												},

												eventLimit : true, // allow "more" link when too many events
												events : [
												          
														{
															title : 'Scrum Room 3',
															start : '2018-08-10T09:00:00',
															end : '2018-08-10T12:00:00',
															backgroundColor : 'blue'
														},
														{
															title : 'Conference Room 1',
															start : '2018-08-10T09:00:00',
															end : '2018-08-10T12:00:00',
															backgroundColor : 'red'

														} ]

											});

						});
	</script>

</body>

</html>