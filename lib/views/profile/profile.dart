import 'package:flutter/material.dart';
import 'package:rapid_task/models/authentication/user_model.dart';
import 'package:rapid_task/viewmodels/services/authentication/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FutureBuilder<UserModel>(
            future: authService.getUserDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data;
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi ${userData!.username}...',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'email: ${userData.email}',
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),

      ),
    );
  }
}
