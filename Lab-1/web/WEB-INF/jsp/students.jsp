<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<c:set var="text">
    students
</c:set>

<body>
<div style="min-height: 100vh; padding-top: 120px">
    <table>
        <thead>
        <tr>
            <th>number</th>
            <th>name</th>
            <th>answer</th>
        </tr>
        </thead>
        <tbody>
        <%--@elvariable id="students" type="java.util.List<entity.UserEntity>"--%>
        <%--@elvariable id="testId" type="java.lang.String"--%>
        <c:forEach var="student" items="${students}" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${student.name} </td>
                <td>
                    <a href="${pageContext.request.contextPath}/app/details.html?id=${testId}&studentId=${student.id}">
                        answer
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
