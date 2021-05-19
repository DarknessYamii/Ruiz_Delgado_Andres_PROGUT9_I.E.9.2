<%-- 
    Document   : borrarSocio
    Created on : 19-may-2021, 15:51:17
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
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Eliminar Socio</title>
    </head>
    <body>
        <%
           // Crear conexion 
           Class.forName("com.mysql.jdbc.Driver");
           Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?autoReconnect=true&useSSL=false","root","");
           Statement s = conexion.createStatement();
           // Creamos una ejecucion de un Statemente recogiendo los datos del socioID instantaneamente sin pedir nada al usuario
           s.execute("DELETE FROM socio WHERE socioID="+ Integer.valueOf(request.getParameter("socioID")));
           // Cerramos Statement   
           s.close();
        %>
        <script>document.location = "index.jsp"</script>
    </body>
</html>
