import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notely/core/components/app_label.dart';
import 'package:notely/core/routes/app_routes.dart';
import 'package:notely/core/themes/app_colors.dart';
import 'package:notely/features/authentication/data/models/forgot_password_request.dart';
import 'package:notely/features/authentication/data/models/login_request.dart';
import 'package:notely/features/authentication/data/service/authentication_service.dart';
import 'package:notely/generated/locale_keys.g.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final _emailController =TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final service =AuthenticationService();
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLabel(text: LocaleKeys.common_email.tr()),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if(_formkey.currentState!.validate()){
                try{
                   await service.forgotPassword(
                    ForgotPasswordRequest(
                      email: _emailController.text,
                    ),
                  ).whenComplete(() {
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                         content: Text('Please check your email'),
                         backgroundColor: AppColors.green,
                       ),
                     );
                     context.pop();
                   });
                } on FirebaseAuthException catch(e) {
                  ScaffoldMessenger.of(context,).showSnackBar(
                    SnackBar(
                      content: Text(e.message!),
                      backgroundColor: AppColors.red,
                    ),
                  );
                }
              }
            },
            child: Text(LocaleKeys.forgot_password_reset.tr()),
          ),
          Spacer(),
          Center(
            child: TextButton(
              onPressed: (){
                context.pop();
              },
              child: Text(LocaleKeys.forgot_password_backToLogin.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
