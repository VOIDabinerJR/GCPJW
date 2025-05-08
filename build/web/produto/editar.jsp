<%-- 
    Document   : editar
    Created on : 08/05/2025, 09:16:47
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="Models.Produto" %>
<jsp:useBean id="produto" class="Models.Produto" scope="request" />
<html>
<head><title>Editar Produto</title></head>
<body>
<h2>Editar Produto</h2>
<form action="../ProdutoServlet" method="post">
    <input type="hidden" name="id" value="${produto.id}" />
    Nome: <input type="text" name="nome" value="${produto.nome}" required /><br/>
    Descrição: <input type="text" name="descricao" value="${produto.descricao}" required /><br/>
    Preço: <input type="number" name="preco" step="0.01" value="${produto.preco}" required /><br/>
    <input type="submit" value="Atualizar" />
</form>
<a href="../ProdutoServlet">Voltar</a>
</body>
</html>
