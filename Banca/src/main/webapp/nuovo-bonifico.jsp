<%@page import="bank.ContoCorrente"%>
<%@page import="bank.Banca"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% Banca b = new Banca(); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Nuovo bonifico</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Crea un bonifico</h1>
		<a href="./">Torna indietro</a>
		<hr>
		
		<!-- VALIDATION ERRORS -->
		<% if(request.getParameter("errore") != null) { %>
			<div class="alert alert-danger">
				<% if(request.getParameter("errore").equals("da")) { %>
					Il mittente non esiste
				<% } else if(request.getParameter("errore").equals("a")) { %>
					Il destinatario non esiste
				<% } else if(request.getParameter("errore").equals("importo")) { %>
					Inserisci un importo corretto
				<% } else if(request.getParameter("errore").equals("idem")) { %>
					Il conto del destinatario non può essere lo stesso del mittente
				<% } else { %>
					<%= request.getParameter("errore") %>
				<% } %>
			</div>
		<% } %>
		
		<form action="./create-bonifico" method="post">
			<div class="row">
				<div class="col">
					<label for="cc_da">Mittente</label>
					<select class="form-select" id="cc_da" name="da">
						<option value="">Scegli...</option>
						<% for(ContoCorrente c : b.getConti()) { %>
							<option value="<%= c.getNumero() %>"><%= c.getNumero() %></option>
						<% } %>
					</select>
				</div>
				<div class="col">
					<label for="cc_a">Destinatario</label>
					<select class="form-select" id="cc_a" name="a">
						<option value="">Scegli...</option>
						<% for(ContoCorrente c : b.getConti()) { %>
							<option value="<%= c.getNumero() %>"><%= c.getNumero() %></option>
						<% } %>
					</select>
				</div>
				<div class="col">
					<label for="importo">Importo</label>
					<div class="input-group">
					  <span class="input-group-text" id="importo">€</span>
					  <input type="text" class="form-control" name="importo">
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-success mt-3">Crea bonifico</button>
		</form>
	</div>
</body>
</html>