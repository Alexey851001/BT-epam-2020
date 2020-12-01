package filters;

import com.mysql.cj.Session;
import entity.RoleEntity;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Filter extends HttpFilter {

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String[] str = request.getRequestURI().split("/");
        switch (str[str.length - 1]) {
            case "list.html" :{
                requireSignin(request, response, chain);
                break;
            }
            /*case "/test/create.html", "/test/students.html" -> requireRole(request, response, chain, RoleEntity.Teacher);
            case "/test/answer.html" -> requireRole(request, response, chain, RoleEntity.Student);
            case "/test/details.html" -> authorizeDetails(request, response, chain);*/
        }
        super.doFilter(request, response, chain);
    }

    private void requireSignin(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/app/login.html");
        } else {
            super.doFilter(request, response, chain);
        }
    }
}
