<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Viagem</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
	</div>
	<br />
	<div align="center" class="container">
		<form action="viagem" method="post">
			<p class="title">
				<b>Viagem e Onibus</b>
			</p>
			<table>
				<tr>
				<td><input class="b" id="botao" name="botao" type="submit" value="Viagem"></td>
				<td><input class="b" id="botao" name="botao" type="submit" value="Onibus"></td>				
				</tr>
			</table>
		</form>
	</div>
	<div align="center">
		<c:if test="${not empty erro}">
		<c:out value="${erro }"></c:out>
		</c:if>
		<c:if test="${not empty viagem }">
	<table border="1">
		<thead>
			<tr>
				<th><b>codigo</b></th>
				<th><b>onibus</b></th>
				<th><b>hora_saida</b></th>
				<th><b>hora_chegada</b></th>
				<th><b>partida</b></th>
				<th><b>destino</b></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${viagem }" var="v">
				<tr>
					<td><c:out value="${v.codigo }"></c:out></td>
					<td><c:out value="${v.onibus }"></c:out></td>
					<td><c:out value="${v.hora_saida }"></c:out></td>
					<td><c:out value="${v.hora_chegada }"></c:out></td>
					<td><c:out value="${v.partida }"></c:out></td>
					<td><c:out value="${v.destino }"></c:out></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</c:if>
		<c:if test="${not empty onibus }">
		<table border="1">
		<thead>
			<tr>
				<th><b>placa</b></th>
				<th><b>marca</b></th>
				<th><b>ano</b></th>
				<th><b>descricao</b></th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${onibus }" var="o">
			<tr>
				<td><c:out value="${o.placa }"></c:out></td>
				<td><c:out value="${o.marca }"></c:out></td>
				<td><c:out value="${o.ano }"></c:out></td>
				<td><c:out value="${o.descricao }"></c:out></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</c:if>
</div>
</body>
</html>