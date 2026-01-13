/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

/**
 *
 * @author estudiante
 */

import modelo.*;
import servicio.MenuService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/PedidoServlet")
public class PedidoServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        MenuService menuService = new MenuService();
        Pedido pedido = new Pedido();
        
        // Productos del menú
        String[] productos = {"quinoa", "pizza", "pasta", "hamburguesa", 
                              "agua", "cerveza", "refresco"};
        
        for (String producto : productos) {
            String cantidadStr = request.getParameter(producto);
            try {
                int cantidad = Integer.parseInt(cantidadStr);
                if (cantidad > 0) {
                    Producto p = menuService.getProducto(producto);
                    if (p != null) {
                        pedido.agregarProducto(p, cantidad);
                    }
                }
            } catch (NumberFormatException e) {
                // Si no es número, cantidad = 0
            }
        }
        
        // Enviar a la vista
        request.setAttribute("pedido", pedido);
        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }
}