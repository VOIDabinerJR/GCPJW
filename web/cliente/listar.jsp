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

<h2>Lista de Clientes</h2>
<div class="actions-top">
    <a href="ClienteServlet?action=novo">➕ Novo Cliente</a>
    <a href="/GCPJW">🏠 Início</a>
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
                    <a href="ClienteServlet?action=editar&id=${cliente.id}">✏️ Editar</a>
                    <a href="ClienteServlet?action=excluir&id=${cliente.id}" onclick="return confirm('Tem certeza que deseja excluir?')">🗑️ Excluir</a>
                    <a href="associar?clienteId=${cliente.id}&clienteName=${cliente.nome}">🔗 Associar</a>
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

</body>
</html>
