<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/11/2022
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registrarse</title>
    <meta name="description" content="Core HTML Project">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- External CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style.min.css">
    <link rel="stylesheet" href="../css/flex.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout" style="background: #FFFFFF">
<div style="height: 200px; display: block;"></div>
    <div class="container-fluid">
        <div class="row">
            <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Registrarse</h2>
            <form method="post" action="<%=request.getContextPath()%>/SessionServlet?accion=registrar">
                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" class="form-control" name="nombre">
                </div>
                <div class="form-group">
                    <label>Apellido</label>
                    <input class="form-control" name="apellido" type="text"/>
                </div>
                <div class="form-group">
                    <label>Correo</label>
                    <input class="form-control" name="correo" type="email"/>
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <input class="form-control" name="password" type="password"/>
                </div>
                <div class="form-group">
                    <label>Repetir Contraseña</label>
                    <input class="form-control" name="passwordrepeat" type="password"/>
                </div>
                <div class="form-group">
                    <label>Tipo de Usuario</label>
                    <select name="tipo" class="form-control">
                        <option selected></option>
                        <option value="1">Externo</option>
                        <option value="2>">Interno</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
                <a href="<%=request.getContextPath()%>/SessionServlet" class="btn btn-danger">Cancelar</a>
            </form>
        </div>
    </div>
</body>
</html>

