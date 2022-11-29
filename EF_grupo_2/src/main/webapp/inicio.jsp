<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 29/11/2022
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.example.ef_grupo_2.Beans.Usuarios" %>
<%@ page import="com.example.ef_grupo_2.Beans.Servicio" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean type="java.util.ArrayList<com.example.ef_grupo_2.Beans.Servicio>" scope="request" id="listaservicio"/>
<jsp:useBean id="usuarioSession" type="com.example.ef_grupo_2.Beans.Usuarios" scope="session"/>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Servicios</title>
</head>
<body>
<div class='container'>
    <div class="row mb-5 mt-4">
        <div class="col-md-7">
            <h1>Lista de Servicios Registrados</h1>
        </div>
        <div class="col-md-5 col-lg-4 ms-auto my-auto text-md-end">
            <a href="<%= request.getContextPath()%>/ServicioServlet?accion=agregar" class="btn btn-primary">Registrar Servicio</a>
        </div>

        <div class="form-inline font-italic my-2 my-lg-0">
            <% if (usuarioSession.getClass() == 0) { %>
            <a class="nav-link" style="color: #007bff;" href="<%=request.getContextPath()%>/LoginServlet">(Iniciar Sesión)</a>
            <% } else { %>
            Bienvenido <%=usuarioSession.getNombre()%>
            (<a href="<%=request.getContextPath()%>/SessionServlet?accion=logout">cerrar sesión</a>)
            <% } %>
        </div>

    </div>
    <table class="table">
        <tr>
            <th>#</th>
            <th>Tipo de Servicio</th>
            <th>Fecha de registro</th>
            <th>Tiempo de Realización</th>
            <th>Costo</th>
        </tr>
        <%
            int i = 1;
            for (Servicio service : listaservicio) {
        %>
        <tr>
            <td><%=i%>
            </td>
            <td><%=service.getIdServicio()%>
            </td>
            <td><%=service.getFecha()%>
            </td>
            <td><%=service.getTiempo()%>
            </td>
            <td><%=service.getCosto()%>
            </td>
        </tr>
        <%
                i++;
            }
        %>
    </table>
</div>

</body>
</html>
