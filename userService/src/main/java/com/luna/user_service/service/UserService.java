package com.luna.user_service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luna.user_service.feign.UserInterface;
import com.luna.user_service.model.QuestionWrapper;
import com.luna.user_service.model.Quiz;

@Service
public class UserService {

    @Autowired
    UserInterface userInterface;
    
    public List<Quiz> getAllQuizzes(){
        List<Quiz> quizzes = userInterface.getAllQuiz().getBody();
        return quizzes;
    }

    public List<QuestionWrapper> getQuizQuestions(Integer quizId) {
        List<QuestionWrapper> questions = userInterface.getQuizQuestions(quizId).getBody();
        return questions;
    }
}
