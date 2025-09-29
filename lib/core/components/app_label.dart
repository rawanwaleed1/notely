import 'package:flutter/material.dart';
import 'package:notely/core/themes/app_colors.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({super.key,required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
    text,
    style:  TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.darkBold,
    ),
    );
  }
}
