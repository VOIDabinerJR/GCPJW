<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="Models.Cliente" %>
<jsp:useBean id="cliente" class="Models.Cliente" scope="request" />
<html>
<head><title>Editar Cliente</title></head>
<body>
<h2>Editar Cliente</h2>
<form action="../ClienteServlet" method="post">
    <input type="hidden" name="id" value="${cliente.id}" />
    Nome: <input type="text" name="nome" value="${cliente.nome}" required /><br/>
    Email: <input type="email" name="email" value="${cliente.email}" required /><br/>
    Telefone: <input type="text" name="telefone" value="${cliente.telefone}" required /><br/>
    <input type="submit" value="Atualizar" />
</form>
<a href="../ClienteServlet">Voltar</a>
</body>
</html>
