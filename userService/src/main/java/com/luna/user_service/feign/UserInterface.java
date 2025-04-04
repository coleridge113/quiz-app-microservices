package com.luna.user_service.feign;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.luna.user_service.model.QuestionWrapper;
import com.luna.user_service.model.Quiz;
import com.luna.user_service.model.Response;

@FeignClient("QUIZ-SERVICE")
public interface UserInterface {
    @GetMapping("/quiz/getAllQuiz")
    public ResponseEntity<List<Quiz>> getAllQuiz();

    @GetMapping("/quiz/{id}")
    public ResponseEntity<Quiz> getQuizById(@PathVariable int id);
        
    @PostMapping("/quiz/getQuestions/{quizId}")
    public ResponseEntity<List<QuestionWrapper>> getQuizQuestions(@PathVariable Integer quizId);

    @PostMapping("quiz/submit/{id}")
    public ResponseEntity<Integer> submitQuiz(@PathVariable Integer id, @RequestBody List<Response> responses);
    
}
