import 'package:complete_quiz/controllers/questions_paper/data_uploader.dart';
import 'package:complete_quiz/firebase/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUpLoaderScreen extends StatelessWidget {
  DataUpLoaderScreen({super.key});

  DataUpLoader controller = Get.put(DataUpLoader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            controller.loadingStatus.value == LoadingStatus.completed
                ? "Uploading Completed"
                : "Uploading......",
          ),
        ),
      ),
    );
  }
}
