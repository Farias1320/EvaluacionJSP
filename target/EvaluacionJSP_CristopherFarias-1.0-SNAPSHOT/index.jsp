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
                        <div class="card-header">
                            
                            <h3>Hamburguesa vegetariana</h3>
                        </div>
                        <ul class="producto-lista">
                            <li class="producto-item">
                                <div class="producto-con-imagen">
                                    <div class="mini-img-container">
                                        <img src="images/comida1.png" alt="Hamburguesa vegetariana" class="mini-img">
                                    </div>
                                    <span class="producto-nombre">Hamburguesa vegetariana</span>
                                </div>
                                <select name="hamburguesa" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <div class="producto-con-imagen">
                                    <div class="mini-img-container">
                                        <img src="images/comida2.png" alt="Pasta al pesto" class="mini-img">
                                    </div>
                                    <span class="producto-nombre">Pasta al pesto</span>
                                </div>
                                <select name="pasta" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <div class="producto-con-imagen">
                                    <div class="mini-img-container">
                                        <img src="images/comida3.png" alt="Pizza caprese" class="mini-img">
                                    </div>
                                    <span class="producto-nombre">Pizza caprese</span>
                                </div>
                                <select name="pizza" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <div class="producto-con-imagen">
                                    <div class="mini-img-container">
                                        <img src="images/comida4.png" alt="Quinoa con verdura" class="mini-img">
                                    </div>
                                    <span class="producto-nombre">Quinoa con verdura</span>
                                </div>
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
                        <div class="card-header">
                           
                            <h3>Agua</h3>
                        </div>
                        <ul class="producto-lista">
                            <li class="producto-item">
                                <div class="producto-con-imagen">
                                    <div class="mini-img-container">
                                        <img src="images/bebida1.png" alt="Agua" class="mini-img">
                                    </div>
                                    <span class="producto-nombre">Agua</span>
                                </div>
                                <select name="agua" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <div class="producto-con-imagen">
                                    <div class="mini-img-container">
                                        <img src="images/bebida2.png" alt="Cerveza" class="mini-img">
                                    </div>
                                    <span class="producto-nombre">Cerveza</span>
                                </div>
                                <select name="cerveza" class="cantidad-select">
                                    <% for(int i=0; i<=10; i++) { %>
                                    <option value="<%= i %>"><%= i %></option>
                                    <% } %>
                                </select>
                            </li>
                            <li class="producto-item">
                                <div class="producto-con-imagen">
                                    <div class="mini-img-container">
                                        <img src="images/bebida3.png" alt="Refresco" class="mini-img">
                                    </div>
                                    <span class="producto-nombre">Refresco</span>
                                </div>
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
        
        // Pre-cargar imágenes para evitar flashes
        window.addEventListener('load', function() {
            const images = [
                'images/comida1.png',
                'images/comida2.png',
                'images/comida3.png',
                'images/comida4.png',
                'images/bebida1.png',
                'images/bebida2.png',
                'images/bebida3.png'
            ];
            
            images.forEach(src => {
                const img = new Image();
                img.src = src;
            });
        });
    </script>
</body>
</html>