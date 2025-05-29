/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author DELL
 */
import Models.Venda;
import java.sql.*;
import java.util.*;

public class VendaDAO {

    public int salvarVenda(Venda venda) {
        String sql = "INSERT INTO venda (cliente_id, vendedor_id, data_hora, total) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, venda.getClienteId());
            stmt.setInt(2, venda.getVendedorId());
            stmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            stmt.setDouble(4, venda.getTotal());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // ID da venda inserida
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Venda> listarVendas() {
        List<Venda> lista = new ArrayList<>();
        String sql = "SELECT * FROM venda ORDER BY data_hora DESC";
        try (Connection conn = ConnectionFactory.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Venda v = new Venda();
                v.setId(rs.getInt("id"));
                v.setClienteId(rs.getInt("cliente_id"));
                v.setVendedorId(rs.getInt("vendedor_id"));
                v.setDataHora(rs.getTimestamp("data_hora"));
                v.setTotal(rs.getDouble("total"));
                lista.add(v);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

//    public List<Venda> filtrarPorClienteOuData(Integer clienteId, Date data) {
//        List<Venda> lista = new ArrayList<>();
//        StringBuilder sql = new StringBuilder("SELECT * FROM venda WHERE 1=1");
//
//        if (clienteId != null) sql.append(" AND cliente_id = ?");
//        if (data != null) sql.append(" AND DATE(data_hora) = ?");
//
//        try (Connection conn = ConnectionFactory.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
//
//            int index = 1;
//            if (clienteId != null) stmt.setInt(index++, clienteId);
//            if (data != null) stmt.setDate(index, new java.sql.Date(data.getTime()));
//
//            ResultSet rs = stmt.executeQuery();
//            while (rs.next()) {
//                Venda v = new Venda();
//                v.setId(rs.getInt("id"));
//                v.setClienteId(rs.getInt("cliente_id"));
//                v.setVendedorId(rs.getInt("vendedor_id"));
//                v.setDataHora(rs.getTimestamp("data_hora"));
//                v.setTotal(rs.getDouble("total"));
//                lista.add(v);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return lista;
//    }
}
