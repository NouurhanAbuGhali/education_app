import 'package:complete_quiz/widgets/common/background_decoration.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  static const String routeName = "/questionsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(child: Center(child: Text("I am here"))),
    );
  }
}
