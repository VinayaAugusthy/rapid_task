import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_task/models/authentication/user_model.dart';
import 'package:rapid_task/viewmodels/application/authentication/authentication_bloc.dart';
import 'package:rapid_task/viewmodels/services/authentication/auth_service.dart';
import 'package:rapid_task/views/authentication/signin/signin.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FutureBuilder<UserModel>(
            future: authService.getUserDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data;
                return Center(
                  child: Padding(
                    padding:  EdgeInsets.all(size.width/16),
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
                        const SizedBox(
                          height: 10,
                        ),
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return SizedBox(
                              width: size.width,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: () {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(SignOut());
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SigninScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: const Text(
                                  'Logout',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
