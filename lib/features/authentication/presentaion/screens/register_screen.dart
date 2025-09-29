import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notely/core/themes/app_assets.dart';
import 'package:notely/features/authentication/presentaion/widgets/header.dart';
import 'package:notely/features/authentication/presentaion/widgets/register/register_form.dart';
import 'package:notely/generated/locale_keys.g.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  title: LocaleKeys.register_title.tr(),
                  subtitle: LocaleKeys.register_subtitle.tr(),
                ),
              ),
              SizedBox(height: 62),
              Expanded(child: RegisterForm()),
            ],
          ),
        ),
      ),
    );
  }
}