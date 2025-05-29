/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

/**
 *
 * @author DELL
 */
import DAO.ClienteDAO;
import DAO.ClienteProdutoDAO;
import DAO.ProdutoDAO;
import Models.Cliente;
import Models.ClienteProduto;
import Models.Produto;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ClienteProdutoServlet")
public class ClienteProdutoServlet extends HttpServlet {

    private ClienteProdutoDAO cpDAO = new ClienteProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtem lista de produtos do banco
            String action = request.getParameter("action");
            ProdutoDAO produtoDAO = new ProdutoDAO();
            List<Produto> produtos = produtoDAO.listar();
            ClienteDAO ClienteDAO = new ClienteDAO();
            List<Cliente> clientes = ClienteDAO.listar();
            ClienteProdutoDAO clienteProdutoDAO = new ClienteProdutoDAO();
            List<ClienteProduto> clientesProdutos = clienteProdutoDAO.listar();

            if ("desassociar".equals(action)) {
                try {
                    int clienteId = Integer.parseInt(request.getParameter("clienteId"));
                    int produtoId = Integer.parseInt(request.getParameter("produtoId"));

                    clienteProdutoDAO.desassociarProduto(clienteId, produtoId);

                    response.sendRedirect("ClienteProdutoServlet"); // recarrega a lista
                    return;
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Erro ao desassociar.");
                    return;
                }
            }

            // Armazena na sessão para o JSP acessar via ${produtos}
            request.getSession().setAttribute("produtos", produtos);
            request.getSession().setAttribute("clientes", clientes);
            request.getSession().setAttribute("clientesProdutos", clientesProdutos);

            // Encaminha para a página associar.jsp
            request.getRequestDispatcher("associar.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao carregar produto cliente.");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int clienteId = Integer.parseInt(req.getParameter("clienteId"));
        int produtoId = Integer.parseInt(req.getParameter("produtoId"));
        String action = req.getParameter("action");

        if ("associar".equals(action)) {
            cpDAO.associarProduto(clienteId, produtoId);
        } else if ("desassociar".equals(action)) {
            cpDAO.desassociarProduto(clienteId, produtoId);
        }

        resp.sendRedirect("ClienteProdutoServlet");
    }
}
