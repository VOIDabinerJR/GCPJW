<%-- 
    Document   : editar
    Created on : 08/05/2025, 09:16:47
    Author     : DELL
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="Models.Produto" %>
<jsp:useBean id="produto" class="Models.Produto" scope="request" />
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Editar Produto</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f3f7;
            padding: 40px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: 600;
            color: #333;
        }

        input[type="text"],
        input[type="number"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 5px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
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
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>✏️ Editar Produto</h2>
    <form action="ProdutoServlet" method="post">
        <input type="hidden" name="id" value="${produto.id}" />
        
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="${produto.nome}" required />
        
        <label for="descricao">Stock</label>
        <input type="text" id="descricao" name="descricao" value="${produto.descricao}" required />
        
        <label for="preco">Preço:</label>
        <input type="number" id="preco" name="preco" step="0.01" value="${produto.preco}" required />
        
        <input type="submit" value="Atualizar" />
    </form>
    <a class="back-link" href="ProdutoServlet">⬅️ Voltar</a>
</div>
</body>
</html>
