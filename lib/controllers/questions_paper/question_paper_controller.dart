import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_quiz/controllers/auth_controller.dart';
import 'package:complete_quiz/firebase/references.dart';
import 'package:complete_quiz/models/question_paper_models.dart';
import 'package:complete_quiz/screens/question/question_screen.dart';
import 'package:complete_quiz/services/firebase_storge_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      // for (var img in imgName) {
      //   final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
      //   allPaperImages.add(imgUrl!);}

      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll((paperList));
      ////////////
      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(
          paper.title,
        );
        paper.imageUrl = imgUrl!;
        //allPaperImages.add(imgUrl!);
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      //AppLogger.e(e);
      print(e);
    }
  }

  void navigateToQuestions({
    required QuestionPaperModel paper,
    bool tryAgain = false,
  }) {
    AuthController _authController = Get.find();
    // if (_authController.isLoggedIn()) {
    if (true) {
      if (tryAgain) {
        Get.back();
        //Get.offNames();
      } else {
        print("logged in");
        Get.toNamed(QuestionScreen.routeName, arguments: paper);
        //Get.toNamed();
      }
    } else {
      print("the title is  ${paper.title}");
      _authController.showLoginAlertDialogue();
    }
  }
}
