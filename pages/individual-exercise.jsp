<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<!-- Enables responsive viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Bootstrap links -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	

	<!-- Our stuff -->
	<link rel="stylesheet" href="../stylesheet.css">
	<script src="../script.js"></script>
	<title>PB Fitness</title>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- Logo Section - links back to original page -->
		<a class="navbar-brand" href="../index.html">
			<img src="../assets/logo.png" alt="logo src here" width="30" height="30">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<!-- Main navbar links section -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="../index.html">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="../pages/workouts.html">Workouts <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="../pages/exercises.jsp">Exercises <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="../pages/tips.html">Tips<span class="sr-only">(current)</span></a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2 form-control-sm" type="search" placeholder="Exercise Search" aria-label="Search">
				<button class="btn btn-outline-info btn-sm ml-2" type="submit">Search</button>
			</form>
			<a class="nav-link text-info" href="../pages/ourphilosophy.html">Our Philosophy <span class="sr-only">(current)</span></a>
		</div>
	</nav>
	<div class="card text-center mt-4">
		<div class="card-header">
			<%
				try {
					int choice = Integer.parseInt(request.getParameter("exercise_list"));
					String dbURL = "jdbc:mysql://localhost:3306/fitness?serverTimezone=UTC";
					Connection con = DriverManager.getConnection(dbURL, "root", "password");
					String query = "SELECT name FROM exercises WHERE id = ?;";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setInt(1, choice);

					// Must move the cursor to the first object in the row
					ResultSet rs = ps.executeQuery();
					rs.first();
					out.println(rs.getString(1));
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(new java.io.PrintWriter(out));
				}
			%>
		</div>
	</div>
	<%-- NOTE!!!!!!!!!!!!!!!!! --%>
	<%-- The exercises page passes in the ID of the exercise selected --%>

	<div class="media mt-4 ml-4">
		<div class="media-body">
			<%-- <p> Query: exercises.description --%>
			<h4 class="media-heading">Description:</h4>
			<%
                try {
					int choice = Integer.parseInt(request.getParameter("exercise_list"));
					String dbURL = "jdbc:mysql://localhost:3306/fitness?serverTimezone=UTC";
					Connection con = DriverManager.getConnection(dbURL, "root", "password");
					String query = "SELECT description FROM exercises WHERE id = ?;";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setInt(1, choice);

					// Must move the cursor to the first object in the row
					ResultSet rs = ps.executeQuery();
					rs.first();
					out.println(rs.getString(1));
				} catch (SQLException e) {
					e.printStackTrace(new java.io.PrintWriter(out));
				}
			%>
			
		</div>
		<div class="media-right mr-4">
			<img src="../assets/sitting-bicep-curl.jpg" alt="bicep curl image" class="media-object" style="width:240px">
		</div>
	</div>
	
	<div class="media mt-4 ml-4">
		<div class="media-body">
			<h4 class="media-heading">Primary Muscle:</h4>
			<%
				try {
					String select = request.getParameter("exercise_list");
					int choice = Integer.parseInt(select);
					String dbURL = "jdbc:mysql://localhost:3306/fitness?serverTimezone=UTC";
					Connection con = DriverManager.getConnection(dbURL, "root", "password");
					String query = "SELECT DISTINCT muscles.name " +
							"FROM muscles join exercises " +
							"ON exercises.primary_muscle = muscles.id " +
							"WHERE exercises.id = ?" +
							"AND exercises.primary_muscle = muscles.id;";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setString(1, select);

					// Must move the cursor to the first object in the row
					ResultSet rs = ps.executeQuery();
					rs.first();
					out.println("<ul><li>" + rs.getString(1) + "</ul></li>");
					query = "SELECT DISTINCT secondary_muscles.name " +
							"FROM secondary_muscles join exercises " +
							"ON exercises.secondary_muscle = secondary_muscles.id " +
							"WHERE exercises.id = ?" +
							"AND exercises.secondary_muscle = secondary_muscles.id;";
					ps = con.prepareStatement(query);
					ps.setString(1, select);
					rs = ps.executeQuery();
					rs.first();
					out.println("<h4 class=\"media-heading\">Secondary Muscle:</h4>");
					out.println("<ul><li>" + rs.getString(1) + "</ul></li>");

					con.close();
				} catch (SQLException e) {
					e.printStackTrace(new java.io.PrintWriter(out));
				}

			%>
			<h4 class="media-heading">Difficulty:</h4>

			<%
				try {
					String select = request.getParameter("exercise_list");
					int choice = Integer.parseInt(select);
					String dbURL = "jdbc:mysql://localhost:3306/fitness?serverTimezone=UTC";
					Connection con = DriverManager.getConnection(dbURL, "root", "password");

					// First get the exercise ID to link to difficulty
					String query = "SELECT exercises.difficulty FROM exercises WHERE exercises.id = ?";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setString(1, select);

					ResultSet rs = ps.executeQuery();
					rs.first();
					int difficulty = Integer.parseInt(rs.getString(1));

					query = "SELECT difficulty.level, difficulty.warning " +
							"FROM difficulty " +
							"WHERE difficulty.id = ?;";

					ps = con.prepareStatement(query);
					ps.setInt(1, difficulty);
					rs = ps.executeQuery();
					if (!(rs.next())) {
						out.println("Empty Query");
					}

//					rs.first();
					out.println("<ul><li>" +  rs.getString(1) + "</li>");
					out.println("<li>" + rs.getString(2) + "</ul></li>");

					con.close();
				} catch (SQLException e) {
					e.printStackTrace(new java.io.PrintWriter(out));
				}

			%>
		</div>
	</div>

    <br><br><br>

	<div class="card text-center mt-4">
		<div class="card-header">
			Individual Exercises
		</div>
		<div class="card-body">
			<p class="card-text">Select an Exercise.</p>
			<br>
			<form id="exercise_form" class="form-inline my-2 my-lg-0 select-form" action="individual-exercise.jsp" method="post" name="exercise">
				<select class="form-control form-control-sm mr-3" name="exercise_list">
					<%
						try {
							String dbURL = "jdbc:mysql://localhost:3306/fitness?serverTimezone=UTC";
							Connection con = DriverManager.getConnection(dbURL, "root", "password");
							String query = "SELECT name from exercises;";

							PreparedStatement ps = con.prepareStatement(query);

							ResultSet rs = ps.executeQuery();
							int counter = 0;
							while (rs.next()) {
								out.println("<option value=" + counter +  ">" + rs.getString(1) + "</option>");
								counter++;
							}

						} catch (SQLException e) {
							e.printStackTrace(new java.io.PrintWriter(out));
						}
					%>
				</select>
				<button type="submit" class="btn btn-primary">Submit</button>

			</form>
		</div>
	</div>
	</div>
</body>
</html>