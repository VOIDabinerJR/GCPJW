<%-- 
    Document   : listar
    Created on : 08/05/2025, 09:17:21
    Author     : DELL
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, Models.Produto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="produtos" type="java.util.List" scope="request" />
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Lista de Produtos</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f8f9fa;
            margin: 0;
            padding: 40px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .top-bar a {
            background-color: #3498db;
            color: white;
            padding: 10px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .top-bar a:hover {
            background-color: #2980b9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 8px 24px rgba(0,0,0,0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
        }

        th {
            background-color: #ecf0f1;
            color: #34495e;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f4f6f8;
        }

        .actions a {
            margin-right: 10px;
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
        }

        .actions a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 960px;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📦 Lista de Produtos</h2>

    <div class="top-bar">
        <a href="produto/novo.jsp">➕ Novo Produto</a>
        <a href="../index.jsp">🏠 Início</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="produto" items="${produtos}">
                <tr>
                    <td>${produto.id}</td>
                    <td>${produto.nome}</td>
                    <td>${produto.descricao}</td>
                    <td>${produto.preco}</td>
                    <td class="actions">
                        <a href="ProdutoServlet?acao=editar&id=${produto.id}">✏️ Editar</a>
                        <a href="ProdutoServlet?acao=excluir&id=${produto.id}" onclick="return confirm('Tem certeza que deseja excluir este produto?')">🗑️ Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
