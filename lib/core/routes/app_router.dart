import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:notely/core/routes/app_routes.dart';
import 'package:notely/features/authentication/presentaion/screens/forgot_password_screen.dart';
import 'package:notely/features/authentication/presentaion/screens/register_screen.dart';
import 'package:notely/features/note/data/models/note_model.dart';
import 'package:notely/features/note/presentaion/screens/notes_screen.dart';
import 'package:notely/features/note/presentaion/screens/profile_screen.dart';
import 'package:notely/features/note/presentaion/screens/upsert_notes_screen.dart';

import '../../features/authentication/presentaion/screens/login_screen.dart';

class AppRouter {
    static final router = GoRouter(
      routes: [
        GoRoute(
         path: AppRoutes.login,
         builder: (context, state) => LoginScreen(),
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return AppRoutes.notesScreen;
            } else {
              return null;
            }
          },
        ),
        GoRoute(
          path: AppRoutes.signUp,
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          path: AppRoutes.forgotPassword,
          builder: (context, state) => ForgotPasswordScreen(),
        ),
        GoRoute(
          path: AppRoutes.upsertNotesScreen,
          builder:
          (context, state) =>
           UpsertNotesScreen(note: state.extra as NoteModel?),
        ),
        GoRoute(
          path: AppRoutes.notesScreen,
          builder: (context, state) => NotesScreen(),
        ),
        GoRoute(
          path: AppRoutes.profileScreen,
          builder: (context, state) => ProfileScreen(),
        ),
     ],
       initialLocation: AppRoutes.login,
       debugLogDiagnostics: true,
   );
}