package Models;

import java.sql.Timestamp;

public class Venda {
    private int id;
    private int clienteId;
    private int vendedorId;
    private Timestamp dataHora;
    private double total;

    // Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getClienteId() { return clienteId; }
    public void setClienteId(int clienteId) { this.clienteId = clienteId; }

    public int getVendedorId() { return vendedorId; }
    public void setVendedorId(int vendedorId) { this.vendedorId = vendedorId; }

    public Timestamp getDataHora() { return dataHora; }
    public void setDataHora(Timestamp dataHora) { this.dataHora = dataHora; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
}
