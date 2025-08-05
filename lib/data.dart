import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:it_passport_training_app/feature/core/quiz.dart';

Future<Quiz> getQuizData(int current) async {
  final response = await http.get(
    Uri.parse('https://gothedistance.sakura.ne.jp/it_passport_questions.json'),
  );
  final decodeString = utf8.decode(response.bodyBytes);
  final jsonData = jsonDecode(decodeString);
  final quizList = jsonData.map((e) => Quiz.fromJson(e)).toList();
  return quizList[current - 1];
}
