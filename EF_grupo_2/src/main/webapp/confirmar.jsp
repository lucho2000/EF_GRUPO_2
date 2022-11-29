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
    <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Confirmar Impresión 3D</h2>
    <form method="post" action="<%=request.getContextPath()%>/SessionServlet?accion=confirmarImpresion&valida=1">
      <div class="form-group">
        <label>Densidad de Pieza</label>
        <input class="form-control" name="densidad" placeholder="" type="number" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Grosor</label>
        <input class="form-control" name="grosor" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Altura</label>
        <input class="form-control" name="altura" placeholder="" type="number" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Material</label>
        <input class="form-control" name="material" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>URL de la imagen</label>
        <input class="form-control" name="url" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Autoservicio</label>
        <input class="form-control" name="autoservicio" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <button type="submit" class="btn btn-primary">Confirmar</button>
      <a href="<%=request.getContextPath()%>/SessionServlet?accion=confirmarImpresion&valida=0" class="btn btn-danger">Cancelar</a>
    </form>
    <%} else if (Objects.equals(tipo, "2")) {%>
    <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Confirmar Corte Láser</h2>
    <form method="post" action="<%=request.getContextPath()%>/SessionServlet?accion=confirmarCorte&valida=1">
      <div class="form-group">
        <label>Grosor de línea</label>
        <input class="form-control" name="grosor" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Color de línea</label>
        <input class="form-control" name="color" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Material</label>
        <input class="form-control" name="material" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Alto</label>
        <input class="form-control" name="alto" placeholder="" type="number" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Ancho</label>
        <input class="form-control" name="ancho" placeholder="" type="number" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>URL de la imagen</label>
        <input class="form-control" name="url" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <button type="submit" class="btn btn-primary">Confirmar</button>
      <a href="<%=request.getContextPath()%>/SessionServlet?accion=confirmarEscaneo&valida=0" class="btn btn-danger">Cancelar</a>
    </form>
    <%} else if (Objects.equals(tipo, "3")) {%>
    <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Confirmar Escaneo Digital 3D</h2>
    <form method="post" action="<%=request.getContextPath()%>/SessionServlet?accion=confirmarCorte&valida=1">
      <div class="form-group">
        <label>Largo</label>
        <input class="form-control" name="largo" placeholder="" type="number" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Ancho</label>
        <input class="form-control" name="ancho" placeholder="" type="number" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Altura</label>
        <input class="form-control" name="altura" placeholder="" type="number" aria-label="Disabled input example" disabled/>
      </div>
      <div class="form-group">
        <label>Resolución</label>
        <input class="form-control" name="resolucion" placeholder="" type="text" aria-label="Disabled input example" disabled/>
      </div>
      <button type="submit" class="btn btn-primary">Confirmar</button>
      <a href="<%=request.getContextPath()%>/SessionServlet?accion=confirmarEscaneo&valida=0" class="btn btn-danger">Cancelar</a>
    </form>
    <%}%>
  </div>
</div>
</body>
</html>