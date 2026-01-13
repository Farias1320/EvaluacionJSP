<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.Pedido" %>
<%@ page import="modelo.Pedido.ItemPedido" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado del Pedido</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <div class="container">
        <div class="resultado-container">
            <div class="resultado-header">
                <h2>Aquí tiene su pedido</h2>
            </div>
            
            <%
                Pedido pedido = (Pedido) request.getAttribute("pedido");
                if (pedido != null && pedido.getCantidadTotal() > 0) {
                    List<ItemPedido> items = pedido.getItems();
                    
                    // Mapa de imágenes por producto
                    java.util.Map<String, String> imagenes = new java.util.HashMap<>();
                    imagenes.put("Hamburguesa vegetariana", "images/comida1.png");
                    imagenes.put("Pasta al pesto", "images/comida2.png");
                    imagenes.put("Pizza caprese", "images/comida3.png");
                    imagenes.put("Quinoa con verdura", "images/comida4.png");
                    imagenes.put("Agua", "images/bebida1.png");
                    imagenes.put("Cerveza", "images/bebida2.png");
                    imagenes.put("Refresco", "images/bebida3.png");
            %>
            
            <table class="tabla-resultado">
                <thead>
                    <tr>
                        <th>Comida / bebida</th>
                        <th>PVP</th>
                        <th>Cantidad</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (ItemPedido item : items) { 
                        if (item.getCantidad() > 0) {
                            String nombre = item.getProducto().getNombre();
                            String imagen = imagenes.get(nombre);
                    %>
                    <tr>
                        <td>
                            <% if (imagen != null) { %>
                            <div class="producto-con-imagen">
                                <div class="tabla-img-container">
                                    <img src="<%= imagen %>" alt="<%= nombre %>" class="tabla-img">
                                </div>
                                <%= nombre %>
                            </div>
                            <% } else { %>
                            <%= nombre %>
                            <% } %>
                        </td>
                        <td><%= String.format("%.1f", item.getProducto().getPrecio()) %> €</td>
                        <td><%= item.getCantidad() %></td>
                        <td><strong><%= String.format("%.1f", item.getSubtotal()) %> €</strong></td>
                    </tr>
                    <% } 
                       } %>
                </tbody>
            </table>
            
            <div class="total-section">
                <h3>Total</h3>
                <div class="total-precio">
                    <%= String.format("%.1f", pedido.calcularTotal()) %> €
                </div>
            </div>
            
            <% } else { %>
            
            <div class="pedido-vacio">
                <h3>No has seleccionado ningún producto</h3>
                <p>Vuelve al menú para hacer tu pedido</p>
            </div>
            
            <% } %>
            
            <div class="text-center mt-40">
                <a href="index.jsp" class="btn-volver">Volver al menú</a>
            </div>
        </div>
    </div>
</body>
</html>