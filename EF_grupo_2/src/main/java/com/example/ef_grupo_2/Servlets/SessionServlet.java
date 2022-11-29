package com.example.ef_grupo_2.Servlets;

import com.example.ef_grupo_2.Beans.Usuarios;
import com.example.ef_grupo_2.Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SessionServlet", value = "/SessionServlet")
public class SessionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accion = request.getParameter("accion") == null ? "iniciar" : request.getParameter("accion");
        RequestDispatcher view;

        UsuarioDao uDao = new UsuarioDao();
        switch (accion) {
            case ("registrar"):
                session = request.getSession();
                if (session.getAttribute("usuario") == null) {
                    view = request.getRequestDispatcher("/Login/Registrarse.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                }
                break;
            case ("iniciar"):
                HttpSession session1 = request.getSession();
                if (session1.getAttribute("usuario") == null) {
                    view = request.getRequestDispatcher("/Login/InicioSesion.jsp");
                    view.forward(request, response);
                } else {
                    Usuarios usuario = (Usuarios) session1.getAttribute("usuario");
                    if (usuario.getRol().getNombreRol().equals("Usuario PUCP")) {
                        response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                    } else if (usuario.getRol().getNombreRol().equals("Seguridad")) {
                        response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
                    } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                    }
                }
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        }

    }
}
