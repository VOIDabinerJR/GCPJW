<%-- 
    Document   : associar
    Created on : 08/05/2025, 09:18:15
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, Models.Produto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="produtos" class="java.util.ArrayList" scope="session" />
<%
    String clienteId = request.getParameter("clienteId");
%>
<html>
<head><title>Associar Produtos</title></head>
<body>
<h2>Associar Produtos ao Cliente ID: <%= clienteId %></h2>
<form action="ClienteProdutoServlet" method="post">
    <input type="hidden" name="clienteId" value="<%= clienteId %>"/>
    <select name="produtoId">
        <c:forEach var="produto" items="${produtos}">
            <option value="${produto.id}">${produto.nome}</option>
        </c:forEach>
    </select>
    <input type="hidden" name="acao" value="associar" />
    <input type="submit" value="Associar Produto" />
</form>
<a href="ClienteServlet">Voltar</a>
</body>
</html>
