/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Answer;
import model.AttemptDetail;
import model.Question;
import model.User;
import model.UserAttempt;
import utils.expirationTimer;

@WebServlet(name = "DoQuiz", urlPatterns = {"/doQuiz"})
public class DoQuiz extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DoQuiz</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoQuiz at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String quizId = request.getParameter("id");
        QuizDAO quizDAO = new QuizDAO();
        expirationTimer timer = new expirationTimer();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("home");
            return;
        }
        if (session.getAttribute("userAttempt") == null) {
            quizDAO.addAttempt(quizId, user.getUserId());
            UserAttempt userAttempt = quizDAO.getLastAttempt();
            session.setAttribute("userAttempt", userAttempt);
            timer.timerOTP(quizDAO.getQuizById(quizId).getDuration(), request, "userAttempt");
        }
        request.setAttribute("quiz", quizDAO.getQuizById(quizId));
        request.setAttribute("listQuestion", quizDAO.getAllQuesByQuizId(quizId));
        request.setAttribute("listAnswer", quizDAO.getAllAnswerByQuizId(quizId));
        request.getRequestDispatcher("doQuiz.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserAttempt userAttempt = (UserAttempt) session.getAttribute("userAttempt");
        if (userAttempt == null) {
            response.sendRedirect("home");
            return;
        }
        String quizId = request.getParameter("quizId");
        QuizDAO quizDAO = new QuizDAO();
        String finishTime = request.getParameter("finishTime");
        System.out.println("quizId: " + quizId + " finishAt: " + finishTime);
        for (int i = 1; i <= quizDAO.getAllQuesByQuizId(quizId).size(); i++) {
            String question = request.getParameter("questionNo" + i);
            String answer = request.getParameter("answerQuestionNo" + i) == null ? "" : request.getParameter("answerQuestionNo" + i);
            quizDAO.insertAttemptDetail(userAttempt.getAttemptId(), quizId, question, answer);
        }
        ArrayList<AttemptDetail> list = quizDAO.getAttemptDetailById(userAttempt.getAttemptId());
        if (list != null) {
            int count = 0;
            boolean flag = true;
            for (AttemptDetail ad : list) {
                Question q = quizDAO.getQuestion(ad.getQuestion().getQuestionId());
//                Answer a = quizDAO.getAnswer(ad.getAnswer().getAnswerId() == null ? 0 : ad.getAnswer().getAnswerId());
                Answer a = quizDAO.getAnswer(ad.getAnswer().getAnswerId());
                if (a != null && a.isIsCorrect() == true) {
                    count++;
                } else {
                    if (q.isType() == true) {
                        flag = false;
                    }
                }
            }
            if(flag == false){
                quizDAO.updateUserAttempt(userAttempt.getAttemptId(), count, finishTime, "Sai câu điểm liệt");
            } else {
                float percent = (float) count/list.size();
                if(percent >= 0.8){
                    quizDAO.updateUserAttempt(userAttempt.getAttemptId(), count, finishTime, "Passed");
                }else{
                    quizDAO.updateUserAttempt(userAttempt.getAttemptId(), count, finishTime, "Not Passed");
                }
            }           
        }
        request.setAttribute("att", quizDAO.getAttemptByAttemptId(Integer.toString(userAttempt.getAttemptId())));
        session.removeAttribute("userAttempt");
//        response.sendRedirect("home");
        request.getRequestDispatcher("view.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
