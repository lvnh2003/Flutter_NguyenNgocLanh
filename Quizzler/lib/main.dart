import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questionBank = [
    Question('日本はアジアにあります。 (Nhật Bản nằm ở châu Á.)', true),
    Question('犬は「ねこ」と言います。 (Con chó gọi là "neko".)', false),
    Question('さくらは日本の花です。 (Hoa anh đào là loài hoa của Nhật Bản.)', true),
    Question('東京は日本の首都です。 (Tokyo là thủ đô của Nhật Bản.)', true),
    Question('寿司はイタリアの料理です。 (Sushi là món ăn của Ý.)', false),
    Question('漢字は中国から来ました。 (Chữ Kanji có nguồn gốc từ Trung Quốc.)', true),
    Question('日本の通貨はユーロです。 (Đơn vị tiền tệ của Nhật Bản là Euro.)', false),
    Question('富士山は日本で一番高い山です。 (Núi Phú Sĩ là ngọn núi cao nhất Nhật Bản.)', true),
    Question('日本では、右側通行です。 (Ở Nhật Bản, đi bên phải đường.)', false),
    Question('日本の国旗は白と赤です。 (Quốc kỳ của Nhật Bản có màu trắng và đỏ.)', true),
  ];

  int questionIndex = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionBank[questionIndex].questionAnswer;

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      if (questionIndex < questionBank.length - 1) {
        questionIndex++;
      } else {
        // Khi hết câu hỏi, có thể đặt lại trò chơi hoặc hiển thị thông báo
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Hoàn thành!"),
            content: Text("Bạn đã hoàn thành bài quiz."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    questionIndex = 0;
                    scoreKeeper.clear();
                  });
                },
                child: Text("Chơi lại"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questionBank[questionIndex].questionText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text('Đúng', style: TextStyle(fontSize: 20.0, color: Colors.white)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text('Sai', style: TextStyle(fontSize: 20.0, color: Colors.white)),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
