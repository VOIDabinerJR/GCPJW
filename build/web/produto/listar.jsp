<%-- 
    Document   : listar
    Created on : 08/05/2025, 09:17:21
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, Models.Produto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="produtos" type="java.util.List" scope="request" />
<html>
<head><title>Produtos</title></head>
<body>
<h2>Lista de Produtos</h2>
<a href="produto/novo.jsp">Novo Produto</a> | <a href="../index.jsp">Início</a>
<table border="1">
    <tr>
        <th>ID</th><th>Nome</th><th>Descrição</th><th>Preço</th><th>Ações</th>
    </tr>
    <c:forEach var="produto" items="${produtos}">
        <tr>
            <td>${produto.id}</td>
            <td>${produto.nome}</td>
            <td>${produto.descricao}</td>
            <td>${produto.preco}</td>
            <td>
                <a href="ProdutoServlet?acao=editar&id=${produto.id}">Editar</a>
                <a href="ProdutoServlet?acao=excluir&id=${produto.id}" onclick="return confirm('Tem certeza?')">Excluir</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
