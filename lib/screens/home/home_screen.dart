import 'package:complete_quiz/configs/themes/app_colors.dart';
import 'package:complete_quiz/configs/themes/app_icons.dart';
import 'package:complete_quiz/configs/themes/custem_test_style.dart';
import 'package:complete_quiz/configs/themes/ui_parameter.dart';
import 'package:complete_quiz/controllers/questions_paper/question_paper_controller.dart';
import 'package:complete_quiz/controllers/zoom_drawer_controller.dart';
import 'package:complete_quiz/screens/home/menu_screen.dart';
import 'package:complete_quiz/screens/home/question_card.dart';
import 'package:complete_quiz/widgets/app_circle_button.dart';
import 'package:complete_quiz/widgets/content_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    QuestionPapaerController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (control) {
          return ZoomDrawer(
            borderRadius: 50.0,
            controller: control.zoomDrawerController,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            drawerShadowsBackgroundColor: Colors.white.withOpacity(
              0.5,
            ), //  Background Color
            slideWidth: MediaQuery.of(context).size.width * 0.6,
            menuScreen: MenuScreen(),
            mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              //color: Colors.blueAccent,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobilScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCircleButton(
                            onTap: controller.toogleDrawer,
                            child: Icon(AppIcons.menuLeft),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Icon(AppIcons.peace),
                                Text(
                                  " Hello friend ",
                                  style: detailsText.copyWith(
                                    color: onSurfaceTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "What do you want to learn today ?",
                            style: headerText,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ContentAread(
                          addPadding: false,
                          child: Obx(
                            () => ListView.separated(
                              padding: UIParameters.mobilScreenPadding,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(
                                  model:
                                      _questionPaperController.allpapers[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                    return const SizedBox(height: 20);
                                  },
                              itemCount:
                                  _questionPaperController.allpapers.length,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
