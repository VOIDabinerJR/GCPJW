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
        
        
    .tema-claro {
        background-color: #ffffff;
        color: #000000;
    }

    .tema-escuro {
        background-color: #121212;
        color: #ffffff;
    }

    .tema-escuro .card, .tema-escuro table {
        background-color: #1e1e1e;
        color: #ffffff;
    }

    #botao-tema {
        position: absolute;
        top: 20px;
        right: 20px;
        padding: 8px 12px;
        border: none;
        border-radius: 8px;
        background-color: #3498db;
        color: white;
        cursor: pointer;
    }
    </style>
</head>
<body>
    <button onclick="alternarTema()" id="botao-tema">🌞 Modo Claro</button>

<div class="container">
    <h2>📦 Lista de Produtos</h2>

    <div class="top-bar">
        <a href="ProdutoServlet?action=novo">➕ Novo Produto</a>
        <a href="/GCPJW">🏠 Início</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Stock</th>
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
                        <a href="ProdutoServlet?action=editar&id=${produto.id}">✏️ Editar</a>
                        <a href="ProdutoServlet?action=excluir&id=${produto.id}" onclick="return confirm('Tem certeza que deseja excluir este produto?')">🗑️ Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    
    
    
    <script>
    function alternarTema() {
        const body = document.body;
        const botao = document.getElementById("botao-tema");

        if (body.classList.contains("tema-escuro")) {
            body.classList.remove("tema-escuro");
            body.classList.add("tema-claro");
            botao.textContent = "🌞 Modo Claro";
        } else {
            body.classList.remove("tema-claro");
            body.classList.add("tema-escuro");
            botao.textContent = "🌙 Modo Escuro";
        }

        // Salvar preferências no localStorage (opcional)
        localStorage.setItem("tema", body.classList.contains("tema-escuro") ? "escuro" : "claro");
    }

    // Ao carregar, aplicar o tema salvo
    window.onload = function () {
        const temaSalvo = localStorage.getItem("tema");
        if (temaSalvo === "escuro") {
            document.body.classList.add("tema-escuro");
            document.getElementById("botao-tema").textContent = "🌙 Modo Escuro";
        } else {
            document.body.classList.add("tema-claro");
            document.getElementById("botao-tema").textContent = "🌞 Modo Claro";
        }
    };
</script>

</div>
</body>
</html>
