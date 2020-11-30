<%@ attribute name="text" required="true" type="java.lang.String" description="Header text" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@tag pageEncoding="UTF-8"%>

<fmt:setLocale value="${sessionScope.lang}"/>
<fmt:setBundle basename="text"/>

<nav class="border fixed split-nav">
    <div class="nav-brand">
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <h3><a href="${pageContext.request.contextPath}/test/list.html">${text}</a></h3>
            </c:when>
            <c:otherwise>
                <h3><a href="#">${text}</a></h3>
            </c:otherwise>
        </c:choose>
    </div>
    <ul class="inline">
        <li>
            <ul id="langs" class="breadcrumb">
                <li><a data-value="en" href="#">En</a></li>
                <li><a data-value="ru" href="#">Ру</a></li>
            </ul>
        </li>

        <c:if test="${not empty sessionScope.user}">
            <li>
                <a href="${pageContext.request.contextPath}/auth/signout.html" class="paper-btn btn-danger text-center" style="min-width: 150px">
                    <fmt:message key="signout"/>
                </a>
            </li>
        </c:if>
    </ul>

    <script>
        const langs = document.querySelector("#langs").children;

        Array.from(langs).map(lang => lang.children[0]).forEach(lang => {
            lang.addEventListener("click", async (e) => {
                e.preventDefault();

                await fetch("${pageContext.request.contextPath}/location/lang.html?value=" + lang.dataset.value);
                document.location.reload();
            });
        })
    </script>
</nav>