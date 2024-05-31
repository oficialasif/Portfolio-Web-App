import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [
    Question(
      'What is the capital of France?',
      ['1. Paris', '2. Berlin', '3. Madrid', '4. Rome'],
      '1. Paris',
    ),
    Question(
      'Which team has won the most FIFA World Cups?',
      ['1. Brazil', '2. Germany', '3. Italy', '4. Argentina'],
      '1. Brazil',
    ),

    Question(
      'In which year was the first FIFA World Cup held?',
      ['1. 1930', '2. 1942', '3. 1950', '4. 1954'],
      '1. 1930',
    ),

    Question(
      'Which country hosted the 2018 FIFA World Cup?',
      ['1. Germany', '2. Brazil', '3. Russia', '4. France'],
      '3. Russia',
    ),

    Question(
      'Who is the all-time top scorer in FIFA World Cup history?',
      [
        '1. Pelé',
        '2. Miroslav Klose',
        '3. Cristiano Ronaldo',
        '4. Lionel Messi'
      ],
      '2. Miroslav Klose',
    ),

    Question(
      'Which country has won the FIFA World Cup five times?',
      ['1. Germany', '2. Argentina', '3. Brazil', '4. France'],
      '3. Brazil',
    ),

    Question(
      'Which team won the 2014 FIFA World Cup?',
      ['1. Spain', '2. Argentina', '3. Germany', '4. Brazil'],
      '3. Germany',
    ),

    Question(
      'Who won the Golden Boot award in the 2018 FIFA World Cup?',
      ['1. Cristiano Ronaldo', '2. Neymar', '3. Harry Kane', '4. Lionel Messi'],
      '3. Harry Kane',
    ),

    Question(
      'Which player is known as the "Hand of God" for his infamous goal in the 1986 World Cup?',
      [
        '1. Diego Maradona',
        '2. Pelé',
        '3. Zinedine Zidane',
        '4. Franz Beckenbauer'
      ],
      '1. Diego Maradona',
    ),

    Question(
      'Which country won the FIFA Women\'s World Cup in 2019?',
      ['1. Germany', '2. Brazil', '3. USA', '4. France'],
      '3. USA',
    ),

    Question(
      'Who is the only player to have won the FIFA World Cup three times?',
      ['1. Pelé', '2. Diego Maradona', '3. Ronaldo', '4. Zinedine Zidane'],
      '1. Pelé',
    ),

    Question(
      'Which nation won the first-ever FIFA Women\'s World Cup in 1991?',
      ['1. USA', '2. Germany', '3. Norway', '4. Brazil'],
      '3. Norway',
    ),

    Question(
      'Which country has the most World Cup final appearances without a win?',
      ['1. Netherlands', '2. Belgium', '3. England', '4. Portugal'],
      '1. Netherlands',
    ),

    Question(
      'In which year did the FIFA World Cup expand to include 32 teams?',
      ['1. 1986', '2. 1994', '3. 1998', '4. 2002'],
      '2. 1994',
    ),

    Question(
      'Who won the FIFA World Cup Golden Ball award in the 2018 tournament?',
      [
        '1. Antoine Griezmann',
        '2. Luka Modrić',
        '3. Kylian Mbappé',
        '4. Cristiano Ronaldo'
      ],
      '2. Luka Modrić',
    ),
    Question(
      'Which country do you like?',
      ['1. France', '2. Germany', '3. Spain', '4. Italy'],
      '1. France',
    ),
    // Add 10 more questions related to the World Cup
    Question(
      'Which team has won the most FIFA World Cups?',
      ['1. Brazil', '2. Germany', '3. Italy', '4. Argentina'],
      '1. Brazil',
    ),
    Question(
      'In which year was the first FIFA World Cup held?',
      ['1. 1930', '2. 1940', '3. 1950', '4. 1960'],
      '1. 1930',
    ),
    // Add more questions here...
  ];

  String _answerResult = '';
  int _score = 0;
  bool _quizCompleted = false;

  void _checkAnswer(String selectedAnswer) {
    if (_quizCompleted) {
      return; // Quiz already completed, ignore further selections
    }

    if (_questions[_currentQuestionIndex].correctAnswer == selectedAnswer) {
      setState(() {
        _answerResult = 'Correct!';
        _score++;
      });
    } else {
      setState(() {
        _answerResult = 'Wrong';
      });
    }

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _answerResult = '';
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
        } else {
          _quizCompleted = true; // Quiz completed
        }
      });
    });
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }

  Widget _buildQuiz() {
    return Container(
      decoration: BoxDecoration(
        color:
            Color.fromARGB(255, 9, 155, 245), // Background color for the quiz
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              _questions[_currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Column(
              children: _questions[_currentQuestionIndex]
                  .options
                  .map(
                    (option) => Container(
                      margin: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_answerResult.isEmpty) {
                            _checkAnswer(option);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            option,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 114, 15, 15),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              _answerResult,
              style: TextStyle(
                fontSize: 24.0,
                color: _answerResult == 'Wrong'
                    ? Colors.red
                    : Color.fromARGB(255, 19, 248, 42),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple, // Background color for the result screen
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'You have completed the quiz.',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your Score: $_score/${_questions.length}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _restartQuiz,
              child: Text('Start New Quiz'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _quizCompleted ? _buildResultScreen() : _buildQuiz(),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question(this.questionText, this.options, this.correctAnswer);
}
