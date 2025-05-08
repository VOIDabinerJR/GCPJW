<%-- 
    Document   : novo
    Created on : 08/05/2025, 09:16:20
    Author     : DELL
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Novo Produto</title>
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
            background-color: #2ecc71;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #27ae60;
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
    <h2>➕ Novo Produto</h2>
    <form action="../produtos" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required />
        
        <label for="descricao">Descrição:</label>
        <input type="text" id="descricao" name="descricao" required />
        
        <label for="preco">Preço:</label>
        <input type="number" id="preco" name="preco" step="0.01" required />
        
        <input type="submit" value="Salvar" />
    </form>
    <a class="back-link" href="../produtos">⬅️ Voltar</a>
</div>
</body>
</html>
