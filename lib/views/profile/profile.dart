import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
      var userData = {};

    return Scaffold(
      appBar: AppBar(),
      body:  SafeArea(
        child:  Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hi ${userData['email']}....'),
            ],
          ),
        ),
      ),
    );
  }
}
