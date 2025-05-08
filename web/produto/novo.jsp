<%-- 
    Document   : novo
    Created on : 08/05/2025, 09:16:20
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Novo Produto</title></head>
<body>
<h2>Novo Produto</h2>
<form action="../ProdutoServlet" method="post">
    Nome: <input type="text" name="nome" required /><br/>
    Descrição: <input type="text" name="descricao" required /><br/>
    Preço: <input type="number" name="preco" step="0.01" required /><br/>
    <input type="submit" value="Salvar" />
</form>
<a href="../ProdutoServlet">Voltar</a>
</body>
</html>
