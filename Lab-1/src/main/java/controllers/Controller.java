package controllers;

import java.io.IOException;

public class Controller extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String[] str = request.getRequestURI().split("/");

        switch (str[str.length - 1]){
            case "registration":{
                request.getRequestDispatcher("/WEB-INF/jsp/registration.jsp").forward(request,response);
                break;
            }
            case "login":{
                request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
                break;
            }
        }
    }
}
