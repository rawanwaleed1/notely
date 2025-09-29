// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "app_name": "نوتلي",
  "login": {
    "title": "تسجيل الدخول",
    "subtitle": "مرحبًا بعودتك إلى نوتلي",
    "forgot_password": "هل نسيت كلمة المرور؟",
    "no_account": "ليس لديك حساب؟"
  },
  "common": {
    "email": "عنوان البريد الإلكتروني",
    "password": "كلمة المرور",
    "editProfile": "تحرير الملف الشخصي",
    "logout": "تسجيل الخروج"
  },
  "register": {
    "title": "أنشئ حسابًا مجانيًا",
    "subtitle": "انضم إلى نوتلي مجانًا. أنشئ وشارك ملاحظات غير محدودة مع أصدقائك.",
    "no_account": "هل لديك حساب بالفعل؟",
    "name": "الاسم الكامل",
    "create_account": "إنشاء حساب"
  },
  "forgot_password": {
    "title": "نسيت كلمة المرور",
    "subtitle": "سنرسل لك بريدًا لإعادة تعيين كلمة المرور",
    "reset": "إعادة تعيين",
    "backToLogin": "العودة إلى تسجيل الدخول"
  },
  "notesScreen": {
    "title": "كل الملاحظات",
    "emptyTitle": "انشئ ملاحظة جديدة",
    "emptyDescription": "انشيء ملاحظة عن شيء (مثل تعليقك على التغريفات الحديثة، او تقاريرك السياسية) وشاركها مع العالم.",
    "createNote": "انشاء ملاحظة",
    "editNote": "تحرير الملاحظة"
  }
};
static const Map<String,dynamic> _en = {
  "app_name": "Notely",
  "login": {
    "title": "Login",
    "subtitle": "Welcome back to Notely",
    "forgot_password": "Forgot Password?",
    "no_account": "Don't have an account?"
  },
  "common": {
    "email": "Email Address",
    "password": "Password",
    "editProfile": "Edit Profile",
    "logout": "Logout"
  },
  "register": {
    "title": "Create a free account",
    "subtitle": "Join Notely for free. Create and share unlimited notes with your friends.",
    "no_account": "Already have an account?",
    "name": "Full Name",
    "create_account": "Create Account"
  },
  "forgot_password": {
    "title": "Forgot Password",
    "subtitle": "We will send mail to reset your password",
    "reset": "Reset",
    "backToLogin": "Back to Login"
  },
  "notesScreen": {
    "title": "All Notes",
    "emptyTitle": "Create Your First Note",
    "emptyDescription": "Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.",
    "createNote": "Create A Note",
    "editNote": "Edit Note"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
