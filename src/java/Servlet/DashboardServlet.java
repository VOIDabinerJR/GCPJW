package Servlet;

import DAO.ClienteDAO;
import DAO.ProdutoDAO;
import DAO.ClienteProdutoDAO;

import Models.Cliente;
import Models.Produto;
import Models.ClienteProduto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    private ClienteDAO clienteDAO = new ClienteDAO();
    private ProdutoDAO produtoDAO = new ProdutoDAO();
    private ClienteProdutoDAO clienteProdutoDAO = new ClienteProdutoDAO();
    int idTopCliente ;
    int idTopProduto;
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Buscar lista de clientes
        List<Cliente> clientes = clienteDAO.listar(); // implementar método listar()
        // Buscar lista de produtos
        List<Produto> produtos = produtoDAO.listar(); // implementar método listar()
        // Buscar lista de associações cliente-produto
        List<ClienteProduto> clientesProdutos = clienteProdutoDAO.listarTodasAssociacoes();

int totalClientes = clientes.size();
int totalProdutos = produtos.size();
int totalAssociacoes = clientesProdutos.size();
Map<Integer, Integer> contagemProdutos = new HashMap<>();
for (ClienteProduto cp : clientesProdutos) {
    contagemProdutos.put(cp.getProdutoId(), contagemProdutos.getOrDefault(cp.getProdutoId(), 0) + 1);
}

 idTopProduto = -1;
int maxVendas = 0;

for (Map.Entry<Integer, Integer> entry : contagemProdutos.entrySet()) {
    if (entry.getValue() > maxVendas) {
        idTopProduto = entry.getKey();
        maxVendas = entry.getValue();
    }
}

Produto produtoTop = produtos.stream()
    .filter(p -> p.getId() == idTopProduto)
    .findFirst()
    .orElse(null);


Map<Integer, Integer> contagemClientes = new HashMap<>();
for (ClienteProduto cp : clientesProdutos) {
    contagemClientes.put(cp.getClienteId(), contagemClientes.getOrDefault(cp.getClienteId(), 0) + 1);
}
 idTopCliente = -1;
int maxCompras = 0;

for (Map.Entry<Integer, Integer> entry : contagemClientes.entrySet()) {
    if (entry.getValue() > maxCompras) {
        idTopCliente = entry.getKey();
        maxCompras = entry.getValue();
    }
}

Cliente clienteTop = clientes.stream()
    .filter(c -> c.getId() == idTopCliente)
    .findFirst()
    .orElse(null);


req.setAttribute("totalClientes", totalClientes);
req.setAttribute("totalProdutos", totalProdutos);
req.setAttribute("totalAssociacoes", totalAssociacoes);
        // Colocar os dados no request
        req.setAttribute("clientes", clientes);
        req.setAttribute("produtos", produtos);
        req.setAttribute("clientesProdutos", clientesProdutos);

       req.setAttribute("clienteTop", clienteTop);
req.setAttribute("produtoTop", produtoTop);
req.setAttribute("maxVendasProduto", maxVendas);
req.setAttribute("maxComprasCliente", maxCompras); // Enviar para a JSP do dashboard
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }
}
