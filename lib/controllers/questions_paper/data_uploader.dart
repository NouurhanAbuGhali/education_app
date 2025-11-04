import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_quiz/firebase/loading_status.dart';
import 'package:complete_quiz/firebase/references.dart';
import 'package:complete_quiz/models/question_paper_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataUpLoader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs; // loading Status is obs

  void uploadData() async {
    // load json file and print path in DataUploader
    loadingStatus.value = LoadingStatus.loading; //0
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(
      Get.context!,
    ).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final paperInAssets = manifestMap.keys
        .where(
          (path) =>
              path.startsWith("assets/DB/papers/") && path.contains(".json"),
        )
        .toList();
    print(paperInAssets);
    print(
      "step number two *****************************************************************",
    );

    List<QuestionPaperModel> questionPapers = [];
    for (var paper in paperInAssets) {
      String StringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(
        QuestionPaperModel.fromJson(json.decode(StringPaperContent)),
      );
      print("done");
      print(StringPaperContent);
    }
    // put the data in fire store
    var batch = fireStore.batch();
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        'title': paper.title,
        'image_url': paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "question_count": paper.questions == null ? 0 : paper.questions!.length,
      });
      for (var questions in paper.questions!) {
        final questionsPath = questionRF(
          paperId: paper.id,
          questionId: questions.id!,
        );
        batch.set(questionsPath, {
          "questions": questions.question,
          "correct_answer": questions.correctAnswer,
        });

        for (var answer in questions.answers!) {
          batch.set(
            questionsPath.collection("answers").doc(answer.identifier),
            {"identifier": answer.identifier, "answer": answer.answer},
          );
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
    print("Item number ${questionPapers[0].id}");
    print("Data is uploading****");
    print(paperInAssets);
  }
}
