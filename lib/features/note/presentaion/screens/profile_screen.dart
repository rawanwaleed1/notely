import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notely/core/routes/app_routes.dart';
import 'package:notely/core/themes/app_assets.dart';
import 'package:notely/features/authentication/data/service/authentication_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final currentUserName =FirebaseAuth.instance.currentUser?.displayName ?? 'Guest';
    return  Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title: SvgPicture.asset(AppAssets.logo),
    ),
    body: SafeArea(
      child: Center(
        child: Column(
        children: [
        const SizedBox(height: 44),
        Image.asset(AppAssets.profile),
          const SizedBox(height: 10),
          Text(
              currentUserName,
              style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
          ),
          const SizedBox(height: 44),
          ListTile(
          leading: Icon(Icons.logout,color: Colors.red,),
          title: const Text(
          'Logout',
          style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          ),
          ),
          onTap: () async {
          await AuthenticationService().logout().whenComplete((){
            context.replace(AppRoutes.login);
          });
          },
          )
        ],
        ),
      ),),
    );

  }
}
