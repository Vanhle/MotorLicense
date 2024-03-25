
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .container {
                min-height: 100vh;
            }

            .form-check-input:checked {
                background-color: green;
            }

            .form-check-input:not(:checked) {
                background-color: gray;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container" style="margin-top: 100px;">
            <div class="row d-flex justify-content-center">
                <c:if test="${mess != null}">
                    <p class="text-success" style="font-size: 30px;">${mess}</p>
                </c:if>           
            </div>
            <p class="text-danger">*WITH QUIZ HAS USER ATTEMPT CAN NOT DELETE</p>
            <a class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addQuiz" >Add Quiz</a>
            <div class="row g-1">
                <c:forEach var="l" items="${listQuiz}">
                    <div class="col-md-4">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title">${l.quizName}</h5>
                                <p class="card-text mb-1">Duration: ${l.duration}s</p>
                                <span class="form-check form-switch">
                                    Status:<input class="form-check-input" type="checkbox" role="switch" disabled="" ${l.status == true ? 'checked' : ''}>
                                </span>
                                <a href="editQuiz?id=${l.quizId}" class="btn btn-primary">Edit</a>
                                <c:set var="check" value="false"></c:set>
                                <c:forEach var="a" items="${listAttempt}">
                                    <c:if test="${l.quizId == a.quiz.quizId}">
                                        <c:set var="check" value="true"></c:set>
                                    </c:if>                                   
                                </c:forEach>
                                <c:if test="${check == false}">
                                    <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#quiz${l.quizId}" >Delete</a>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <!-- Modal -->
        <c:forEach var="l" items="${listQuiz}">
            <div class="modal fade" id="quiz${l.quizId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Xác nhận xóa</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="deleteQuiz" method="POST">
                            <input type="hidden" value="${l.quizId}" name="quizId">
                            <div class="modal-body">
                                Bạn có chắc chắn muốn xóa ${l.quizName}<br>
                                Hành động này không thể hoàn tác.

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Modal -->
        <div class="modal fade" id="addQuiz" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Quiz</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="addQuiz" method="POST">
                        <div class="modal-body">
                            <div class="input-group">
                                <span class="input-group-text">Quiz Name</span>
                                <textarea class="form-control"  name="quizName" style="height: 100px; max-height: 100px; overflow-y: scroll" required=""></textarea>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1">Duration</span>
                                <input type="number" class="form-control"  name="duration" required="" min="10">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
