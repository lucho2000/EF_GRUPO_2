<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/11/2022
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String tipo = (String) request.getAttribute("tipo");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Detalles Servicio</title>
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
        <%if (Objects.equals(tipo, "1")){%>
        <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Registrar Impresión 3D</h2>
        <form method="post" action="<%=request.getContextPath()%>/SessionServlet?accion=registrarPrint">
            <div class="form-group">
                <label>Densidad de Pieza</label>
                <select name="densidad" class="form-control">
                    <option selected></option>
                    <option value="10">10</option>
                    <option value="15>">15</option>
                    <option value="20>">20</option>
                    <option value="30>">30</option>
                    <option value="50>">50</option>
                    <option value="90>">90</option>
                </select>
            </div>
            <div class="form-group">
                <label>Grosor</label>
                <select name="grosor" class="form-control">
                    <option selected></option>
                    <option value="fino">Fino</option>
                    <option value="normal>">Normal</option>
                    <option value="grueso>">Grueso</option>
                </select>
            </div>
            <div class="form-group">
                <label>Altura de la Capa</label>
                <select name="altura" class="form-control">
                    <option selected></option>
                    <option value="0.1">0.1</option>
                    <option value="0.2>">0.2</option>
                    <option value="0.3>">0.3</option>
                    <option value="0.4>">0.4</option>
                </select>
            </div>
            <div class="form-group">
                <label>Material</label>
                <select name="material" class="form-control">
                    <option selected></option>
                    <option value="abs">abs</option>
                    <option value="pla>">pla</option>
                    <option value="flexible>">flexible</option>
                </select>
            </div>
            <div class="form-group">
                <label>URL de la imagen</label>
                <input class="form-control" name="url" type="text"/>
            </div>
            <div class="form-group">
                <label>Autoservicio</label>
                <select name="autoservicio" class="form-control">
                    <option selected></option>
                    <option value="Si">Si</option>
                    <option value="No>">No</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Siguiente</button>
            <a href="<%=request.getContextPath()%>/SessionServlet" class="btn btn-danger">Cancelar</a>
        </form>
        <%} else if (Objects.equals(tipo, "2")) {%>
        <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Registrar Corte Láser</h2>
        <form method="post" action="<%=request.getContextPath()%>/SessionServlet?accion=registrarCorte">
            <div class="form-group">
                <label>Grosor</label>
                <select name="grosor" class="form-control">
                    <option selected></option>
                    <option value="Fino">Fino</option>
                    <option value="Grueso>">Grueso</option>
                </select>
            </div>
            <div class="form-group">
                <label>Color de Línea</label>
                <select name="color" class="form-control">
                    <option selected></option>
                    <option value="Rojo">Rojo</option>
                    <option value="Negro>">Negro</option>
                </select>
            </div>
            <div class="form-group">
                <label>Material</label>
                <select name="material" class="form-control">
                    <option selected></option>
                    <option value="acrílico">acrílico</option>
                    <option value="mdf>">mdf</option>
                    <option value="cartón>">cartón</option>
                </select>
            </div>
            <div class="form-group">
                <label>Alto</label>
                <input class="form-control" name="alto" type="number"/>
            </div>
            <div class="form-group">
                <label>Ancho</label>
                <input class="form-control" name="ancho" type="number"/>
            </div>
            <div class="form-group">
                <label>URL de la Imagen</label>
                <input class="form-control" name="url" type="text"/>
            </div>
            <button type="submit" class="btn btn-primary">Siguiente</button>
            <a href="<%=request.getContextPath()%>/SessionServlet" class="btn btn-danger">Cancelar</a>
        </form>
        <%} else if (Objects.equals(tipo, "3")) {%>
        <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Registrar Escaneo Digital 3D</h2>
        <form method="post" action="<%=request.getContextPath()%>/SessionServlet?accion=registrarEscaneo">
            <div class="form-group">
                <label>Altura</label>
                <input class="form-control" name="alto" type="number"/>
            </div>
            <div class="form-group">
                <label>Ancho</label>
                <input class="form-control" name="ancho" type="number"/>
            </div>
            <div class="form-group">
                <label>Largo</label>
                <input class="form-control" name="largo" type="number"/>
            </div>
            <div class="form-group">
                <label>Resolución</label>
                <select name="tipo" class="form-control">
                    <option selected></option>
                    <option value="Baja">Baja</option>
                    <option value="Media>">Media</option>
                    <option value="Alta>">Alta</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Siguiente</button>
            <a href="<%=request.getContextPath()%>/SessionServlet" class="btn btn-danger">Cancelar</a>
        </form>
        <%}%>
    </div>
</div>
</body>
</html>