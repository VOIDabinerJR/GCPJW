<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="Models.Cliente" %>
<jsp:useBean id="cliente" class="Models.Cliente" scope="request" />
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #2c3e50;
        }

        form input[type="text"],
        form input[type="email"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        form input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form input[type="submit"]:hover {
            background-color: #1e8449;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #3498db;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        a:hover {
            color: #21618c;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Editar Cliente</h2>
        <form action="ClienteServlet" method="post">
            <input type="hidden" name="id" value="${cliente.id}" />
            <input type="text" name="nome" value="${cliente.nome}" placeholder="Nome completo" required />
            <input type="email" name="email" value="${cliente.email}" placeholder="Email" required />
            <input type="text" name="telefone" value="${cliente.telefone}" placeholder="Telefone" required />
            <input type="submit" value="Atualizar" />
        </form>
        <a href="ClienteServlet">← Voltar</a>
    </div>
</body>
</html>
