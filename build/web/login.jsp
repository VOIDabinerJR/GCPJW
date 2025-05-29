<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            transition: background-color 0.3s, color 0.3s;
        }

        .tema-claro {
            background-color: #f5f5f5;
            color: #333;
        }

        .tema-escuro {
            background-color: #121212;
            color: #f5f5f5;
        }

        .card {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            text-align: center;
            transition: background-color 0.3s, color 0.3s;
        }

        .tema-escuro .card {
            background-color: #1e1e1e;
            color: #fff;
        }

        h2 {
            margin-bottom: 24px;
        }

        input[type="email"],
        input[type="password"] {
            padding: 10px;
            width: 100%;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        input[type="submit"] {
            padding: 10px;
            width: 100%;
            border: none;
            background-color: #3498db;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
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

        .erro {
            color: red;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <button onclick="alternarTema()" id="botao-tema">🌞 Modo Claro</button>

    <div class="card">
        <h2>Login do Vendedor</h2>
        <form action="auth" method="post">
            <input type="email" name="email" placeholder="Email" required /><br/>
            <input type="password" name="senha" placeholder="Senha" required /><br/>
            <input type="submit" value="Entrar" />
        </form>

        <c:if test="${not empty erro}">
            <p class="erro">${erro}</p>
        </c:if>
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

            localStorage.setItem("tema", body.classList.contains("tema-escuro") ? "escuro" : "claro");
        }

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
