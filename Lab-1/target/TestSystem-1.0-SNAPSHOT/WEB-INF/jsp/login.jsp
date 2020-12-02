<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<div style="min-height: 100vh; padding-top: 120px">
    <div>
        <form action="${pageContext.request.contextPath}/app/login.html" method="post">
            <div >
                <label for="email">email</label>
                <input class="input-block" id="email" name="email" placeholder="email">
            </div>

            <div>
                <label for="password">password</label>
                <input class="input-block" id="password" name="password" placeholder="password">
            </div>

            <div>
                <button>submit</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
