<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%--@elvariable id="test" type="com.duzh.denis.entities.Test"--%>
<c:set var="text">
    ${test.name}
</c:set>

<div style="min-height: 100vh; padding-top: 120px">
    <ul>
        <c:forEach var="question" items="${test.questions}" varStatus="loop">
            <li>
                    ${question.text}
                    <%--@elvariable id="answers" type="java.util.List<entity.AnswerEntity>"--%>
                <c:if test="${not empty answers}">
                    <ul>
                        <c:choose>
                            <c:when test="${answers[loop.index].text eq question.correctAnswer}">
                                <li>${answers[loop.index].text}</li>
                            </c:when>

                            <c:otherwise>
                                <li>${answers[loop.index].text}</li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </c:if>
            </li>
        </c:forEach>
    </ul>
</div>

</body>
</html>
