<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:choose>
    <c:when test="${sessionScope.user.role == 'Teacher'}">
        <c:set var="text">
            createdTests
        </c:set>
    </c:when>

    <c:otherwise>
        <c:set var="text">
            completeTests
        </c:set>
    </c:otherwise>
</c:choose>

<div style="min-height: 100vh; padding-top: 120px">
    <div>
        <c:if test="${sessionScope.user.role == 'Teacher'}">
            <a style="text-align: center" href="${pageContext.request.contextPath}/app/add.html">
                newTest
            </a>
        </c:if>
    </div>

    <table>
        <thead>
        <tr>
            <th style="width: 10%">#</th>
            <th style="width: 65%">testLink</th>

            <c:if test="${sessionScope.user.role == 'Teacher'}">
                <th style="width: 15%">viewStudents</th>
                <th style="width: 10%">deleteTest</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <%--@elvariable id="tests" type="java.util.List<entity.TestEntity>"--%>
        <c:forEach var="test" items="${tests}" varStatus="loop">
            <tr>
                <td style="vertical-align: baseline">${loop.index + 1}</td>
                <td style="vertical-align: baseline">
                    <c:choose>
                        <c:when test="${sessionScope.user.role == 'Teacher'}">
                            <a href="${pageContext.request.contextPath}/app/details.html?id=${test.id}">
                                    ${test.name}
                            </a>
                        </c:when>

                        <c:otherwise>
                            <c:set var="taken" value="false"/>
                            <%--@elvariable id="completeTests" type="java.util.List<entity.TestEntity>"--%>
                            <c:forEach var="takenTest" items="${completeTests}">
                                <c:if test="${test.id eq takenTest.id}">
                                    <c:set var="taken" value="true"/>
                                </c:if>
                            </c:forEach>

                            <c:choose>

                                <%--@elvariable id="completeTests" type="java.util.List<entity.TestEntity>"--%>
                                <c:when test="${taken}">
                                    <a href="${pageContext.request.contextPath}/app/details.html?id=${test.id}&studentId=${sessionScope.user.id}">
                                        view ${test.name}
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/app/answer.html?id=${test.id}">
                                        answer ${test.name}
                                    </a>
                                </c:otherwise>
                            </c:choose>

                        </c:otherwise>
                    </c:choose>
                </td>

                <c:if test="${sessionScope.user.role == 'Teacher'}">
                    <td style="vertical-align: baseline">
                        <a href="${pageContext.request.contextPath}/app/students.html?id=${test.id}">
                            students
                        </a>
                    </td>
                    <td style="vertical-align: baseline">
                        <a href="${pageContext.request.contextPath}/app/delete-test.html?id=${test.id}">
                            delete
                        </a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

</body>
</html>
