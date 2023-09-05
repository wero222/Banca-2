<%@page import="bank.ContoCorrente"%>
<%@page import="bank.Banca"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% Banca b = new Banca(); %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Banca</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h1>Banca</h1>
		<hr>
		
		<% if(request.getParameter("esito") != null) { %>
			<div class="alert alert-success">
				Operazione eseguita correttamente
			</div>
		<% } %>
		
		<a href="./nuovo-bonifico.jsp" class="btn btn-primary">Crea un bonifico</a>
		<a href="#" class="btn btn-outline-primary ms-2">Preleva da un conto</a>
		<div class="row mt-4">
			<% for(ContoCorrente c : b.getConti()) { %>
			<div class="col-4">
				<h5>Conto #<%= c.getNumero() %></h5>
				<p class="text-muted"><%= c.getIntestatario() %></p>
				<p class="text-primary">€ <%= String.format("%.2f", c.getSaldo()) %>
			</div>
			<% } %>
		</div>
	</div>
	
</body>
</html>