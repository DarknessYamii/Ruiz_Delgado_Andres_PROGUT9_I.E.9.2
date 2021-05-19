<%--
    Document   : modSocioPage
    Created on: 19 - may - 2021, 15: 55: 35
    Author: andre
--%>
<!-- Import Libraries -->
<%@page import= "java.sql.Statement" %>
<%@page import= "java.sql.ResultSet" %>
<%@page import= "java.sql.DriverManager" %>
<%@page import= "java.sql.Connection" %>
<%@page import= "javax.servlet.ServletException" %>
<%@page contentType = "text/html" pageEncoding = "UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Modificar Socio</title>
    </head>
    <body>
        <%
            // Establecer Conexion SQL
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?autoReconnect=true&useSSL=false","root","");
            Statement s = conexion.createStatement();
            // Creacion de un String para recoger valores
            String actualizarSocio = "UPDATE socio SET "+ "nombre='" + request.getParameter("nombre")+ "', estatura=" + Integer.valueOf(request.getParameter("estatura"))+ ", edad=" + Integer.valueOf(request.getParameter("edad"))+ ", localidad='" + request.getParameter("localidad")+ "' WHERE socioID=" + Integer.valueOf(request.getParameter("socioID"));
            // Ejecucion del String con los valores recogidos
            s.execute(actualizarSocio);
            out.println("Socio actualizado correctamente.");
            // Cerrar Conexion
            conexion.close();
        %>

        <br>
        <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Pagina principal
</body>
</html>
