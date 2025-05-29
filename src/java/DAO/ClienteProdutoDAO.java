/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author DELL
 */
import Models.ClienteProduto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteProdutoDAO {

    public void associarProduto(int clienteId, int produtoId) {
        String sql = "INSERT INTO cliente_produto (cliente_id, produto_id) VALUES (?, ?)";
        try (Connection conn = ConnectionFactory.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, clienteId);
            stmt.setInt(2, produtoId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void desassociarProduto(int clienteId, int produtoId) {
        String sql = "DELETE FROM cliente_produto WHERE cliente_id = ? AND produto_id = ?";
        try (Connection conn = ConnectionFactory.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, clienteId);
            stmt.setInt(2, produtoId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<ClienteProduto> listar() {
        List<ClienteProduto> lista = new ArrayList<>();
        String sql = """
        SELECT cp.cliente_id, cp.produto_id, c.nome AS cliente_nome, p.nome AS produto_nome
        FROM cliente_produto cp
        JOIN cliente c ON cp.cliente_id = c.id
        JOIN produto p ON cp.produto_id = p.id
        """;
        try (Connection conn = ConnectionFactory.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                ClienteProduto cp = new ClienteProduto();
                cp.setClienteId(rs.getInt("cliente_id"));
                cp.setProdutoId(rs.getInt("produto_id"));
                cp.setClienteNome(rs.getString("cliente_nome"));
                cp.setProdutoNome(rs.getString("produto_nome"));

                lista.add(cp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    
    // Exemplo para ClienteProdutoDAO listar todas associações
public List<ClienteProduto> listarTodasAssociacoes() {
    List<ClienteProduto> lista = new ArrayList<>();
    String sql = "SELECT c.id as clienteId, c.nome as clienteNome, p.id as produtoId, p.nome as produtoNome " +
                 "FROM cliente_produto cp " +
                 "JOIN cliente c ON cp.cliente_id = c.id " +
                 "JOIN produto p ON cp.produto_id = p.id";

    try (Connection con = ConnectionFactory.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while(rs.next()) {
            ClienteProduto cp = new ClienteProduto();
            cp.setClienteId(rs.getInt("clienteId"));
            cp.setClienteNome(rs.getString("clienteNome"));
            cp.setProdutoId(rs.getInt("produtoId"));
            cp.setProdutoNome(rs.getString("produtoNome"));

            lista.add(cp);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return lista;
}


}
