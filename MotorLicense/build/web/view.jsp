

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
        <div class="container mt-3 vh-90 d-flex justify-content-center align-items-center">
            <div class="card" style="max-width: 500px;">               
                <div class="card-header" style="color: red">
                    <h3>${sessionScope.user.userName}</h3>
                </div> 
                <div class="card-body" style="width: 500px;">
                    <p class="card-text">Total correct: ${att.total}</p>
                    <p class="card-text">Finish at: ${att.finish}</p>
                    <p class="card-text">Note: ${att.note}</p>
                </div>
                <div class="card-footer">
                    <a href="history" class="btn btn-success">Back to view History</a>
                </div>
            </div>
        </div>
    </body>
</html>
