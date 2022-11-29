<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/11/2022
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Inicio</title>
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
      <div class="col-sm-4" style="margin: 10px 0px 10px 10px; background: #FFFFFF; border-radius: 10px; border: 1px solid grey">
        <div style="height: 30px; display: block;"></div>
        <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Iniciar Sesión</h2>
        <div style="height: 20px; display: block;"></div>
        <form method="post" action="<%= request.getContextPath()%>/Login">
          <div>
            <div class="mb-3 row">
              <label class="col-sm-2 col-form-label" style="font-size: 15px; margin: 0px 5px 2px 8px">Coreo</label>
              <div class="col-sm-9" style="margin: 2px 2px 2px 2px">
                <input type="correo" class="form-control" id="inputPassword2" placeholder="Ingrese su Correo PUCP" name="email">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="inputPassword" class="col-sm-2 col-form-label" style="font-size: 15px; margin: 0px 0px 2px 8px">Password</label>
              <div class="col-sm-9" style="margin: 2px 2px 2px 7px">
                <input type="password" class="form-control" id="inputPassword" placeholder="Ingrese su Contraseña" name="password">
              </div>
            </div>
          </div>
          <%if(session.getAttribute("msg")!=null){%>
          <div id="validation" class="invalid-feedback" style="display: block; margin-bottom: 10px">
            <%=session.getAttribute("msg")%>
          </div>
          <%session.removeAttribute("msg");%>
          <%}%>
          <div align="center">
            <button type="submit" class="btn btn-outline-dark" style="border-radius: 5px">Aceptar y Continuar</button>
          </div>
        </form>
        <div style="height: 5px; display: block;"></div>
        <div style="height: 5px; display: block;"></div>
        <div align="center">
          <div class="row">
            <div class="col-sm-3">
            </div>
            <div class="col-sm-3">
              <p style="font-family: Arial; font-size: 13px; margin: 5px 0px 0px 0px">¿Aún no está registrado?</p>
            </div>
            <div class="col-sm-2">
              <a style="color: #3c6eb7; margin: 0px 0px 0px 0px; font-size: 13px; font-family: 'Arial';" href="<%=request.getContextPath()%>/Login?accion=registrar">Registrarse</a>
            </div>
            <div style="height: 15px; display: block;"></div>
            <div class="col-sm-4"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
