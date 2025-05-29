
package Servlet;

import DAO.ClienteProdutoDAO;
import Models.ClienteProduto;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ExportarCSVServlet")
public class ExportarCSVServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Simule DAOs ou use seus DAOs reais
        ClienteProdutoDAO dao = new ClienteProdutoDAO();
        List<ClienteProduto> associacoes = dao.listarTodasAssociacoes();

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"relatorio_associacoes.csv\"");

        PrintWriter out = response.getWriter();

        // Cabeçalho
        out.println("Cliente ID,Cliente Nome,Produto ID,Produto Nome");

        // Dados
        for (ClienteProduto cp : associacoes) {
            out.printf("%d,%s,%d,%s%n",
                cp.getClienteId(),
                cp.getClienteNome(),
                cp.getProdutoId(),
                cp.getProdutoNome()
            );
        }

        out.flush();
        out.close();
    }
}
