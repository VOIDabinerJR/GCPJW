<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, Models.Produto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="produtos" class="java.util.ArrayList" scope="session" />
<%
    String clienteId = request.getParameter("clienteId");
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Associar Produtos</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f7fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: #ffffff;
            padding: 30px 40px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            border-radius: 12px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
        }

        select:focus {
            border-color: #3498db;
            outline: none;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #1abc9c;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Associar Produtos ao Cliente #<%= clienteId %></h2>
        <form action="ClienteProdutoServlet" method="post">
            <input class="hidden" type="hidden" name="clienteId" value="<%= clienteId %>" />
            <input class="hidden" type="hidden" name="acao" value="associar" />

            <label for="produtoId">Selecione um produto:</label>
            <select id="produtoId" name="produtoId" required>
                <option value="" disabled selected>-- Escolha um produto --</option>
                <c:forEach var="produto" items="${produtos}">
                    <option value="${produto.id}">${produto.nome}</option>
                </c:forEach>
            </select>

            <input type="submit" value="Associar Produto" />
        </form>
        <a class="back-link" href="clientes">&larr; Voltar</a>
    </div>
</body>
</html>
