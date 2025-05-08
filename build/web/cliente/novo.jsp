    <%-- 
    Document   : novo
    Created on : 08/05/2025, 09:13:16
    Author     : DELL
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Novo Cliente</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        label {
            font-weight: 500;
            display: block;
            margin-top: 20px;
            color: #34495e;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input:focus {
            border-color: #3498db;
            outline: none;
        }

        .buttons {
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
        }

        .buttons input[type="submit"],
        .buttons a {
            background-color: #3498db;
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 8px;
            border: none;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .buttons a {
            display: inline-block;
            text-align: center;
        }

        .buttons input:hover,
        .buttons a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>➕ Novo Cliente</h2>
    <form action="../clientes" method="post">
        <label for="nome">Nome</label>
        <input type="text" name="nome" id="nome" required />

        <label for="email">Email</label>
        <input type="email" name="email" id="email" required />

        <label for="telefone">Telefone</label>
        <input type="text" name="telefone" id="telefone" required />

        <div class="buttons">
            <input type="submit" value="Salvar" />
            <a href="../clientes">Voltar</a>
        </div>
    </form>
</div>
</body>
</html>
