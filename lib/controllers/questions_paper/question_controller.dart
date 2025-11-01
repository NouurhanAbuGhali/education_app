import 'package:complete_quiz/models/question_paper_models.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  late QuestionPaperModel questionPaperModel;

  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    print(_questionPaper.id);
    loadData(_questionPaper);
    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    try {
      // final QuerySnapshot<Map<String, dynamic>> questionQuery =
      // await questionPageRF.doc(questionPaper.id).collection("question").get();
      // final questions = questionQuery.docs.map((snapshot) =>
      //     Questions.fromSnapshot(snapshot)).toList();
      // questionPaper.questions = questions;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
