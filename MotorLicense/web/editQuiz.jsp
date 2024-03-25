
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="">
            <%@include file="header.jsp" %>
        </div>
        <div class="container mt-3">
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
                                            <c:if test="${check == false}">
                                                <a href="editQuestion?id=${l.questionId}" class="btn btn-primary" role="button">Edit question</a> 
                                                <a href="deleteQuestion?id=${l.questionId}&qid=${quiz.quizId}" class="btn btn-danger" role="button">Delete question</a> 
                                            </c:if>
                                        </div> 
                                    </c:if>
                                    <c:if test="${l.type == false}">
                                        <div class="card-header">
                                            ${l.questionName}
                                            <c:if test="${check == false}">
                                                <a href="editQuestion?id=${l.questionId}" class="btn btn-primary" role="button">Edit question</a> 
                                                <a href="deleteQuestion?id=${l.questionId}&qid=${quiz.quizId}" class="btn btn-danger" role="button">Delete question</a> 
                                            </c:if>
                                        </div> 
                                    </c:if>
                                    <c:set var="count" value="1"></c:set>
                                    <input type="hidden" value="${l.questionId}" name="questionNo${listIndex.index+1}">
                                    <div class="card-body" style="width: 500px;">
                                        <c:forEach var="a" items="${listAnswer}">
                                            <c:if test="${l.questionId == a.question.questionId}">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="answerQuestionNo${listIndex.index+1}" 
                                                           id="answerQuestionNo${listIndex.index+1}" value="${a.answerId}" ${a.isCorrect == true ? 'checked' : ''} readonly="" disabled="">
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
                <div class="col-md-4">
                    <div class="card sticky-top" style="z-index: 999;">
                        <form action="editQuiz" method="POST">
                            <div class="card-header">
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1">Quiz name</span>
                                    <input type="text" class="form-control" value="${quiz.quizName}" name="quizName">
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1">Duration</span>
                                    <input type="number" class="form-control" value="${quiz.duration}" name="duration">
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" name="status" ${quiz.status == true ? 'checked' : ''} value="1" ${checkQues == false ? 'disabled':''}>
                                    <label class="form-check-label" for="flexSwitchCheckDefault">Status</label>
                                </div>
                                <c:if test="${check == true}">
                                    <p style="color: red">*Quiz has user attempt can not edit questions and answers</p>
                                </c:if> 
                                <c:if test="${checkQues == false}">
                                    <p style="color: red">*Quiz has no question cannot set public</p>
                                </c:if> 
                                <c:if test="${mess != null}">
                                    <p style="color: green; font-size: 30px;">${mess}</p>
                                </c:if>   
                                <input type="hidden" value="${quiz.quizId}" name="quizId">                                
                                <button type="submit" class="btn btn-primary">Edit</button>
                                <c:if test="${check == false}">
                                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">Add Question</button>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm câu hỏi</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="addQuestion" method="POST">
                        <div class="modal-body">
                            <input type="hidden" value="${quiz.quizId}" name="quizId">
                            <div class="input-group">
                                <span class="input-group-text">Question Name</span>
                                <textarea class="form-control"  name="questionName" style="height: 100px; max-height: 100px; overflow-y: scroll" required=""></textarea>
                            </div>
                            <div class="input-group">
                                <span class="input-group-text" style="padding-right: 74px">Explain</span>
                                <textarea class="form-control" name="explain" style="height: 100px; max-height: 100px; overflow-y: scroll" required=""></textarea>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" value="1"  name="type">
                                <label class="form-check-label" for="flexSwitchCheckDefault">Type</label>
                            </div>
                            <hr><!-- comment -->
                            <div class="form-check d-flex align-items-center">
                                <input class="form-check-input custom-radio" type="radio"  value="1"  name="answerCheck" required="">
                                <label class="form-check-label" for="flexRadioDefault2" style="width: 100%">                                       
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon1">Answer 1</span>
                                        <textarea type="text" class="form-control" name="answerDetail1" style="height: 100px; max-height: 100px; overflow-y: scroll" required=""></textarea>
                                    </div>
                                </label>                                
                            </div> 
                            <div class="form-check d-flex align-items-center">
                                <input class="form-check-input custom-radio" type="radio"  value="2"  name="answerCheck">
                                <label class="form-check-label" for="flexRadioDefault2" style="width: 100%">                                       
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon1">Answer 2</span>
                                        <textarea type="text" class="form-control" name="answerDetail2" style="height: 100px; max-height: 100px; overflow-y: scroll" required=""></textarea>
                                    </div>
                                </label>                                
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
        <script>
            const radioButtons = document.querySelectorAll('.custom-radio');

            radioButtons.forEach(button => {
                button.addEventListener('click', function () {
                    radioButtons.forEach(btn => {
                        if (btn !== button) {
                            btn.checked = false;
                        }
                    });
                });
            });
        </script>
    </body>
</html>
