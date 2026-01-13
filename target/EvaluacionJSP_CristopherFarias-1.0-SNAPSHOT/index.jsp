<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedidos Vegetarianos</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>Pide la comida más sana a domicilio</h1>
        </div>
        
        <!-- Formulario -->
        <form action="PedidoServlet" method="POST" onsubmit="return validarPedido()">
            <div class="productos-section">
                <div class="productos-grid">
                    <!-- Comidas -->
                    <div class="comida-card">
                        <h3>Hamburguesa vegetariana</h3>
                        <ul class="producto-lista">
                            <li class="producto-item">
                                <span class="producto-nombre">Hamburguesa vegetariana</span>
                                <select name="hamburguesa" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <span class="producto-nombre">Pasta al pesto</span>
                                <select name="pasta" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <span class="producto-nombre">Pizza caprese</span>
                                <select name="pizza" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <span class="producto-nombre">Quinoa con verdura</span>
                                <select name="quinoa" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- Bebidas -->
                    <div class="comida-card">
                        <h3>Agua</h3>
                        <ul class="producto-lista">
                            <li class="producto-item">
                                <span class="producto-nombre">Agua</span>
                                <select name="agua" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <span class="producto-nombre">Cerveza</span>
                                <select name="cerveza" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <span class="producto-nombre">Refresco</span>
                                <select name="refresco" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <!-- Botón -->
                <div class="btn-container">
                    <button type="submit" class="btn-pedido">Hacer pedido</button>
                </div>
            </div>
        </form>
    </div>
    
    <script>
        function validarPedido() {
            let tieneProductos = false;
            const selects = document.querySelectorAll('.cantidad-select');
            
            selects.forEach(select => {
                if (parseInt(select.value) > 0) {
                    tieneProductos = true;
                }
            });
            
            if (!tieneProductos) {
                alert('Por favor, selecciona al menos un producto');
                return false;
            }
            
            return true;
        }
    </script>
</body>
</html>