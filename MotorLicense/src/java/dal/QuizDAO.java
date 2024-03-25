/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Answer;
import model.AttemptDetail;
import model.Question;
import model.Quiz;
import model.UserAttempt;

public class QuizDAO extends DBContext {

    private Quiz mapToResultQuiz(ResultSet rs) throws SQLException {
        Quiz q = new Quiz();
        q.setQuizId(rs.getInt("quizId"));
        q.setQuizName(rs.getString("quizName"));
        q.setDuration(rs.getInt("duration"));
        q.setStatus(rs.getBoolean("status"));
        return q;
    }

    private Question mapToResultQuestion(ResultSet rs) throws SQLException {
        Question ques = new Question();
        ques.setQuestionId(rs.getInt("questionId"));
        ques.setQuestionName(rs.getString("questionName"));
        ques.setType(rs.getBoolean("type"));
        ques.setExplain(rs.getString("explain"));
        ques.setQuiz(mapToResultQuiz(rs));
        return ques;
    }

    private Answer mapToResultAnswer(ResultSet rs) throws SQLException {
        Answer a = new Answer();
        a.setAnswerId(rs.getInt("answerId"));
        a.setDetail(rs.getString("detail"));
        a.setIsCorrect(rs.getBoolean("isCorrect"));
        a.setQuestion(mapToResultQuestion(rs));
        return a;
    }

    public ArrayList<AttemptDetail> getAttemptDetailById(int attemptId) {
        ArrayList<AttemptDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [attempt_detail]\n"
                    + "WHERE attemptId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, attemptId);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAttempt ua = new UserAttempt();
                ua.setAttemptId(rs.getInt("attemptId"));
                Quiz q = new Quiz();
                q.setQuizId(rs.getInt("quizId"));
                Question qe = new Question();
                qe.setQuestionId(rs.getInt("questionId"));
                Answer a = new Answer();
                a.setAnswerId(rs.getInt("answerId"));
                AttemptDetail ad = new AttemptDetail();
                ad.setAttemptDetailId(rs.getInt("attemptDetailId"));
                ad.setUserAttempt(ua);
                ad.setQuestion(qe);
                ad.setQuiz(q);
                ad.setAnswer(a);
                list.add(ad);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Get quiz by quizId with status true or false
    public Quiz getQuizById(String quizId) {
        try {
            String sql = "SELECT * FROM quiz WHERE quizId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return mapToResultQuiz(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Get all quiz with status = 1
    public ArrayList<Quiz> getAllQuiz() {
        ArrayList<Quiz> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM quiz WHERE status = 1";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToResultQuiz(rs));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //get all quiz
    public ArrayList<Quiz> getAllQuizAdmin() {
        ArrayList<Quiz> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM quiz";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToResultQuiz(rs));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Get all Question of quiz by quizId
    public ArrayList<Question> getAllQuesByQuizId(String quizId) {
        ArrayList<Question> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM question ques\n"
                    + "JOIN Quiz q\n"
                    + "ON q.quizId = ques.quizId\n"
                    + "WHERE q.quizId = ?\n"
                    + "ORDER BY NEWID()";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToResultQuestion(rs));

            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Get all Answer By quizId 
    public ArrayList<Answer> getAllAnswerByQuizId(String quizId) {
        ArrayList<Answer> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM answer a\n"
                    + "JOIN question ques\n"
                    + "ON a.questionId = ques.questionId\n"
                    + "JOIN quiz q\n"
                    + "ON q.quizId = ques.quizId\n"
                    + "WHERE q.quizId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToResultAnswer(rs));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Insert Attempt
    public void addAttempt(String quizId, int userId) {
        try {
            String sql = "INSERT INTO [dbo].[user_attempt]\n"
                    + "           ([quizId]\n"
                    + "           ,[total]\n"
                    + "           ,[finish]\n"
                    + "           ,[userId]\n"
                    + "           ,[note])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,0\n"
                    + "           ,0\n"
                    + "           ,?\n"
                    + "           ,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            ps.setInt(2, userId);
            ps.setString(3, "Bỏ bài, không làm bài");
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Insert Attempt Detail
    public void insertAttemptDetail(int attemptId, String quizId, String questionId, String answerId) {
        try {
            if (answerId == null || answerId.isEmpty()) {
                String sql = "INSERT INTO [dbo].[attempt_detail]\n"
                        + "           ([attemptId]\n"
                        + "           ,[quizId]\n"
                        + "           ,[questionId])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, attemptId);
                ps.setString(2, quizId);
                ps.setString(3, questionId);
            } else {
                String sql = "INSERT INTO [dbo].[attempt_detail]\n"
                        + "           ([attemptId]\n"
                        + "           ,[quizId]\n"
                        + "           ,[questionId]\n"
                        + "           ,[answerId])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, attemptId);
                ps.setString(2, quizId);
                ps.setString(3, questionId);
                ps.setString(4, answerId);
            }
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public UserAttempt getLastAttempt() {
        try {
            String sql = "SELECT TOP 1 * FROM user_attempt ua\n"
                    + "JOIN quiz q\n"
                    + "ON q.quizId = ua.quizId\n"
                    + "ORDER BY attemptId DESC";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAttempt ua = new UserAttempt();
                ua.setAttemptId(rs.getInt("attemptId"));

                return ua;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Question getQuestion(int questionId) {
        try {
            String sql = "SELECT * FROM question qu\n"
                    + "JOIN quiz q\n"
                    + "ON q.quizId = qu.quizId\n"
                    + "WHERE questionId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, questionId);
            rs = ps.executeQuery();
            while (rs.next()) {
//                Quiz q = mapToResultQuiz(rs);
                return mapToResultQuestion(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Answer getAnswer(int answerId) {
//        if(answerId == 0){
//            return null;
//        }
        try {
            String sql = "SELECT * FROM answer a\n"
                    + "JOIN question ques\n"
                    + "ON a.questionId = ques.questionId\n"
                    + "JOIN quiz q\n"
                    + "ON q.quizId = ques.quizId\n"
                    + "WHERE a.answerId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, answerId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return mapToResultAnswer(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateUserAttempt(int attemptId, int total, String finish, String note) {
        try {
            if (note == null || note.isEmpty()) {
                String sql = "UPDATE [dbo].[user_attempt]\n"
                        + "   SET [total] = ?\n"
                        + "      ,[finish] = ?\n"
                        + " WHERE attemptId = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, total);
                ps.setString(2, finish);
                ps.setInt(3, attemptId);
                ps.executeUpdate();
            } else {
                String sql = "UPDATE [dbo].[user_attempt]\n"
                        + "   SET [total] = ?\n"
                        + "      ,[finish] = ?\n"
                        + "      ,[note] = ?\n"
                        + " WHERE attemptId = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, total);
                ps.setString(2, finish);
                ps.setString(3, note);
                ps.setInt(4, attemptId);
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<UserAttempt> listAttemptByUserId(int userId) {

        try {
            ArrayList<UserAttempt> list = new ArrayList<>();
            String sql = "SELECT * FROM user_attempt ua\n"
                    + "JOIN Quiz q\n"
                    + "ON ua.quizId = q.quizId\n"
                    + "WHERE userId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAttempt ua = new UserAttempt();
                ua.setAttemptId(rs.getInt("attemptId"));
                ua.setQuiz(mapToResultQuiz(rs));
                ua.setTotal(rs.getInt("total"));
                ua.setFinish(rs.getInt("finish"));
                ua.setNote(rs.getString("note"));
                list.add(ua);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public UserAttempt getAttemptByAttemptId(String attemptId) {
        try {
            String sql = "SELECT * FROM user_attempt ua\n"
                    + "JOIN Quiz q\n"
                    + "ON ua.quizId = q.quizId\n"
                    + "WHERE attemptId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, attemptId);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAttempt ua = new UserAttempt();
                ua.setAttemptId(rs.getInt("attemptId"));
                ua.setQuiz(mapToResultQuiz(rs));
                ua.setTotal(rs.getInt("total"));
                ua.setFinish(rs.getInt("finish"));
                ua.setNote(rs.getString("note"));
                return ua;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<UserAttempt> checkQuizAttempt() {
        ArrayList<UserAttempt> list = new ArrayList<>();
        try {
            String sql = "SELECT quizId FROM user_attempt\n"
                    + "GROUP BY quizId";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserAttempt ua = new UserAttempt();
                Quiz q = new Quiz();
                q.setQuizId(rs.getInt("quizId"));
                ua.setQuiz(q);
                list.add(ua);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkAttempt(String quizId) {
        try {
            String sql = "SELECT quizId FROM user_attempt\n"
                    + "WHERE quizId = ?\n"
                    + "GROUP BY quizId";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void deleteQuiz(String quizId) {
        try {
            ArrayList<Question> listQues = getAllQuesByQuizId(quizId);
            if (listQues != null) {
                for (Question ques : listQues) {
                    deleteAnswer(ques.getQuestionId());
                }
            }
            deleteQuestion(quizId);
            String sql = "DELETE FROM [dbo].[quiz]\n"
                    + "      WHERE quizId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteAnswer(int questionId) {
        try {
            String sql = "DELETE FROM [dbo].[answer]\n"
                    + "      WHERE questionId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, questionId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteAnswer(String answerId) {
        try {
            String sql = "DELETE FROM [dbo].[answer]\n"
                    + "      WHERE answerId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, answerId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteQuestion(String quizId) {
        try {
            String sql = "DELETE FROM [dbo].[question]\n"
                    + "      WHERE quizId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteQuestionByQues(String questionId) {
        try {
            String sql = "DELETE FROM [dbo].[question]\n"
                    + "      WHERE questionId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, questionId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateQuiz(String quizId, String quizName, String duration, String status) {
        try {
            String sql = "UPDATE [dbo].[quiz]\n"
                    + "   SET [quizName] = ?\n"
                    + "      ,[duration] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE quizId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizName);
            ps.setString(2, duration);
            ps.setString(3, status);
            ps.setString(4, quizId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Answer> getAnswerByQuesId(String questionId) {

        ArrayList<Answer> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM answer a\n"
                    + "JOIN question ques\n"
                    + "ON ques.questionId = a.questionId\n"
                    + "JOIN quiz q \n"
                    + "ON q.quizId = ques.quizId\n"
                    + "WHERE a.questionId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, questionId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToResultAnswer(rs));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateQuestion(String questionId, String questionName, String explain, String type) {
        try {
            String sql = "UPDATE [dbo].[question]\n"
                    + "   SET [questionName] = ?\n"
                    + "      ,[type] = ?\n"
                    + "      ,[explain] = ?\n"
                    + " WHERE questionId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, questionName);
            ps.setString(2, type);
            ps.setString(3, explain);
            ps.setString(4, questionId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateAnswer(int answerId, String detail, String isCorrect, String questionId) {
        try {
            String sql = "UPDATE [dbo].[answer]\n"
                    + "   SET [detail] = ?\n"
                    + "      ,[isCorrect] = ?\n"
                    + "      ,[questionId] = ?\n"
                    + " WHERE answerId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, detail);
            ps.setString(2, isCorrect);
            ps.setString(3, questionId);
            ps.setInt(4, answerId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addAnswer(String questionId, String answer, String isCorrect) {
        try {
            String sql = "INSERT INTO [dbo].[answer]\n"
                    + "           ([detail]\n"
                    + "           ,[isCorrect]\n"
                    + "           ,[questionId])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, answer);
            ps.setString(2, isCorrect);
            ps.setString(3, questionId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addQuestion(String quizId, String questionName, String explain, String type) {
        try {
            String sql = "INSERT INTO [dbo].[question]\n"
                    + "           ([questionName]\n"
                    + "           ,[type]\n"
                    + "           ,[explain]\n"
                    + "           ,[quizId])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, questionName);
            ps.setString(2, type);
            ps.setString(3, explain);
            ps.setString(4, quizId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Question getLastQues() {
        try {
            String sql = "SELECT TOP 1* FROM question ques\n"
                    + "JOIN quiz q\n"
                    + "ON q.quizId = ques.quizId\n"
                    + "ORDER BY questionId DESC";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return mapToResultQuestion(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkQuiz(String quizId) {
        try {
            String sql = "SELECT * FROM question\n"
                    + "WHERE quizId = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addQuiz(String quizName, String duration) {
        try {
            String sql = "INSERT INTO [dbo].[quiz]\n"
                    + "           ([quizName]\n"
                    + "           ,[duration]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,0)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, quizName);
            ps.setString(2, duration);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        QuizDAO dao = new QuizDAO();
//        System.out.println(dao.getQuizById("1"));
//        for (Question q : dao.getAllQuesByQuizId("1")) {
//            System.out.println(q);
//        }
//        for (Answer a : dao.getAllAnswerByQuizId("1")) {
//            System.out.println(a);
//        }
////        dao.addAttempt("1",1);
////        System.out.println(dao.getLastAttempt());
//        System.out.println(dao.getAllQuesByQuizId("1").size());
//        dao.insertAttemptDetail(1, "1", "2", "5");
//        for (AttemptDetail ad : dao.getAttemptDetailById(10)) {
//            System.out.println(ad);
//        }

//        System.out.println(dao.getQuestion(1));
//        System.out.println(dao.getAnswer(0));
//        dao.updateUserAttempt(1, 10, "20", "Sai câu điểm liệt");
//        for (UserAttempt ua : dao.listAttemptByUserId(1)) {
//            System.out.println(ua);
//        }
//        System.out.println(dao.getAttemptByAttemptId("8"));
//        dao.updateQuiz("1", "Hehe", "40", "0");
//        for (Answer a : dao.getAnswerByQuesId("1")) {
//            System.out.println(a);
//        }
        System.out.println(dao.getLastQues());
    }
}
