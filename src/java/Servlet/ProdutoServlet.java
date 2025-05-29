/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

/**
 *
 * @author DELL
 */
import DAO.ProdutoDAO;
import Models.Produto;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ProdutoServlet")
public class ProdutoServlet extends HttpServlet {

    private ProdutoDAO produtoDAO = new ProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "novo":
                req.getRequestDispatcher("produto/novo.jsp").forward(req, resp);
                break;
            case "editar":
                int idEditar = Integer.parseInt(req.getParameter("id"));
                Produto produtoEditar = produtoDAO.buscarPorId(idEditar);
                req.setAttribute("produto", produtoEditar);
                req.getRequestDispatcher("produto/editar.jsp").forward(req, resp);
                break;
            case "excluir":
                int idExcluir = Integer.parseInt(req.getParameter("id"));
                produtoDAO.excluir(idExcluir);
                resp.sendRedirect("ProdutoServlet");
                break;
            default:
                List<Produto> produtos = produtoDAO.listar();
                req.setAttribute("produtos", produtos);
                req.getRequestDispatcher("produto/listar.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Produto produto = new Produto();
        produto.setNome(req.getParameter("nome"));
        produto.setDescricao(req.getParameter("descricao"));
        produto.setPreco(Double.parseDouble(req.getParameter("preco")));

        String id = req.getParameter("id");

        if (id == null || id.isEmpty()) {
            produtoDAO.salvar(produto);
        } else {
            produto.setId(Integer.parseInt(id));
            produtoDAO.atualizar(produto);
        }

        resp.sendRedirect("ProdutoServlet");
    }
}
