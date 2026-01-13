/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author estudiante
 */

public class Comida extends Producto {
    
    public Comida(String nombre, double precio) {
        super(nombre, precio);
    }
    
    @Override
    public String getTipo() {
        return "Comida";
    }
}