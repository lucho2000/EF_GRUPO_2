package com.example.ef_grupo_2.Servlets;

import com.example.ef_grupo_2.Beans.Servicio;
import com.example.ef_grupo_2.Beans.Usuarios;
import com.example.ef_grupo_2.Daos.ServicioDao;
import com.example.ef_grupo_2.Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ServicioServlet", value = "/ServicioServlet")
public class ServicioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuarios usuario1 = (Usuarios) session.getAttribute("usuario");

            String accion = request.getParameter("accion") == null ? "inicio" : request.getParameter("accion");
            RequestDispatcher view;

            ArrayList<Servicio> listaServicios;
            ServicioDao servicioDao = new ServicioDao();

            switch (accion) {
                case ("confirmar"):
                    int idIncidencia = Integer.parseInt(request.getParameter("id"));
                    incidencia = inDao.obtenerIncidencia(idIncidencia);
                    request.setAttribute("servicio", servicio);
                    //inDao.confirmar(idIncidencia);
                    view = request.getRequestDispatcher("/confirmar.jsp");
                    view.forward(request, response);
                    //response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                    break;
                case ("borrar"):
                    String idService = request.getParameter("id");
                    int id = Integer.parseInt(idService);
                    servicioDao.borrar(id);
                    response.sendRedirect(request.getContextPath() + "/ServicioServlet");
                    break;
                case ("listar"):
                    String codigoUsuarioPorSesion = usuario1.getCodigo();
                    try {
                        listaServicios = servicioDao.listarServicios();
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    request.setAttribute("listaServicios", listaServicios);
                    view = request.getRequestDispatcher("/inicio.jsp");
                    view.forward(request, response);
                    break;
            }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}
