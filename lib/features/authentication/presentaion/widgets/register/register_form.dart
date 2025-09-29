import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notely/core/components/app_label.dart';
import 'package:notely/features/authentication/data/models/register_request.dart';
//import 'package:notely/features/authentication/data/models/login_request.dart';
import 'package:notely/features/authentication/data/service/authentication_service.dart';
import 'package:notely/generated/locale_keys.g.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/themes/app_colors.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _nameController =TextEditingController();
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
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
          AppLabel(text: LocaleKeys.register_name.tr()),
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if(_formkey.currentState!.validate()){
                try{
                service
                .register(
                  RegisterRequest(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ).whenComplete((){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Registration successful'),
                      backgroundColor: AppColors.green,
                    ),
                  );
                    context.go(AppRoutes.notesScreen);
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
            child: Text(LocaleKeys.register_create_account.tr()),
          ),
          Spacer(),
          Center(
            child: TextButton(
              onPressed: (){
                context.push(AppRoutes.login);
              },
              child: Text(LocaleKeys.register_no_account.tr()),
            ),
          ),
        ],
      ),
    );
  }
}


