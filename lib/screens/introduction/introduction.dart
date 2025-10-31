import 'package:complete_quiz/configs/themes/app_colors.dart';
import 'package:complete_quiz/widgets/app_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 65),
              SizedBox(height: 40),
              const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                ),
                "This is a study app, You can use it as you want . if you understand how it works you would be able to scale it . With this you will master firebase backend and flutter fornt end ",
              ),
              SizedBox(height: 40),
              AppCircleButton(
                child: const Icon(Icons.arrow_forward),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
