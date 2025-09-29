import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notely/core/components/app_label.dart';
import 'package:notely/core/themes/app_assets.dart';
import 'package:notely/features/authentication/presentaion/widgets/header.dart';
import 'package:notely/features/authentication/presentaion/widgets/login/login_form.dart';
import 'package:notely/generated/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
    appBar:AppBar(
    title: SvgPicture.asset(
    AppAssets.logo,

    ),
    ),
    body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 62),
      Center(
        child: Header(
        title: LocaleKeys.login_title.tr(),
        subtitle: LocaleKeys.login_subtitle.tr(),
        ),
      ),
        SizedBox(height: 62),
        Expanded(child: LoginForm()),
      ],
      ),
    ),
    ),
    );
  }
}
