package com.luna.user_service.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luna.user_service.model.QuestionWrapper;
import com.luna.user_service.model.Quiz;
import com.luna.user_service.service.UserService;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    UserService userService;
    
    @GetMapping("/")
    public String home(Model model){
        List<Quiz> quizzes = userService.getAllQuizzes();
        model.addAttribute("quizzes", quizzes);
        return "index";
    }

    @GetMapping("/quiz/{quizId}")
    public String takeQuiz(Model model, @PathVariable Integer quizId){
        List<QuestionWrapper> questions = userService.getQuizQuestions(quizId);
        model.addAttribute("questions", questions);
        return "/quizzes/quiz";
    }
}
