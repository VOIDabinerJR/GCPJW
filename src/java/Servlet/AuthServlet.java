package Servlet;

import DAO.VendedorDAO;
import Models.Vendedor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    private VendedorDAO vendedorDAO;

    @Override
    public void init() throws ServletException {
        vendedorDAO = new VendedorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("acao");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Vendedor vendedor = vendedorDAO.autenticar(email, senha);

        if (vendedor != null) {
            HttpSession session = request.getSession();
            session.setAttribute("vendedorLogado", vendedor);
            
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("erro", "Email ou senha inválidos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
