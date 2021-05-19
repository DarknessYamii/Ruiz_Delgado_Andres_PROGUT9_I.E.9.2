<%-- 
    Document   : index
    Created on : 19-may-2021, 8:01:08
    Author     : andre
--%>
<!-- Import Libraries -->
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.ServletException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!<!-- Estilos Bootstrap + Propio -->
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Proyecto 9.2</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="panel panel-primary">   
                <div class="panel-heading text-center titleH">
                    <h1>CLUB DE BALONCESTO</h1>
                </div>

               
                <%
                     // Crear conexion
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?autoReconnect=true&useSSL=false","root","");
                           Statement s = conexion.createStatement();
                    // Recoge los valores de socio
                           ResultSet list = s.executeQuery("SELECT * FROM socio");
                %>
                <!-- Tabla con los datos de MySql -->
                <table class="table table-stripped">
                    <tr>
                        <th>Nº de Socio</th>
                        <th>Nombre</th>
                        <th>Estatura (en CM)</th>
                        <th>Edad</th>
                        <th>Localidad</th>
                    </tr>
                    <!-- Formulario para introducir nuevos socios -->
                    <form method="get" action="grabarSocio.jsp">
                        <tr>
                            <td><input type="text" name="socioID" size="5"></td>
                            <td><input type="text" name="nombre" size="30"></td>
                            <td><input type="text" name="estatura" size="5"></td>
                            <td><input type="text" name="edad" size="5"></td>
                            <td><input type="text" name="localidad" size="20"></td>
                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="
                                                                                                   glyphicon glyphicon-plus"></span>Añadir</button></td>
                        </tr>

                    </form>
                    <% 
                        // Metodo el cual recorre cada Row de Socio y va impriendo uno tras otro creando su propia Row de datos
                          while (list.next()) {
                              out.println("<tr><td>");
                              out.println(list.getString("socioID") + "</td>");
                              out.println("<td>" + list.getString("nombre") + "</td>");
                              out.println("<td>" + list.getString("estatura") + "</td>");
                              out.println("<td>" + list.getString("edad") + "</td>");
                              out.println("<td>" + list.getString("localidad") + "</td>");
                    %>
                    <td>
                        <!-- Form que recoge los datos que vamos a necesitar para Modificar un Socio -->
                        <form method="get" action="modificarSocio.jsp">
                            <input type="hidden" name="socioID" value="<%=list.getString("socioID") %>">
                            <input type="hidden" name="nombre" value="<%=list.getString("nombre") %>">
                            <input type="hidden" name="estatura" value="<%=list.getString("estatura") %>">
                            <input type="hidden" name="edad" value="<%=list.getString("edad") %>">
                            <input type="hidden" name="localidad" value="<%=list.getString("localidad") %>">
                            <button type="submit" value="Modificar" class="btn btn-info"><span class="
                                                                                               glyphicon glyphicon-pencil"></span>Modificar</button>
                        </form>
                    </td>
                    <td>
                        <!-- Form que recoge los datos que vamos a necesitar para Borrar un Socio -->
                        <form method="get" action="borrarSocio.jsp">
                            <input type="hidden" name="socioID" value="<%=list.getString("socioID") %>">
                            <button type="submit" value="Eliminar" class="btn btn-danger"><span class="
                                                                                                glyphicon glyphicon-remove"></span>Eliminar</button>
                        </form>
                    </td></tr>
                    <% 
                        }
                        //Cerramos conexion una vez recorrido toda la tabla
                    conexion.close();
                    %>
                </table>
            </div> 
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</html>
