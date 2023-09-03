import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '640710098',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [
    Question(' What is the capital of France?', 'a ) Paris', ['a ) Paris', 'b )London', 'c )Berlin', 'd )Madrid']),
    Question(' What is 2 + 2?', 'c )4', ['a ) 2', 'b )3', 'c )4', '5']),
    Question(' Who wrote "Romeo and Juliet"?', 'c )William Shakespeare', ['a ) Charles Dickens', 'b )Jane Austen', 'c )William Shakespeare', 'd )Leo Tolstoy']),
    Question(' What is  6 + 3?', 'b )9', ['a ) 8', 'b )9', 'c )11', 'd )6']),
    Question(' What is 4+4?', 'a ) 8', ['a ) 8', 'b )10', 'c )20', 'd )5']),
    Question(' www.youtube.com หรือเรียกย่อว่าอะไร', 'b )ยูทูป', ['a ) ยูริ', 'b )ยูทูป', 'c )ยูธูป', 'd )ยูซุ']),
    Question(' แมวสีอะไรดื้อที่สุด', 'd )ทุกสี', ['a ) แมวส้ม', 'b )แมวดำ', 'c )แมวลายสลิด', 'd )ทุกสี']),
    Question(' ชินจังมีชื่อจริงว่าอะไร', 'a ) โนฮาร่า ชินโนสุเกะ', ['a ) โนฮาร่า ชินโนสุเกะ', 'b )โนฮาร่า ฮิโรชิ', 'c )ชินจังคุง', 'd )โนฮาร่า มิซาเอะ']),
    Question(' หมาชินจังชื่อว่าอะไร', 'c )ชิโร่', ['a ) ชิจุง', 'b )ศูนย์', 'c )ชิโร่', 'd )ฮิมาวาริ']),
    Question(' โดเรม่อนชอบกินอะไร', 'a ) โดรายากิ', ['a ) โดรายากิ', 'b )ช็อกโกบี', 'c )ขนมปัง', 'd )ถั่ว']),
    Question(' ชินจังชอบกินอะไร', 'b )ช็อกโกบี', ['a ) โดรายากิ', 'b )ช็อกโกบี', 'c )ขนมปัง', 'd )ถั่ว']),
    Question(' คนอายุ21ปี2566ปีนี้ต้องเกิดพศอะไร', 'b )2545', ['a ) 2546', 'b )2545', 'c )2555', 'd )2540']),
    Question(' โดเรม่อนอยู่อาศัยกับใคร', 'c )โนบิตะ', ['a ) ไจเเอน', 'b )ชินจัง', 'c )โนบิตะ', 'd )โดเรมี่']),
    Question(' ชินจังอายุเท่าไร', 'd )5ขวบ', ['a ) 6ขวบ', 'b )7ขวบ', 'c )4ขวบ', 'd )5ขวบ']),
    Question(' ชินจังชอบการ์ตูนเรื่องอะไร', 'b )หน้ากากแอ็คชั่น', ['a ) หน้ากากแอ็คจัง', 'b )หน้ากากเเอ็คชั่น', 'c )หน้ากากโครตเท่', 'd )หน้ากากปีศาจ']),
    Question(' ชินจังมีแม่ชื่อว่าอะไร', 'd )โนฮาร่า มิซาเอะ', ['a ) โนฮาร่า ชินโนสุเกะ', 'b )โนฮาร่า ฮิโรชิ', 'c )ชินจังคุง', 'd )โนฮาร่า มิซาเอะ']),
    Question(' ชินจังมีพ่อชื่อว่าอะไร', 'b )โนฮาร่า ฮิโรชิ', ['a ) โนฮาร่า ชินโนสุเกะ', 'b )โนฮาร่า ฮิโรชิ', 'c )ชินจังคุง', 'd )โนฮาร่า มิซาเอะ']),
    Question(' ชินจังมีน้องชื่อว่าอะไร', 'c )ฮิมาวาริ', ['a ) โนฮาร่า ชินโนสุเกะ', 'b )โนฮาร่า ฮิโรชิ', 'c )ฮิมาวาริ', 'd )โนฮาร่า มิซาเอะ']),
    Question(' ชินจังอยู่โรงดรียนห้องอะไร', 'b )ห้องทานตะวัน', ['a ) ห้องกุหลาบแดง', 'b )ห้องทานตะวัน', 'c )ห้องมะลิ', 'd )ห้องดอกเข็ม']),
  ];

  String _userAnswer = '';
  String _resultMessage = '';

  void _checkAnswer() {
    if (_userAnswer == _questions[_currentQuestionIndex].answer) {
      setState(() {
        _resultMessage = 'Correct!';
      });
    } else {
      setState(() {
        _resultMessage = 'Incorrect. The correct answer is ${_questions[_currentQuestionIndex].answer}';
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % _questions.length;
      _userAnswer = '';
      _resultMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFC3A0), // สีส้มอ่อน
            Color(0xFFFFAFBD), // สีชมพูอ่อน
            Color(0xFFFFC3A0), // สีส้มอ่อน (ซ้ำ)
            Color(0xFFB9FFA3), // สีเขียวอ่อน
            Color(0xFF8EB2FF), // สีน้ำเงินอ่อน
            Color(0xFFA4A4A4), // สีเทา
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('640710098'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Question ${_currentQuestionIndex + 1}: ' + _questions[_currentQuestionIndex].question,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: _questions[_currentQuestionIndex].options.map((option) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _userAnswer = option;
                            _checkAnswer();
                          });
                        },
                        child: Text(
                          option,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  _resultMessage,
                  style: TextStyle(
                    fontSize: 18,
                    color: _resultMessage == 'Correct!' ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_currentQuestionIndex > 0)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentQuestionIndex = (_currentQuestionIndex - 1) % _questions.length;
                            _userAnswer = '';
                            _resultMessage = '';
                          });
                        },
                        child: Text('Previous Question'),
                      ),
                    if (_currentQuestionIndex < _questions.length - 1)
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text('Next Question'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final String answer;
  final List<String> options;

  Question(this.question, this.answer, this.options);
}
