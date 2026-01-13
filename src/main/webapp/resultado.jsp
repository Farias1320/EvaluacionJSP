<%-- 
    Document   : resultado
    Created on : 13 ene 2026, 4:06:26 p. m.
    Author     : estudiante
--%>

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
                    %>
                    <tr>
                        <td><%= item.getProducto().getNombre() %></td>
                        <td><%= String.format("%.1f", item.getProducto().getPrecio()) %> €</td>
                        <td><%= item.getCantidad() %></td>
                        <td><%= String.format("%.1f", item.getSubtotal()) %> €</td>
                    
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
            
            <div style="text-align: center; padding: 40px; color: #666;">
                <h3>No has seleccionado ningún producto</h3>
                <p>Vuelve al menú para hacer tu pedido</p>
            </div>
            
            <% } %>
            
            <div style="text-align: center; margin-top: 30px;">
                <a href="index.jsp" class="btn-volver">Volver al menú</a>
            </div>
        </div>
    </div>
</body>
</html>