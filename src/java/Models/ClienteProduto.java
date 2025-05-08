/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author DELL
 */
    

public class ClienteProduto {
    private int clienteId;
    private int produtoId;

    public ClienteProduto() {
    }

    public ClienteProduto(int clienteId, int produtoId) {
        this.clienteId = clienteId;
        this.produtoId = produtoId;
    }

    public int getClienteId() {
        return clienteId;
    }

    public void setClienteId(int clienteId) {
        this.clienteId = clienteId;
    }

    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }
    
    @Override
public String toString() {
    return "ClienteProduto{" +
            "clienteId=" + clienteId +
            ", produtoId=" + produtoId +
            '}';
}

}

