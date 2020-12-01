package controllers;

import entity.RoleEntity;
import entity.UserEntity;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import services.Service;
import services.ServiceException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

public class Controller extends javax.servlet.http.HttpServlet {

    private final Service service = new Service();
    private final Logger logger = LogManager.getLogger();

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String[] str = request.getRequestURI().split("/");
        switch (str[str.length - 1]) {
            case "login.html" :{
                signin(request, response);
                break;
            }
            case "registration.html" :{
                signup(request, response);
                break;
            }
            default : {
                //response.sendError(404);
                break;
            }
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String[] str = request.getRequestURI().split("/");


        switch (str[str.length - 1]){
            case "registration.html":{
                request.getRequestDispatcher("/WEB-INF/jsp/registration.jsp").forward(request,response);
                break;
            }
            case "login.html":{
                request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
                break;
            }
        }
    }

    private void signup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        RoleEntity role = RoleEntity.valueOf(request.getParameter("role"));

        UserEntity userEntity = new UserEntity();
        userEntity.setName(name);
        userEntity.setEmail(email);
        userEntity.setPassword(password);
        userEntity.setRole(role);

        boolean signed;
        try {
            signed = service.signup(userEntity);
        } catch (ServiceException e) {
            logger.error(e.getMessage());
            response.sendError(500);
            return;
        }

        if (signed) {
            HttpSession session = request.getSession();
            session.setAttribute("user", userEntity);
            response.sendRedirect(request.getContextPath() + "/app/list.html");
        } else {
            response.sendRedirect(request.getContextPath() + "/app/login.html");
        }
    }

    private void signin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserEntity user = new UserEntity();
        user.setEmail(email);
        user.setPassword(password);

        boolean signed;
        try {
            signed = service.signin(user);
        } catch (ServiceException e) {
            logger.error(e.getMessage());
            response.sendError(500);
            return;
        }

        if (signed) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/app/list.html");
        } else {
            response.sendRedirect(request.getContextPath() + "/app/login.html");
        }
    }
}
