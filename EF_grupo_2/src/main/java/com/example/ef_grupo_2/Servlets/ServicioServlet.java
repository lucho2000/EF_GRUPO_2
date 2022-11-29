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
                case ("registrarPrint"):
                    String id = request.getParameter("tipo");
                    request.setAttribute("tipo",id);
                    view = request.getRequestDispatcher("/detalleservicio.jsp");
                    view.forward(request, response);
                    break;
                case ("registrartipo"):
                    String id = request.getParameter("tipo");
                    request.setAttribute("tipo",id);
                    view = request.getRequestDispatcher("/detalleservicio.jsp");
                    view.forward(request, response);
                    break;
                case ("agregar"):
                    view = request.getRequestDispatcher("/registrarservicio.jsp");
                    view.forward(request, response);
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
        HttpSession session = request.getSession();
        Usuarios usuario1 = (Usuarios) session.getAttribute("usuario");

        String accion = request.getParameter("accion") == null ? "inicio" : request.getParameter("accion");
        RequestDispatcher view;

        ArrayList<Servicio> listaServicios;
        ServicioDao servicioDao = new ServicioDao();

        switch (accion) {
            case ("registrarCorte"):
                String id = request.getParameter("tipo");
                request.setAttribute("tipo",id);
                view = request.getRequestDispatcher("/detalleservicio.jsp");
                view.forward(request, response);
                break;
            case ("registrarEscaneo"):
                String id = request.getParameter("tipo");
                request.setAttribute("tipo",id);
                view = request.getRequestDispatcher("/detalleservicio.jsp");
                view.forward(request, response);
                break;
            case ("registrarPrint"):
               String densidad = request.getParameter("densidad");
               String grosor = request.getParameter("grosor");
               String altura = request.getParameter("altura");
               String material = request.getParameter("material");
               String url = request.getParameter("url");
               String autoservicio = request.getParameter("autoservicio");


                break;
        }


    }
}
