import 'package:complete_quiz/configs/themes/app_colors.dart';
import 'package:complete_quiz/configs/themes/ui_parameter.dart';
import 'package:flutter/material.dart';

TextStyle cartTitle(context) => TextStyle(
  color: UIParameters.isDarkMode()
      ? Theme.of(context).textTheme.bodyLarge!.color
      : Theme.of(context).primaryColor,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const detailsText = TextStyle(fontSize: 12);
const headerText = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: onSurfaceTextColor,
);
