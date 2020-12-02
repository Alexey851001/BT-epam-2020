<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="min-height: 100vh; padding-top: 100px">
    <form action="${pageContext.request.contextPath}/app/save-test.html" method="post">
        <h3>testName: </h3>
        <div>
            <input id="test-name" name="test-name" class="input-block" placeholder="testName">
        </div>

        <h3>questions: </h3>
        <div id="questions">
            <div >
                <div style="margin-left: 0">
                    <input id="question-1" name="question-1" placeholder="Question">
                    <input id="answer-1" name="answer-1" placeholder="Answer">
                </div>
            </div>
        </div>

        <input type="button" onclick="onAddQuestion()"
               value="addQuestion">
        <input type="submit" class="col-12 paper-btn btn-block btn-success-outline" value="save">
    </form>
</div>

<script>
    let questionNumber = 2;
    const questions = document.querySelector("#questions");

    const createQuestionFormGroup = () => {
        const formGroup = document.createElement("div");
        formGroup.className = "row form-group";
        formGroup.innerHTML =
            `
                <div style="margin-left: 0">
                    <input id="question-` + questionNumber + `" name="question-` + questionNumber + `"  placeholder="Question">
                    <input id="answer-` + questionNumber + `" name="answer-` + questionNumber + `" placeholder="Answer">
                </div>

                <div class="col-2">
                    <input class="input-block" type="button" onclick="onRemoveQuestionGroup(` + questionNumber + `)" value="remove">
                </div>
            `;
        formGroup.setAttribute("data-question-number", questionNumber);

        questions.appendChild(formGroup);
        questionNumber += 1;
    }

    const onAddQuestion = () => {
        createQuestionFormGroup();
    }

    const onRemoveQuestionGroup = (number) => {
        const nodeToRemove = Array.from(questions.children).find(q => q.dataset.questionNumber === number.toString());
        questions.removeChild(nodeToRemove);
    }
</script>


</body>
</html>
