
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            section {
                min-height: 90vh;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <section>
            <div class="container d-flex justify-content-center mt-5">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Finish At</th>
                            <th scope="col">Total Correct</th>
                            <th scope="col">Note</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="l" items="${list}" varStatus="count">
                            <tr>
                                <th scope="row">${count.index+1}</th>
                                <td>${l.quiz.quizName}</td>
                                <td>${l.finish}/${l.quiz.duration}</td>
                                <td class="">${l.total}</td>
                                <td>${l.note}</td>
                                <td><a type="button" class="btn btn-primary" href="viewDetail?aid=${l.attemptId}&qid=${l.quiz.quizId}">View Detail</a></td>
                            </tr>  
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
</html>
