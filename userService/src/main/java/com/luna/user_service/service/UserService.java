package com.luna.user_service.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.user_service.feign.UserInterface;
import com.luna.user_service.model.QuestionWrapper;
import com.luna.user_service.model.Quiz;
import com.luna.user_service.model.Response;

@Service
public class UserService {

    @Autowired
    UserInterface userInterface;
    
    public List<Quiz> getAllQuizzes(){
        List<Quiz> quizzes = userInterface.getAllQuiz().getBody();
        return quizzes;
    }

    public Quiz getQuizById(Integer quizId) {
        Quiz quiz = userInterface.getQuizById(quizId).getBody();
        return quiz;
    }

    public List<QuestionWrapper> getQuizQuestions(Integer quizId) {
        List<QuestionWrapper> questions = userInterface.getQuizQuestions(quizId).getBody();
        return questions;
    }

    public Integer calculateResult(Integer quizId, Map<String, String> answers) {
        List<Response> responses = new ArrayList<>();
        for (Map.Entry<String, String> entry : answers.entrySet()) {
            Integer questionId = Integer.parseInt(entry.getKey());
            String answer = entry.getValue();
            Response response = new Response(questionId, answer);
            responses.add(response);
        }
        Integer score = userInterface.submitQuiz(quizId, responses).getBody();
        return score;
    }
}
