<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Conversor de Moedas</title>
	<style>
		label {
			display: inline-block;
			width: 150px;
			text-align: right;
			margin-right: 10px;
		}
		input[type="submit"] {
			margin-left: 150px;
		}
	</style>
</head>
<body>
	<h2>Conversor de Moedas</h2>
	<form method="post">
		<label>Moeda de Origem:</label>
		<select name="moeda_origem">
			<option value="BRL">Real (BRL)</option>
			<option value="USD">Dólar (USD)</option>
		</select><br><br>
		<label>Moeda de Destino:</label>
		<select name="moeda_destino">
			<option value="BRL">Real (BRL)</option>
			<option value="USD">Dólar (USD)</option>
		</select><br><br>
		<label>Valor a ser convertido:</label>
		<input type="number" step="0.01" name="valor_origem"><br><br>
		<input type="submit" value="Converter">
	</form>
	<%
	if (request.getMethod().equals("POST")) {
		String moedaOrigem = request.getParameter("moeda_origem");
		String moedaDestino = request.getParameter("moeda_destino");
		double valorOrigem = Double.parseDouble(request.getParameter("valor_origem"));
		double valorDestino = (moedaOrigem.equals("BRL") && moedaDestino.equals("USD")) ? valorOrigem / 5.55 : (moedaOrigem.equals("USD") && moedaDestino.equals("BRL")) ? valorOrigem * 5.55 : valorOrigem;
	%>
	<h2>Resultado da Conversão:</h2>
	<p><%= String.format("%.2f", valorDestino) %> <%= moedaDestino %></p>
	<%
	}
	%>
</body>
</html>
