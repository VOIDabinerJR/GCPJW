<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f9f9f9;
            color: #333;
        }
        h1, h2 {
            text-align: center;
        }
        .chart-container {
            max-width: 700px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgb(0 0 0 / 0.1);
        }
        table {
            margin: 30px auto;
            border-collapse: collapse;
            width: 90%;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgb(0 0 0 / 0.1);
        }
        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .actions a {
            color: #e74c3c;
            text-decoration: none;
            font-weight: bold;
        }
        .actions a:hover {
            text-decoration: underline;
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
    
    
     .metrics {
        display: flex;
        justify-content: space-between;
        gap: 20px;
        margin-top: 30px;
    }

    .metric {
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 20px;
        width: 30%;
        box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }

    .metric h3 {
        color: #3498db;
        margin-bottom: 10px;
    }

    .metric p {
        font-size: 16px;
        margin: 5px 0;
    }
    </style>

    <!-- Biblioteca Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
    
    <button onclick="alternarTema()" id="botao-tema">🌞 Modo Claro</button>


<h1>Dashboard Geral</h1>
<form action="ExportarCSVServlet" method="get">
    <button type="submit">📁 Exportar como CSV</button>
</form>

<div class="chart-container">
    <canvas id="summaryChart" width="600" height="300"></canvas>
</div>

<script>
    // Pegue os valores do servidor (atenção: no servlet eles devem ser setados como atributos request)
    const totalClientes = ${totalClientes != null ? totalClientes : 0};
    const totalProdutos = ${totalProdutos != null ? totalProdutos : 0};
    const totalAssociacoes = ${totalAssociacoes != null ? totalAssociacoes : 0};

    const ctx = document.getElementById('summaryChart').getContext('2d');

    const summaryChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Clientes', 'Produtos', 'Associações'],
            datasets: [{
                label: 'Quantidade',
                data: [totalClientes, totalProdutos, totalAssociacoes],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.7)',
                    'rgba(255, 206, 86, 0.7)',
                    'rgba(75, 192, 192, 0.7)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: false },
                title: {
                    display: true,
                    text: 'Resumo Geral: Clientes, Produtos e Associações'
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 1
                    }
                }
            }
        }
    });
</script>


<div class="container">
    <h2>📊 Visão Geral</h2>
    
    <div class="metrics">
        <div class="metric">
            <h3>👤 Cliente com mais compras</h3>
            <p>${clienteTop.nome} (ID: ${clienteTop.id})</p>
            <p>Total de Compras: ${maxComprasCliente}</p>
        </div>

        <div class="metric">
            <h3>📦 Produto mais vendido</h3>
            <p>${produtoTop.nome} (ID: ${produtoTop.id})</p>
            <p>Total de Vendas: ${maxVendasProduto}</p>
        </div>

        <div class="metric">
            <h3>💰 Total vendido por você</h3>
            <p>${totalVendidoVendedor}</p>
        </div>
    </div>
</div>

<h2>Vendas</h2>

<table>
    <thead>
        <tr>
            <th>Cliente ID</th>
            <th>Cliente</th>
            <th>Produto</th>
            <th>Produto ID</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${not empty clientesProdutos}">
                <c:forEach var="cp" items="${clientesProdutos}">
                    <tr>
                        <td>${cp.clienteId}</td>
                        <td>${cp.clienteNome}</td>
                        <td>${cp.produtoNome}</td>
                        <td>${cp.produtoId}</td>
                        <td class="actions">
                            <a href="ClienteProdutoServlet?action=desassociar&clienteId=${cp.clienteId}&produtoId=${cp.produtoId}" 
                               onclick="return confirm('Tem certeza que deseja excluir essa associação?')">🗑️ Desassociar</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr><td colspan="5" style="text-align:center;">Nenhuma associação encontrada.</td></tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>


  <!-- Tabela Clientes -->
        <h2 class="section-title">Clientes</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <!-- Adicione mais colunas conforme seu modelo -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cliente" items="${clientes}">
                    <tr>
                        <td>${cliente.id}</td>
                        <td>${cliente.nome}</td>
                        <td>${cliente.email}</td>
                        <td>${cliente.telefone}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Tabela Produtos -->
        <h2 class="section-title">Produtos</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Preço</th>
                    <!-- Adicione mais colunas conforme seu modelo -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="produto" items="${produtos}">
                    <tr>
                        <td>${produto.id}</td>
                        <td>${produto.nome}</td>
                        <td>${produto.descricao}</td>
                        <td>R$ ${produto.preco}</td>
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
