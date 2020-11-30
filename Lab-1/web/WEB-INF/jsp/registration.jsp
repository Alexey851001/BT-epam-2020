<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sign up</title>
</head>
<body>

<div style="min-height: 100vh; padding-top: 120px">
    <form method="post">
        <div >
            <label for="name">name</label>
            <input id="name" name="name" placeholder="name">
        </div>

        <div>
            <label for="email">email</label>
            <input id="email" name="email" placeholder="email">
        </div>

        <div>
            <label for="password">password</label>
            <input id="password" name="password" placeholder="password">
        </div>

        <div>
            <label for="role"></label>
            <select id="role" name="role" class="input-block">
                <option value="Student">
                    student
                </option>

                <option value="Teacher">
                    teacher
                </option>
            </select>
        </div>

        <div>
            <button>submit</button>
        </div>
    </form>
</div>

</body>
</html>