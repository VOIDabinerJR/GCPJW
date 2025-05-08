    <%-- 
    Document   : novo
    Created on : 08/05/2025, 09:13:16
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Novo Cliente</title></head>
<body>
<h2>Novo Cliente</h2>
<form action="../ClienteServlet" method="post">
    Nome: <input type="text" name="nome" required /><br/>
    Email: <input type="email" name="email" required /><br/>
    Telefone: <input type="text" name="telefone" required /><br/>
    <input type="submit" value="Salvar" />
</form>
<a href="../clientes">Voltar</a>
</body>
</html>
