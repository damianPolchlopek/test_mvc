<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<title>Person</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
</head>

<body>

	<div class="body-container">

		<header class="my-5 pt-5 text-center text-small">
			<h4>Aplikacja sluzaca do przechowywania danych pomiarowych</h4>
		</header>

		<div class="container-fluid">

		<div class="row content">

			<div class="col-sm-3 sidenav" style="height: 100%;
												min-height: 450px;">

				<h4>Main menu:</h4>

				<ul class="nav nav-pills nav-stacked">

					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/login/loginOk">
							<span class="glyphicon glyphicon-home" ></span>
							Home
						</a>
					</li>

					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/person/showPerson">
							<span class="glyphicon glyphicon-user" ></span>
							Users
						</a>
					</li>

					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/login/showLogin">
							<span class="glyphicon glyphicon-th-list" ></span>
							Last logs
						</a>
					</li>

					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/measurement/showMeasurement">
							<span class="glyphicon glyphicon-stats" ></span>
							Measurements
						</a>
					</li>

					<security:authorize access="hasRole('EMPLOYEE')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/measurement/addMeasurementPanel">
								<span class="glyphicon glyphicon-plus" ></span>
								Add Measurement
							</a>
						</li>
					</security:authorize>

					<security:authorize access="hasRole('ADMIN')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/person/showFormForAdd">
								<span class="glyphicon glyphicon-plus" ></span>
								Add user
							</a>
						</li>
					</security:authorize>

					<security:authorize access="hasRole('ADMIN')">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/admin">
								<span class="glyphicon glyphicon-eye-open" ></span>
								Admin
							</a>
						</li>
					</security:authorize>

					<hr>
					<li class="nav-item">
						<!-- Add a logout button -->
						<form:form action="${pageContext.request.contextPath}/logout"
								   method="POST">

							<button type="submit" class="btn btn-info">
								<span class="glyphicon glyphicon-off" ></span>
								Logout
							</button>

						</form:form>
					</li>

				</ul><br>

			</div>

			<div class="col-sm-9" style="overflow-x:auto;">

				<!-- add our html table here -->
				<table class="table table-striped table-sm" width="100%;">
					<tr>
						<%--<th>Id</th>--%>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Username</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Update Password</th>
						<security:authorize access="hasRole('ADMIN')">
							<th style="text-align: center">Update</th>
						</security:authorize>
						<security:authorize access="hasRole('ADMIN')">
							<th style="text-align: center">Delete</th>
						</security:authorize>
					</tr>

					<!-- loop over and print our people -->
					<c:forEach var="tempPerson" items="${people}">

						<!-- construct an "update" link with person id -->
						<c:url var="updateLink" value="/person/showFormForUpdate">
							<c:param name="personId" value="${tempPerson.id}"/>
						</c:url>

						<!-- construct an "updatePassword" link with person id -->
						<c:url var="updatePasswordLink" value="/person/showFormUpdatePassword">
							<c:param name="personId" value="${tempPerson.id}"/>
						</c:url>

						<!-- construct an "delete" link with person id -->
						<c:url var="deleteLink" value="/person/delete">
							<c:param name="personId" value="${tempPerson.id}"/>
						</c:url>

						<tr>
							<%--<td> ${tempPerson.id} </td>--%>
							<td> ${tempPerson.firstName} </td>
							<td> ${tempPerson.lastName} </td>
							<td> ${tempPerson.nickName} </td>
							<td> ${tempPerson.email} </td>
							<td> ${tempPerson.phone} </td>

							<td>
								<c:set var = "actualUser" value = "Mary"/>
								<c:if test="${tempPerson.nickName == actualUser}">
									<form:form action="${updatePasswordLink }" method="POST">
										<button type="submit" class="btn btn-info">
											Update
										</button>
									</form:form>
								</c:if>

								<c:if test="${tempPerson.nickName != actualUser}">
										<button class="btn btn-info" disabled="disabled">
											Update
										</button>
								</c:if>

							</td>

							<security:authorize access="hasRole('ADMIN')">
								<td>
									<form:form action="${updateLink }" method="POST">
										<button type="submit" class="btn btn-info">
											Update
										</button>
									</form:form>
								</td>
							</security:authorize>

							<security:authorize access="hasRole('ADMIN')">
								<td>
									<form:form action="${deleteLink }" method="POST">
										<button type="submit" class="btn btn-danger">
											Delete
										</button>
									</form:form>
								</td>
							</security:authorize>

						</tr>

					</c:forEach>

				</table>

			</div>
		</div>


	</div>


		<footer class="my-5 pt-5 text-center text-small">
			<h4>Damian Polchlopek - Praca licencjacka</h4>
		</footer>

	</div>

</body>

</html>
