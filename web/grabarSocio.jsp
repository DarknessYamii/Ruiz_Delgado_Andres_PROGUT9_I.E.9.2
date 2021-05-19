<%-- 
    Document   : grabarSocio
    Created on : 19-may-2021, 15:54:30
    Author     : andre
--%>
<!-- Import Libraries -->
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Grabar Socio</title>
    </head>
    <body>
        <%
            // Conexion a la BBDD
           Class.forName("com.mysql.jdbc.Driver");
           Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc?autoReconnect=true&useSSL=false","root","");
           Statement s = conexion.createStatement();
           // String para recoger los datos del ID del socio introducido
           String consultarID = "SELECT * FROM socio WHERE socioID="+ Integer.valueOf(request.getParameter("socioID"));
           // Ejecutamos el Query anterior y guardamos sus datos
           ResultSet existeSocio = s.executeQuery(consultarID);
           // Seleccionamos la ultima Row de los datos que ha recogido
           existeSocio.last();
           // Si recoge un ROW significa que ya existe esa ID por lo tanto no se podra introducir
           if(existeSocio.getRow() != 0){
               out.println("Ya existe un socio con esta ID");
            } else {
            // Creamos un String que recoja los valores ha introducir del socio
           String insertTable = "INSERT INTO socio VALUES (" + Integer.valueOf(request.getParameter("socioID"))+ ", '" + request.getParameter("nombre")+ "', " + Integer.valueOf(request.getParameter("estatura"))+ ", " + Integer.valueOf(request.getParameter("edad"))+ ", '" + request.getParameter("localidad") + "')";
            // Ejecutamos el String = Query  
           s.execute(insertTable);  
             
             out.println("Socio insertado");
           }
           // Creamos el Statement
           s.close();
        %>
        <br/>
        <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Pagina principal
</body>
</html>
