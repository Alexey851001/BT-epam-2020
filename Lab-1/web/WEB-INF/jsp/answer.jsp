<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<%--@elvariable id="test" type="entity.TestEntity"--%>
<c:set var="text">
    ${test.name}
</c:set>
<body>

<div style="min-height: 100vh; padding-top: 120px">
    <form action="${pageContext.request.contextPath}/app/save-answer.html?id=${test.id}" method="post">
        <c:forEach var="question" items="${test.questions}" varStatus="loop">
            <div>
                <label for="question-${question.id}">${question.text}</label>
                <input id="question-${question.id}" name="question-${question.id}" class="input-block">
            </div>
        </c:forEach>

        <button>submit</button>
    </form>
</div>

</body>
</html>
