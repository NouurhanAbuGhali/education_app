import 'package:complete_quiz/configs/themes/app_colors.dart';
import 'package:complete_quiz/configs/themes/ui_parameter.dart';
import 'package:complete_quiz/controllers/zoom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobilScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleCloseDrawer();
                  },
                ),
              ),
              Positioned(
                top: 8,
                left: 2,
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3,
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => controller.user.value == null
                            ? const SizedBox()
                            : Text(
                                controller.user.value!.displayName ?? " ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: onSurfaceTextColor,
                                ),
                              ),
                      ),
                      const Spacer(flex: 1),
                      _DreamButton(
                        icon: Icons.web,
                        label: "website",
                        onPressed: () => controller.website(),
                      ),
                      _DreamButton(
                        icon: Icons.facebook,
                        label: "facebook",
                        onPressed: () => controller.facebook(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: _DreamButton(
                          icon: Icons.email,
                          label: "email",
                          onPressed: () => controller.email(),
                        ),
                      ),
                      const Spacer(flex: 4),
                      _DreamButton(
                        icon: Icons.logout,
                        label: "logout",
                        onPressed: () => controller.signOut(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DreamButton extends StatelessWidget {
  _DreamButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(label),
      icon: Icon(icon, size: 15),
    );
  }
}
