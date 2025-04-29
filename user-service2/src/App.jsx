import { useParams, useLocation, BrowserRouter as Router, Routes, Route, useNavigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import api from './utilities/api';

export default function App() {
  const [quizzes, setQuizzes] = useState([]);

  // Retrieve quizzes
  useEffect(() => {
    const fetchData = async() => {
      try{
        const response = await api.get('/quiz-service/quiz/');
        setQuizzes(response.data);
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
    }

    fetchData();
  }, []);

  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home quizzes={quizzes} />} />
        <Route path="quiz/:id" element={<QuizPage />}/>
      </Routes>
    </Router>
  );
}

function Home({ quizzes }) {
  return (
    <div className="max-w-80vw mx-auto">
      <Navbar />
      <div className="m-12 text-center">
        <h1 className='text-4xl font-bold tracking-tight text-gray-900 dark:text-white'>Hello, User!</h1>
        <p className='mt-3 text-lg text-gray-500'>Please select a quiz below</p>
      </div>
      
      <div className="w-3/4 mx-auto">
        <div className="container bg-gray-50 border mx-auto p-8  grid grid-cols-3 gap-4 place-items-center">
          {quizzes.map(quiz => {
            return <QuizCard key={quiz.title} quiz={quiz}/>
          })}
        </div>
      </div>
    </div>
  );  
}

function Navbar(){
  return (
    <nav className="bg-blue-600 text-white p-4 px-16 mx-auto">
      <div className="container mx-auto flex justify-between items-center">
        <a href="/" className="text-3xl font-bold">QUIZIFY</a>
        <ul className="flex space-x-4 text-xl">
          <li>
            <a href="/" className="hover:underline">
              Home
            </a>
          </li>
          <li>
            <a href="#" className="hover:underline">
              About
            </a>
          </li>
          <li>
            <a href="#" className="hover:underline">
              Contact
            </a>
          </li>
        </ul>
      </div>
    </nav>
  );
}

function QuizCard({ quiz }){
  const navigate = useNavigate();

  const handleClick = () => {
    navigate(`/quiz/${quiz.title}`, { state: { quiz } })
  }

  return (
    <button onClick={handleClick} className="text-left inline-block col-auto w-80 p-6 bg-white border border-gray-200 rounded-lg shadow-sm hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
      <h5 className="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">{quiz.title}</h5>
      <ul className="mx-4">
        <li className="font-normal text-gray-500 dark:text-gray-700">Difficulty: Mixed</li>
        <li className="font-normal text-gray-500 dark:text-gray-700">Questions: {quiz.questionIds.length}</li>
      </ul>
    </button>
  );
}

function QuizPage() {
  const [questions, setQuestions] = useState([]);
  const [answers, setAnswers] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [score, setScore] = useState(null);
  const location = useLocation();
  const quiz = location.state?.quiz;

  useEffect(() => {
    const fetchData = async() => {
      try {
        const response = await api.post(`/quiz-service/quiz/getQuestions/${quiz.id}`);
        setQuestions(response.data);
      } catch (error) {
        console.error(error)
      }
    };

    fetchData();
  }, [quiz?.id]);
  
  const handleAnswerChange = (questionId, selectedOption) => {
    setAnswers((prevAnswers) => ({
      ...prevAnswers,
      [questionId]: selectedOption,
    }));
  };

  const handleSubmit = async(event) => {
    event.preventDefault();

    const formattedAnswers = Object.entries(answers).map(([id, answer]) => ({
      id: parseInt(id),
      answer, 
    }));
    console.log(formattedAnswers);
    
    try {
      console.log(formattedAnswers);
      const response = await api.post(`/quiz-service/quiz/submit/1`, formattedAnswers);
      console.log("Response: " + response.data);
      setScore(response.data);
      setShowModal(true);
    } catch(error) {
      console.error(`Error submitting ${error}`);
    }
  }

  return (
    <div className="max-w-80vw mx-auto">
      <Navbar />
      <div className="m-12 text-center">
          <h1 className='text-4xl font-bold tracking-tight text-gray-900 dark:text-white'>{quiz.title}</h1>
        </div>
      <form onSubmit={handleSubmit} className="px-48 py-12 mb-12 bg-gray-50 border">
        {questions.map((question, idx) => (
          <Question 
            key={question.id}
            question={question}
            questionNumber={idx + 1}
            selectedAnswer={answers[question.id]}
            onAnswerChange={handleAnswerChange}
          />
        ))}
        <div className='text-center'>
          <button type="submit" className='mt-6 px-6 py-2 bg-blue-600 text-white rounded hover:bg-blue-700' >Submit</button>
        </div>
      </form>

      {showModal && <SubmitDialog score={score} onClose={() => setShowModal(false)} />}
    </div>
  );
}

function Question({ question, questionNumber, selectedAnswer, onAnswerChange }){
  const options = [question.option1, question.option2, question.option3, question.option4];
  return (
    <div className="mb-8">
      <h2 className='text-2xl font-semibold mb-4'>{questionNumber}. {question.questionTitle}</h2>
      <ul className="px-12">
        {options.map((option) => (
          <li key={option}>
            <label className="flex items-center space-x-2">
              <input 
                type="radio" 
                name={`question-${question.id}`}
                value={option}
                checked={selectedAnswer === option}
                onChange={() => onAnswerChange(question.id, option)}
                className="form-radio"
              />
              <span>{option}</span>
            </label>
          </li>
        ))}
      </ul>
    </div>
  );
}

function SubmitDialog({ score, onClose }){
  return (
    <div className='fixed inset-0 flex items-center justify-center bg-black bg-opacity-50'>
      <div className='bg-white p-8 rounded shadow-lg text-center'>
        <h2 className='text-2xl font-bold mb-4'>Quiz Submitted!</h2>
        <p className='text-lg mb-6'>Your score is: <span className='font-bold'>{score}</span></p>
        <button onClick={onClose} className='px-6 py-2 bg-blue-600 text-white rounded hover:bg-blue-700'>Close</button>
      </div>
    </div>
  );
}