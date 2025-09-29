import 'package:flutter/cupertino.dart';
import 'package:notely/core/themes/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key,required this.title,required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    Text(
    title,
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: AppColors.darkBold,
    ),
    ),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
         // color: AppColors.darkBold,
        ),
        textAlign: TextAlign.center,
      ),
    ],
    );
  }
}
