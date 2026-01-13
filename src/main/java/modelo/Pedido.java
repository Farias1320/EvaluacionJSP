/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author estudiante
 */

import java.util.ArrayList;
import java.util.List;

public class Pedido {
    private final List<ItemPedido> items;
    
    public Pedido() {
        this.items = new ArrayList<>();
    }
    
    // Clase interna para item con cantidad
    public static class ItemPedido {
        private final Producto producto;
        private final int cantidad;
        
        public ItemPedido(Producto producto, int cantidad) {
            this.producto = producto;
            this.cantidad = cantidad;
        }
        
        public Producto getProducto() { return producto; }
        public int getCantidad() { return cantidad; }
        public double getSubtotal() {
            return producto.getPrecio() * cantidad;
        }
    }
    
    // Agregar producto al pedido
    public void agregarProducto(Producto producto, int cantidad) {
        if (cantidad > 0) {
            items.add(new ItemPedido(producto, cantidad));
        }
    }
    
    // Calcular total
    public double calcularTotal() {
        double total = 0;
        for (ItemPedido item : items) {
            total += item.getSubtotal();
        }
        return total;
    }
    
    // Getter items
    public List<ItemPedido> getItems() {
        return new ArrayList<>(items); // Retorna copia
    }
    
    // Cantidad total de items
    public int getCantidadTotal() {
        int total = 0;
        for (ItemPedido item : items) {
            total += item.getCantidad();
        }
        return total;
    }
}
