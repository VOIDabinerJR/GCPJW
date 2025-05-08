/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

/**
 *
 * @author DELL
 */

import DAO.ClienteProdutoDAO;
import DAO.ProdutoDAO;
import Models.Produto;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ClienteProdutoServlet extends HttpServlet {

    private ClienteProdutoDAO cpDAO = new ClienteProdutoDAO();
    
    
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        // Obtem lista de produtos do banco
        ProdutoDAO produtoDAO = new ProdutoDAO();
        List<Produto> produtos = produtoDAO.listar();

        // Armazena na sessão para o JSP acessar via ${produtos}
        request.getSession().setAttribute("produtos", produtos);

        // Encaminha para a página associar.jsp
        request.getRequestDispatcher("associar.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar produtos.");
    }
}


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int clienteId = Integer.parseInt(req.getParameter("clienteId"));
        int produtoId = Integer.parseInt(req.getParameter("produtoId"));
        String acao = req.getParameter("acao");

        if ("associar".equals(acao)) {
            cpDAO.associarProduto(clienteId, produtoId);
        } else if ("desassociar".equals(acao)) {
            cpDAO.desassociarProduto(clienteId, produtoId);
        }

        resp.sendRedirect("ClienteServlet"); 
    }
}
