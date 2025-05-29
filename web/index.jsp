<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Exemplo pegando vendedor do session
    Models.Vendedor vendedor = (Models.Vendedor) session.getAttribute("vendedorLogado");
    String vendedorNome = (vendedor != null) ? vendedor.getNome() : "Visitante";
%>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Início</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative; /* para posicionar o nome do vendedor */
        }

        .container {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 28px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin: 15px 0;
        }

        a {
            text-decoration: none;
            color: #ffffff;
            background-color: #3498db;
            padding: 12px 25px;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            display: inline-block;
            font-size: 16px;
        }

        a:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        /* Estilo para o nome do vendedor no canto superior direito */
        .vendedorNome {
            position: absolute;
            top: 15px;
            right: 15px;
            font-weight: bold;
            color: #2c3e50;
            font-size: 14px;
            font-family: 'Segoe UI', sans-serif;
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
    
   
    <div class="vendedorNome">
        Bem-vindo, <%= vendedorNome %>!
        <button onclick="alternarTema()" id="botao-tema">🌞 Modo Claro</button>
        <a href="auth" style="
   
    top: 20px;
    left: 20px;
    background-color: #2c3e50;
    color: #ecf0f1;
    padding: 10px 18px;
    text-decoration: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
    transition: background-color 0.3s ease;
" onmouseover="this.style.backgroundColor='#34495e'" onmouseout="this.style.backgroundColor='#2c3e50'">
    Login 
</a>

    </div>
 
    <div class="container">
        <h1>Gerenciamento de Clientes e Produtos</h1>
        <ul>
            <li><a href="ClienteServlet">Gerenciar Clientes</a></li>
            <li><a href="ProdutoServlet">Gerenciar Produtos</a></li>
            <li><a href="ClienteProdutoServlet">Vender</a></li>
                    <li><a href="DashboardServlet">Dashboard</a></li>
            
        </ul>
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
            botao.textContent = "? Modo Escuro";
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
