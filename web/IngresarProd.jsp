

<%@page import="java.lang.String"%>
<%@page import="edu.umg.modelo.Producto"%>
<%@page import="edu.umg.dao.ProductoDAO"%>
<%@page import="edu.umg.modelo.Carrera"%>
<%@page import="edu.umg.dao.CarreraDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <h1>INGRESO DE PRODUCTO</h1>

        <% 
            String codigo = request.getParameter("codigo");
            String descripcion = request.getParameter("descripcion");
            String precio = request.getParameter("precio");
            if(codigo==null && descripcion==null && precio==null){
        %>

        <form action="IngresarProd.jsp" method="POST">
            <div class="form-group">
              <label for="codigo">Código: </label>
              <input type="text" class="form-control" id="codigo" name="codigo" aria-describedby="emailHelp">              
            </div>            
            <div class="form-group">
              <label for="descripcion">Descripcion: </label>
              <input type="text" class="form-control" id="descripcion" name="descripcion" aria-describedby="emailHelp">
            </div>
            <div class="form-group">
              <label for="precio">Precio: </label>
              <input type="text" class="form-control" id="precio" name="precio" aria-describedby="emailHelp">
            </div>
            <button type="submit" class="btn btn-primary">Grabar</button>
        </form>
        <%
            }else{
                
                ProductoDAO productoDao = new ProductoDAO();
                
                Producto producto = new Producto(Integer.parseInt(codigo),descripcion,Integer.parseInt(precio));
                
               
                productoDao.saveProducto(producto);
            %>
            <div class="alert alert-success" role="alert">
               Producto ingresado correctamente <a href="VerProductos.jsp" class="alert-link">VER TABLA DE PRODUCTOS</a>. 
            </div>
          
            <%
                }
                %>

        <form action="MenuCarrera.jsp">
          <button type="submit" class="btn btn-secondary">Regresar Menu</button>
        </form>
         <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>       
                
     </body>
</html>
