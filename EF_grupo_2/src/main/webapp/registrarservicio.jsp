<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/11/2022
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registrar Servicio</title>
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
    <div class="container-fluid">
        <div class="row">
            <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Registrar Servicio</h2>
            <form method="post" action="<%=request.getContextPath()%>/ServicioServlet?accion=registrartipo">
                <div class="form-group">
                    <label>Tipo de Servicio</label>
                    <select name="tipo" class="form-control">
                        <option selected></option>
                        <option value="1">Impresión 3D</option>
                        <option value="2>">Corte Láser</option>
                        <option value="3>">Escaneo Digital 3D</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Información Extra</label>
                    <input type="text" class="form-control" name="infoextra">
                </div>
                <button type="submit" class="btn btn-primary">Siguiente</button>
                <a href="<%=request.getContextPath()%>/SessionServlet" class="btn btn-danger">Cancelar</a>
            </form>
        </div>
    </div>
</body>
</html>