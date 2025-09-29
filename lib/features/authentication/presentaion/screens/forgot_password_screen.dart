import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notely/core/themes/app_assets.dart';
import 'package:notely/features/authentication/presentaion/widgets/forgot/forgot_form.dart';
import 'package:notely/features/authentication/presentaion/widgets/header.dart';
import 'package:notely/generated/locale_keys.g.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  title: LocaleKeys.forgot_password_title.tr(),
                  subtitle: LocaleKeys.forgot_password_subtitle.tr(),
                ),
              ),
              SizedBox(height: 62),
              Expanded(child: ForgotForm()),
            ],
          ),
        ),
      ),
    );
  }
}