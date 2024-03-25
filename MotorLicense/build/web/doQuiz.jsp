<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Do quiz</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var duration = ${quiz.duration}; // Duration in seconds
                var finishTimeElement = document.getElementById('finishTime');
                var startTime = parseInt(localStorage.getItem('startTime')) || 0;
                var currentTime = new Date().getTime();
                var countdownElement = document.getElementById('countdown');

                if (startTime === 0 || currentTime - startTime > duration * 1000) {
                    // Nếu startTime chưa được đặt hoặc nếu thời gian đã hết, đặt một startTime mới
                    startTime = currentTime;
                    localStorage.setItem('startTime', startTime);
                }

                function updateTimer() {
                    var x = setInterval(function () {
                        var now = new Date().getTime();
                        var elapsedSeconds = Math.floor((now - startTime) / 1000);
                        var remainingSeconds = Math.max(0, duration - elapsedSeconds);

                        var distance = startTime + duration * 1000 - now;

                        if (remainingSeconds <= 0) {
                            clearInterval(x);
                            finishTimeElement.value = duration; // Set finishTime to quiz duration when time is up
                            localStorage.removeItem('startTime'); // Xóa thời gian bắt đầu khi hết giờ
                            localStorage.removeItem('remainingTime');
                            document.forms['quizForm'].submit();
                        } else {
                            // Update finishTime value with elapsed seconds
                            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                            var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                            countdownElement.innerHTML = minutes + "m " + seconds + "s ";
                            finishTimeElement.value = elapsedSeconds;
                            localStorage.setItem('remainingTime', elapsedSeconds);
                        }
                    }, 1000);
                }

                updateTimer();

                function clearLocalStorage() {
                    localStorage.removeItem('startTime');
                    localStorage.removeItem('remainingTime');
                }

                // Lắng nghe sự kiện submit của form và gọi hàm để xóa dữ liệu từ localStorage
                document.forms['quizForm'].addEventListener('submit', function () {
                    clearLocalStorage();
                });
            });
        </script>
    </head>
    <body>
        <div class="container mt-3">
            <form method="POST" action="doQuiz" id="quizForm">
                <div class="row g-1">
                    <!--List Quizz-->
                    <div class="col-md-8">
                        <c:forEach var="l" items="${listQuestion}" varStatus="listIndex">
                            <div class="row mb-3" id="${listIndex.index+1}">
                                <div class="col-md-12 d-flex justify-content-center">
                                    <div class="card" style="max-width: 500px;">
                                        <c:if test="${l.type == true}">
                                            <div class="card-header" style="color: red">
                                                ${l.questionName} (Câu điểm liệt)                                       
                                            </div> 
                                        </c:if>
                                        <c:if test="${l.type == false}">
                                            <div class="card-header">
                                                ${l.questionName}                                        
                                            </div> 
                                        </c:if>
                                        <c:set var="count" value="1"></c:set>
                                        <input type="hidden" value="${l.questionId}" name="questionNo${listIndex.index+1}">
                                        <div class="card-body" style="width: 500px;">
                                            <c:forEach var="a" items="${listAnswer}">
                                                <c:if test="${l.questionId == a.question.questionId}">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="answerQuestionNo${listIndex.index+1}" id="answerQuestionNo${listIndex.index+1}" value="${a.answerId}">
                                                        <label class="form-check-label" for="flexRadioDefault2" style="width: 100%">
                                                            ${count}.${a.detail}
                                                        </label>
                                                    </div>
                                                    <c:set var="count" value="${count+1}"></c:set>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!--Navbar-->
                    <div class="col-md-4 sticky-top">
                        <div class="card">
                            <div class="card-header">
                                ${sessionScope.user.name}
                            </div>
                            <div class="card-body">
                                <h2>${quiz.quizName}</h2>
                                <input type="hidden" value="" name="finishTime" id="finishTime">
                                <input type="hidden" value="${quiz.quizId}" name="quizId">
                                <p>Duration: ${quiz.duration}</p>
                                <p id="countdown"></p>
                                <ul class="pagination">
                                    <c:forEach var="list" items="${listQuestion}" varStatus="number">                                    
                                        <li class="page-item"><a class="page-link" href="#${number.index+1}">${number.index+1}</a></li>   
                                        </c:forEach>
                                </ul>
                                <button type="submit" class="btn btn-success">Submit exam</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
