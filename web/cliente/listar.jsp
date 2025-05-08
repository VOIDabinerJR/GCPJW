<%-- 
    Document   : listar
    Created on : 08/05/2025, 09:15:43
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, Models.Cliente" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="clientes" type="java.util.List" scope="request" />
<html>
<head><title>Clientes</title></head>
<body>
   
<h2>Lista de Clientes</h2>
<a href="cliente/novo">Novo Cliente</a> | <a href="index.jsp">Início</a>
<table border="1">
    <tr>
        <th>ID</th><th>Nome</th><th>Email</th><th>Telefone</th><th>Ações</th>
    </tr>
    <c:forEach var="cliente" items="${clientes}">
        <tr>
            <td>${cliente.id}</td>
            <td>${cliente.nome}</td>
            <td>${cliente.email}</td>
            <td>${cliente.telefone}</td>
            <td>
                <a href="ClienteServlet?acao=editar&id=${cliente.id}">Editar</a>
                <a href="ClienteServlet?acao=excluir&id=${cliente.id}" onclick="return confirm('Tem certeza?')">Excluir</a>
                <a href="associar?clienteId=${cliente.id}">Associar Produtos</a>
            </td>
        </tr>
        
    </c:forEach>
</table>
</body>
</html>
