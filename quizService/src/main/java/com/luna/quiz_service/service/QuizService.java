package com.luna.quiz_service.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import com.luna.quiz_service.model.QuestionWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import com.luna.quiz_service.dao.QuizDao;
import com.luna.quiz_service.feign.QuizInterface;
import com.luna.quiz_service.model.Quiz;
import com.luna.quiz_service.model.Response;

@Service
public class QuizService {

    @Autowired
    QuizDao quizDao;

    @Autowired
    QuizInterface quizInterface;


    public ResponseEntity<String> createQuiz(String category, int numQ, String title){;
        List<Integer> questions = quizInterface.getQuestionsForQuiz(numQ, category).getBody();

        Quiz quiz = new Quiz();
        quiz.setTitle(title);
        quiz.setQuestionIds(questions);
        try{
            quizDao.save(quiz);
            return new ResponseEntity<>("Quiz created successfully with ID: " + quiz.getId(), HttpStatus.CREATED);
        } catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<>("Failed to create quiz!", HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    public ResponseEntity<String> deleteQuiz(int id) {
        if(quizDao.existsById(id)){
            try{
                quizDao.deleteById(id);
                return new ResponseEntity<>("Quiz " + id + " deleted successfully!", HttpStatus.OK);
            } catch (Exception e){
                e.printStackTrace();
                return new ResponseEntity<>("Failed to delete quiz!", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } else {
            return new ResponseEntity<>("Quiz with ID " + id + " not found!", HttpStatus.NOT_FOUND);
        }
    }

    public ResponseEntity<Quiz> getQuizById(int id) {
        return quizDao.findById(id)
                .map(quiz -> new ResponseEntity<>(quiz, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    public ResponseEntity<List<Quiz>> getAllQuiz() {
        try{
            return new ResponseEntity<>(quizDao.findAll(), HttpStatus.OK);
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<List<QuestionWrapper>> getQuizQuestions(int id) {
        // Optional<Quiz> quiz = quizDao.findById(id);

        // if(quiz.isEmpty()){
        //     return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        // }

        // List<QuestionWrapper> questionsForUser = quiz.get().getQuestionIds().stream()
        //     .map(q -> new QuestionWrapper(
        //             q.getId(),
        //             q.getQuestionTitle(),
        //             q.getOption1(),
        //             q.getOption2(),
        //             q.getOption3(),
        //             q.getOption4()
        //     ))
        //     .collect(Collectors.toCollection(ArrayList::new));

        // Collections.shuffle(questionsForUser);

        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    public ResponseEntity<Integer> calculateResult(Integer id, List<Response> responses) {
        // Optional<Quiz> quiz = quizDao.findById(id);
        // if (quiz.isEmpty()) {
        //     return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        // }
    
        // List<Question> questions = quiz.get().getQuestions();
    
        // Map<Integer, Question> questionMap = questions.stream()
        //         .collect(Collectors.toMap(Question::getId, question -> question));
    
        int correctAnswers = 0;
    
        // for (Response response : responses) {
        //     Question question = questionMap.get(response.getId()); 
        //     if (question != null && response.getAnswer().equals(question.getRightAnswer())) {
        //         correctAnswers++;
        //     }
        // }
    
        return new ResponseEntity<>(correctAnswers, HttpStatus.OK);
    }
}
