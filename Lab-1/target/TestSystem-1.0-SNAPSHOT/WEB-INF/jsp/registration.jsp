<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sign up</title>
    <%--<link rel="stylesheet" href="https://unpkg.com/papercss@1.8.1/dist/paper.min.css">--%>
</head>
<body>

<%--<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="text"/>

<c:set var="text">
    <fmt:message key="signup"/>
</c:set>
&lt;%&ndash;<custom:header text="${text}"/>&ndash;%&gt;--%>

<div class="paper container" style="min-height: 100vh; padding-top: 120px">
    <form class="row flex-center" <%--action="${pageContext.request.contextPath}/auth/signup.html"--%> method="post">
        <div class="col-12 form-group">
            <label for="name"><%--<fmt:message key=--%>name<%--/>--%></label>
            <input class="input-block" id="name" name="name" placeholder="<%--<fmt:message key="--%>name<%--"/>--%>">
        </div>

        <div class="col-12 form-group">
            <label for="email"><%--<fmt:message key="--%>email<%--"/>--%></label>
            <input class="input-block" id="email" name="email" placeholder="<%--<fmt:message key="--%>email<%--"/>--%>">
        </div>

        <div class="col-12 form-group">
            <label for="password"><%--<fmt:message key=--%>password<%--"/>--%></label>
            <input class="input-block" id="password" name="password" placeholder="<%--<fmt:message key="--%>password<%--"/>--%>">
        </div>

        <div class="col-12 form-group">
            <label for="role"><%--<fmt:message key="--%>role<%--"/>--%></label>
            <select id="role" name="role" class="input-block">
                <option value="Student">
                    <%--<fmt:message key="--%>student<%--"/>--%>
                </option>

                <option value="Teacher">
                    <%--<fmt:message key="--%>teacher<%--"/>--%>
                </option>
            </select>
        </div>

        <div class="col-12 form-group">
            <button class="btn-block btn-success-outline"><%--<fmt:message key="--%>submit<%--"/>--%></button>
        </div>
    </form>
</div>

</body>
</html>