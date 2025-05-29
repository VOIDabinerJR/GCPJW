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
    private String clienteNome;
    private String produtoNome;

    public ClienteProduto() {
    }

    public ClienteProduto(int clienteId, int produtoId) {
        this.clienteId = clienteId;
        this.produtoId = produtoId;
    }

    public ClienteProduto(int clienteId, int produtoId, String clienteNome, String produtoNome) {
        this.clienteId = clienteId;
        this.produtoId = produtoId;
        this.clienteNome = clienteNome;
        this.produtoNome = produtoNome;
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

    public String getClienteNome() {
        return clienteNome;
    }

    public void setClienteNome(String clienteNome) {
        this.clienteNome = clienteNome;
    }

    public String getProdutoNome() {
        return produtoNome;
    }

    public void setProdutoNome(String produtoNome) {
        this.produtoNome = produtoNome;
    }
    
    
    
    @Override
public String toString() {
    return "ClienteProduto{" +
            "clienteId=" + clienteId +
            ", produtoId=" + produtoId +
            '}';
}

  

}

