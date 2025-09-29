import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notely/core/components/app_label.dart';
import 'package:notely/core/routes/app_routes.dart';
import 'package:notely/core/themes/app_colors.dart';
import 'package:notely/features/authentication/data/models/login_request.dart';
import 'package:notely/features/authentication/data/service/authentication_service.dart';
import 'package:notely/generated/locale_keys.g.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
          AppLabel(text: LocaleKeys.common_password.tr()),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            //obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
          children: [
          Spacer(),
          TextButton(
          onPressed: (){
          context.push(AppRoutes.forgotPassword);
          },
          child: Text(LocaleKeys.login_forgot_password.tr()),
          ),
          ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
          onPressed: () async {
          if(_formkey.currentState!.validate()){
            try{
               final isLoggedIn = await service.login(
                LoginRequest(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
              if (isLoggedIn) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Login successful'),
                  backgroundColor: AppColors.green,
                ),
              );
               context.go(AppRoutes.notesScreen);
               }
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
          child: Text(LocaleKeys.login_title.tr()),
          ),
          Spacer(),
          Center(
            child: TextButton(
            onPressed: (){
              context.push(AppRoutes.signUp);
            },
            child: Text(LocaleKeys.login_no_account.tr()),
            ),
          ),
        ],
      ),
    );
  }
}

