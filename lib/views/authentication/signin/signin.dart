import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_task/viewmodels/application/authentication/authentication_bloc.dart';
import 'package:rapid_task/views/authentication/signup/signup.dart';
import 'package:rapid_task/views/basescreen/base_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width / 16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('SIGNIN'),
                SizedBox(
                  height: size.height / 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Enter email',
                  ),
                  // validator: (value) => validateEmail(value!),
                  // onTap: () {
                  //   setState(() {
                  //     emailTapped = true;
                  //   });
                  // },
                ),
                SizedBox(
                  height: size.height / 18,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Enter password',
                  ),
                  // validator: (value) => validateEmail(value!),
                  // onTap: () {
                  //   setState(() {
                  //     emailTapped = true;
                  //   });
                  // },
                ),
                SizedBox(
                  height: size.height / 18,
                ),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
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
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            SignInUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            ),
                          );
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BaseScreen(),
                              ),
                              (route) => false);
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Do not have an account ? "),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      ),
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
