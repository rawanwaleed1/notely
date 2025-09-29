import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notely/features/authentication/data/models/forgot_password_request.dart';
import 'package:notely/features/authentication/data/models/login_request.dart';
import 'package:notely/features/authentication/data/models/register_request.dart';

class AuthenticationService{
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  Future<bool> login(LoginRequest request) async{
    final result = await _auth.signInWithEmailAndPassword(
          email: request.email,
          password: request.password,
      );
      return result.user!= null;
  }
  Future<void> register(RegisterRequest request) async{
      await _auth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      )
      .whenComplete(() async {
        await _createUser(request);
    });
  }

  Future<void> forgotPassword(ForgotPasswordRequest request) async{
      await _auth.sendPasswordResetEmail(email: request.email);
  }

  Future<void> logout() async{
      await _auth.signOut();
  }
  Future<void> _createUser(RegisterRequest request) async {
  final currentUserId = _auth.currentUser?.uid?? '';
  await _database.collection('users').doc(currentUserId).set({
  'name' : request.name,
  'email' : request.email,
  'userId' : currentUserId,
  });
  }
}