/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;


import DAO.ClienteDAO;
import Models.Cliente;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ClienteServlet extends HttpServlet {

    private ClienteDAO clienteDAO = new ClienteDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "novo":
                req.getRequestDispatcher("cliente/novo.jsp").forward(req, resp);
                break;
            case "editar":
                int idEditar = Integer.parseInt(req.getParameter("id"));
                Cliente clienteEditar = clienteDAO.buscarPorId(idEditar);
                req.setAttribute("cliente", clienteEditar);
                req.getRequestDispatcher("cliente/editar.jsp").forward(req, resp);
                break;
            case "excluir":
                int idExcluir = Integer.parseInt(req.getParameter("id"));
                clienteDAO.excluir(idExcluir);
                resp.sendRedirect("ClienteServlet");
                break;
            default:
                List<Cliente> clientes = clienteDAO.listar();
                req.setAttribute("clientes", clientes);
                req.getRequestDispatcher("cliente/listar.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cliente cliente = new Cliente();
        cliente.setNome(req.getParameter("nome"));
        cliente.setEmail(req.getParameter("email"));
        cliente.setTelefone(req.getParameter("telefone"));

        String id = req.getParameter("id");

        if (id == null || id.isEmpty()) {
            clienteDAO.salvar(cliente);
        } else {
            cliente.setId(Integer.parseInt(id));
            clienteDAO.atualizar(cliente);
        }

        resp.sendRedirect("ClienteServlet");
    }
}
