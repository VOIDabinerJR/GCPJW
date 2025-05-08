<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, Models.Cliente" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="clientes" type="java.util.List" scope="request" />
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 40px;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
        }

        .actions-top {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
        }

        .actions-top a {
            text-decoration: none;
            background-color: #2980b9;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .actions-top a:hover {
            background-color: #1c5f8a;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #f8f9fa;
            color: #34495e;
            font-weight: 600;
        }

        td a {
            margin-right: 10px;
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
        }

        td a:hover {
            color: #1d6fa5;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            th {
                display: none;
            }

            td {
                position: relative;
                padding-left: 50%;
                text-align: right;
                border: none;
                border-bottom: 1px solid #eee;
            }

            td::before {
                position: absolute;
                left: 16px;
                width: 45%;
                white-space: nowrap;
                font-weight: bold;
                color: #7f8c8d;
                text-align: left;
            }

            td:nth-of-type(1)::before { content: "ID"; }
            td:nth-of-type(2)::before { content: "Nome"; }
            td:nth-of-type(3)::before { content: "Email"; }
            td:nth-of-type(4)::before { content: "Telefone"; }
            td:nth-of-type(5)::before { content: "Ações"; }
        }
    </style>
</head>
<body>

<h2>Lista de Clientes</h2>
<div class="actions-top">
    <a href="cliente/novo.jsp">➕ Novo Cliente</a>
    <a href="index.jsp">🏠 Início</a>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="cliente" items="${clientes}">
            <tr>
                <td>${cliente.id}</td>
                <td>${cliente.nome}</td>
                <td>${cliente.email}</td>
                <td>${cliente.telefone}</td>
                <td>
                    <a href="ClienteServlet?acao=editar&id=${cliente.id}">✏️ Editar</a>
                    <a href="ClienteServlet?acao=excluir&id=${cliente.id}" onclick="return confirm('Tem certeza que deseja excluir?')">🗑️ Excluir</a>
                    <a href="associar?clienteId=${cliente.id}">🔗 Associar</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
