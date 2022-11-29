package com.example.ef_grupo_2.Servlets;

import com.example.ef_grupo_2.Beans.Usuarios;
import com.example.ef_grupo_2.Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

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
                    view = request.getRequestDispatcher("/registro.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                }
                break;
            case ("iniciar"):
                HttpSession session1 = request.getSession();
                if (session1.getAttribute("usuario") == null) {
                    view = request.getRequestDispatcher("/login.jsp");
                    view.forward(request, response);

                } else {
                    response.sendRedirect(request.getContextPath() + "/ServicioServlet");
                }
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuarios usuario1 = (Usuarios) session.getAttribute("usuario");
        String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");

        RequestDispatcher view;

        switch (accion) {
            case "verificarContrasena":
                String correo = usuario1.getCorreo();
                String contra = request.getParameter("contrasena");

                String repass = request.getParameter("repass");
                UsuarioDao uDao = new UsuarioDao();

                boolean contrasenaCorrecta = uDao.contrasenaisValid(contra);

                if (contrasenaCorrecta) {

                    if (!contra.equalsIgnoreCase(repass)) { //si cuando confirma la nueva contraseña no es igual
                        session.setAttribute("msg", "Para confirmar, ambas contrasenas deben ser iguales");

                        response.sendRedirect(request.getContextPath() + "/SessionServlet");

                    } else {
                        view = request.getRequestDispatcher("/inicio.jsp");
                        view.forward(request, response);

                    }

                } else {
                    session.setAttribute("msg", "digite otra contraseña que cumpla los requerimentos");

                }
                response.sendRedirect(request.getContextPath() + "/SessionServlet");
                break;
        }

    }

    }
}
