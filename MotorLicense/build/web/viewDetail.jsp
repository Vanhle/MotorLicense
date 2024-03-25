<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <div class="">
            <%@include file="header.jsp" %>
        </div>
        <div class="container mt-3" style="margin-top: 500px;">
            <div class="row g-1" style="top: 50px;">
                <!--List Quiz-->
                <div class="col-md-8">
                    <c:forEach var="l" items="${listQuestion}" varStatus="listIndex">
                        <div class="row mb-3" id="${listIndex.index+1}">
                            <div class="col-md-12 d-flex justify-content-center">
                                <div class="card" style="max-width: 500px;">
                                    <c:if test="${l.type == true}">
                                        <div class="card-header" style="color: red">
                                            ${listIndex.index+1}.${l.questionName} (Câu điểm liệt)                                       
                                        </div> 
                                    </c:if>
                                    <c:if test="${l.type == false}">
                                        <div class="card-header">
                                            ${listIndex.index+1}.${l.questionName}                                        
                                        </div> 
                                    </c:if>
                                    <c:set var="count" value="1"></c:set>
                                        <div class="card-body" style="width: 500px;">
                                        <c:forEach var="a" items="${listAnswer}">
                                            <c:if test="${l.questionId == a.question.questionId}">

                                                <c:set var="check" value="false"></c:set>
                                                <c:if test="${a.isCorrect == true}">
                                                    <c:set var="correct" value="${a.detail}"></c:set>
                                                </c:if>                                                
                                                <c:forEach var="d" items="${listDetail}">
                                                    <c:if test="${d.answer.answerId == a.answerId}">
                                                        <c:set var="check" value="true"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" id="answerQuestionNo${listIndex.index+1}" value="${a.answerId}" disabled="" ${check == true ? 'checked':''}>
                                                    <label class="form-check-label" for="flexRadioDefault2" style="width: 100%">
                                                        ${count}.${a.detail}
                                                    </label>
                                                </div>
                                                <c:set var="count" value="${count+1}"></c:set>
                                            </c:if>
                                        </c:forEach>
                                        <p class="mb-0 mt-1" style="color: darkgreen">Correct answer: ${correct}</p>
                                        <p class="mb-0 mt-1">Explain: ${l.explain}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!--Navbar-->
                <div class="col-md-4 ">
                    <div class="card sticky-top" style="z-index: 999;">
                        <div class="card-header">
                            ${sessionScope.user.name}
                        </div>
                        <div class="card-body">
                            <h2>${quiz.quizName}</h2>
                            <p>Duration: ${quiz.duration}</p>
                            <p>Finish At: ${attempt.finish}</p>
                            <p>Total correct: ${attempt.total}</p>
                            <p style="color: red">NOTE: ${attempt.note}</p>
                            <p id="countdown"></p>
                            <ul class="pagination d-flex">
                                <c:forEach var="list" items="${listQuestion}" varStatus="number">                                    
                                    <li class="page-item"><a class="page-link" href="#${number.index+1}">${number.index+1}</a></li>   
                                    </c:forEach>
                            </ul>
                            <a type="submit" class="btn btn-success" href="history">Back to view history</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
