<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href='<c:url value="/styles/springsource.css"/>' type="text/css"/>
	<title>mvc-1-start: Account Details</title>
</head>

<body>
<div id="main_wrapper">

<h1>Account Details</h1>
<c:url value='/app/accounts/${account.entityId}.json' var="jsonUrl"/>
<p><a href="${jsonUrl}">View as JSON</a></p>
<table>
	<tr><td>
		<table>
			<tr>
				<td>Account:</td>
				<td>${account.number}</td>
			</tr>
			<tr>
				<td>Name:</td>
				<td>${account.name}</td>
			</tr>
		</table>
	</td></tr>
	<tr><td>
		<table>
			<thead>
				<tr>
					<td>Beneficiaries:</td>
				</tr>
				<tr>
					<td>Name</td>
					<td>Allocation Percentage</td>
					<td>Savings</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${account.beneficiaries}" var="beneficiary">
					<tr>
						<td>${beneficiary.name}</td>
						<td>${beneficiary.allocationPercentage}</td>
						<td>${beneficiary.savings}</td>
						<%-- TODO xx: add an extra <td> with a <form> that POSTs to "${account.entityId}/beneficiaries/${beneficiary.name}"
						     and contains a hidden parameter to signal that this is to be treated as a DELETE instead --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</td></tr>
</table>
<h2>Add a new beneficiary</h2>
<c:url value='/app/accounts/${account.entityId}/beneficiaries' var="addUrl"/>
<form action="${addUrl}" method="post">
	Name: <input type="text" name="beneficiaryName" />
	<input type="submit" value="Add" />
</form>
</div>
</body>

</html>