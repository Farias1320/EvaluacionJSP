/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servicio;

/**
 *
 * @author estudiante
 */

import modelo.*;
import java.util.*;

public class MenuService {
    private final Map<String, Producto> menu;
    
    public MenuService() {
        menu = new LinkedHashMap<>();
        inicializarMenu();
    }
    
    private void inicializarMenu() {
        // Comidas (EXACTOS precios de la imagen)
        menu.put("quinoa", new Comida("Quinoa con verdura", 6.95));
        menu.put("pizza", new Comida("Pizza caprese", 4.90));  // Nota: En resultado muestra 4.9
        menu.put("pasta", new Comida("Pasta al pesto", 5.50));  // Nota: En resultado muestra 5.5
        menu.put("hamburguesa", new Comida("Hamburguesa vegetariana", 6.20));
        
        // Bebidas
        menu.put("agua", new Bebida("Agua", 1.00));
        menu.put("cerveza", new Bebida("Cerveza", 1.50));
        menu.put("refresco", new Bebida("Refresco", 1.40));
    }
    
    public Producto getProducto(String clave) {
        return menu.get(clave);
    }
    
    public Map<String, Producto> getMenuCompleto() {
        return new LinkedHashMap<>(menu);
    }
}
