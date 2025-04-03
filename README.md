# Quiz App

This project is a microservices-based application consisting of three sub-projects:

1. **Question Service**  
    The Question Service is responsible for storing and managing quiz questions. It provides an API for the Quiz Service to access questions based on specified categories and the desired number of questions.

2. **Quiz Service**  
    The Quiz Service generates quizzes by retrieving questions from the Question Service. It allows users to create quizzes dynamically based on their preferences, such as category and question count.

3. **Service Registry**  
    The Service Registry, implemented using Eureka and Feign, acts as an interface between the Question Service and the Quiz Service. It ensures that the services remain decoupled while enabling seamless communication between them.

### Key Features
- Microservices architecture for modularity and scalability.
- Dynamic quiz generation based on user preferences.
- Service discovery and communication using Eureka and Feign.

### Technologies Used
- **Spring Boot** for building microservices.
- **Eureka** for service discovery.
- **Feign** for declarative REST client communication.

### How to Run
1. Start the Service Registry.
2. Start the Question Service.
3. Start the Quiz Service.
4. Access the Quiz Service to generate quizzes.

### Future Enhancements
- Add user authentication and authorization.
- Implement a leaderboard for quiz results.
- Enhance question categorization and filtering.