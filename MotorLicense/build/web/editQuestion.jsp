
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
        <div class="container vh-100 mt-5">
            <div class="row d-flex justify-content-center text-center">
                <c:if test="${mess != null}">
                    <p class="text-success" style="font-size: 30px;">${mess}</p>
                </c:if>           
            </div>            
            <div class="row g-1 d-flex justify-content-center">
                <div class="card" style="width: 700px;">
                    <form action="editQuestion" method="POST">
                        <div class="card-header">
                            <input type="hidden" value="${q.questionId}" name="questionId">
                            <div class="input-group">
                                <span class="input-group-text">Question Name</span>
                                <textarea class="form-control"  name="questionName" style="height: 100px; max-height: 100px; overflow-y: scroll">${q.questionName}</textarea>
                            </div>

                            <div class="input-group">
                                <span class="input-group-text" style="padding-right: 74px">Explain</span>
                                <textarea class="form-control" name="explain" style="height: 100px; max-height: 100px; overflow-y: scroll">${q.explain}</textarea>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" value="1" ${q.type == true ? 'checked' : ''} name="type">
                                <label class="form-check-label" for="flexSwitchCheckDefault">Type</label>
                            </div>
                        </div>
                        <div class="card-body">
                            <c:forEach var="a" items="${listAnswer}" varStatus="count">                                                                                                                                                      
                                <div class="form-check d-flex align-items-center">
                                    <input class="form-check-input custom-radio" type="radio" id="answer" value="1" ${a.isCorrect == true ? 'checked':'' } name="answerCheck${count.index+1}">
                                    <label class="form-check-label" for="flexRadioDefault2" style="width: 100%">                                       
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon1">${count.index + 1}</span>
                                            <textarea type="text" class="form-control" name="answerDetail${count.index+1}" style="height: 100px; max-height: 100px; overflow-y: scroll">${a.detail}</textarea>
                                        </div>
                                    </label>

                                    <c:if test="${a.isCorrect == false && total > 2}">
                                        <a href="deleteAnswer?aid=${a.answerId}&qid=${q.questionId}"class="btn btn-danger" style="height: 40px">Delete</a>
                                    </c:if> 
                                </div>                                                                    
                            </c:forEach>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary">Save change</button>
                            <a class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addAnswer" >Add Answer</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addAnswer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm câu trả lời</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="addAnswer" method="POST">
                        <input type="hidden" value="${q.questionId}" name="questionId">
                        <div class="modal-body">
                            <div class="input-group">
                                <span class="input-group-text" style="">Answer</span>
                                <textarea class="form-control" name="answer" style="height: 100px; max-height: 100px; overflow-y: scroll"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success">Add Answer</button>
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
