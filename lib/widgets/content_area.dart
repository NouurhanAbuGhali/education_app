import 'package:complete_quiz/configs/themes/app_colors.dart';
import 'package:complete_quiz/configs/themes/ui_parameter.dart';
import 'package:flutter/material.dart';

class ContentAread extends StatelessWidget {
  const ContentAread({super.key, this.addPadding = true, required this.child});

  final bool addPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(color: customScaffoldColor(context)),
        padding: addPadding
            ? EdgeInsets.only(
                top: mobilScreenPadding,
                left: mobilScreenPadding,
                right: mobilScreenPadding,
              )
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
