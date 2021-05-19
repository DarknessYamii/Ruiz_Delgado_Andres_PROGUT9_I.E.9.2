<%-- 
    Document   : modificarSocio
    Created on : 19-may-2021, 17:15:32
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="container-fluid">
            <br/>
            <div class="panel panel-info">
                <div class="panel-heading text-center">Modificación de socio</div>
                <!-- Formulario que recogera valores para la modificacion del usuario -->
                <form method="get" action="modSocioPage.jsp">
                    <div class="form-group"> 
                        <label>Nº de Socio:</label><input type="text" size="5" name="socioID" value="<%= request.getParameter("socioID") %>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Nombre:</label><input type="text" size="30" name="nombre" value="<%= request.getParameter("nombre") %>">
                    </div>
                    <div class="form-group">
                        <label>Estatura (en CM):</label><input type="text" size="5" name="estatura" value="<%= request.getParameter("estatura") %>">
                        <label>Edad:</label><input type="text" size="5" name="edad" value="<%= request.getParameter("edad") %>">
                    </div>
                    <div class="form-group">
                        <label>Localidad:</label><input type="text" name="localidad" size="20" value="<%= request.getParameter("localidad") %>">
                    </div>

                    <a href="index.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                    <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
                </form>

            </div>
    </body>
</html>
