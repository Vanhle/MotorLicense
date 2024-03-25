/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class AttemptDetail {
    private int attemptDetailId;
    private UserAttempt userAttempt;
    private Quiz quiz;
    private Question question;
    private Answer answer;

    public AttemptDetail() {
    }

    public int getAttemptDetailId() {
        return attemptDetailId;
    }

    public void setAttemptDetailId(int attemptDetailId) {
        this.attemptDetailId = attemptDetailId;
    }

    public UserAttempt getUserAttempt() {
        return userAttempt;
    }

    public void setUserAttempt(UserAttempt userAttempt) {
        this.userAttempt = userAttempt;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "AttemptDetail{" + "attemptDetailId=" + attemptDetailId + ", userAttempt=" + userAttempt + ", quiz=" + quiz + ", question=" + question + ", answer=" + answer + '}';
    }
    
    
}
