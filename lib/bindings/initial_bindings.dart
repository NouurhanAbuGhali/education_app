import 'package:complete_quiz/controllers/auth_controller.dart';
import 'package:complete_quiz/controllers/questions_paper/data_uploader.dart';
import 'package:complete_quiz/controllers/theme_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(DataUpLoader());
  }
}
