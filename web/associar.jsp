<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, Models.Produto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="produtos" class="java.util.ArrayList" scope="session" />
<%
    String clienteId = request.getParameter("clienteId");
    String clienteName = request.getParameter("clienteName");
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
            <h2>Associar Produtos ao Cliente #<%= clienteName%></h2>
            <form action="ClienteProdutoServlet" method="post">
                <p>ou</p>

                <select id="clienteId" name="clienteId" >
                    <option value="" disabled selected>-- Escolha um Cliente --</option>
                    <c:forEach var="cliente" items="${clientes}">
                        <option value="${cliente.id}">${cliente.nome}</option>
                    </c:forEach>
                </select>
                <input  type="text" name="clienteId" value="<%= clienteId%>" />


                <input class="hidden" type="hidden" name="action" value="associar" />

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


            <table>
                <thead>
                    <tr>

                        <th>Cliente ID</th>

                        <th>Cliente</th> 
                        <th>Produto</th>
                        <th>Produto ID</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="clienteProduto" items="${clientesProdutos}">
                        <tr>
                            <td>${clienteProduto.clienteId}</td>
                            <td>${clienteProduto.clienteNome}</td>
                            <td>${clienteProduto.produtoNome}</td>
                            <td>${clienteProduto.produtoId}</td>
                            <td class="actions">
                                
                                <a href="ClienteProdutoServlet?action=desassociar&clienteId=${clienteProduto.clienteId}&produtoId=${clienteProduto.produtoId}" onclick="return confirm('Tem certeza que deseja excluir essa associacao?')">🗑️ desassociar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
            
                
                
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
