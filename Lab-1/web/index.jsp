<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 25.11.2020
  Time: 13:21
  To change this template use File | Settings | File Templates.
  bootstrap
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Test System</title>
  </head>
  <body>
  <div class="paper container" style="min-height: 100vh; padding-top: 220px">
    <h3 class="text-center">
      please
      <a href="${pageContext.request.contextPath}/app/login.html">signin</a>
      or
      <a href="${pageContext.request.contextPath}/app/registration.html">signup</a>
    </h3>
  </div>
  </body>
</html>
