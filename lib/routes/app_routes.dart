import 'package:complete_quiz/controllers/questions_paper/question_paper_controller.dart';
import 'package:complete_quiz/controllers/zoom_drawer_controller.dart';
import 'package:complete_quiz/screens/home/home_screen.dart';
import 'package:complete_quiz/screens/introduction/introduction.dart';
import 'package:complete_quiz/screens/login/login_screen.dart';
import 'package:complete_quiz/screens/question/question_screen.dart';
import 'package:complete_quiz/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
    GetPage(name: "/", page: () => SplashScreen()),
    GetPage(
      name: AppIntroductionScreen.routeName,
      page: () => AppIntroductionScreen(),
      // binding: BindingsBuilder(() {
      //   Get.put(QuestionPapaerController());
      // }),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(QuestionPaperController());
        Get.put(MyZoomDrawerController());
      }),
    ),
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
    GetPage(name: QuestionScreen.routeName, page: () => QuestionScreen()),
  ];
}
