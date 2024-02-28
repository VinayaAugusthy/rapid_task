import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_task/viewmodels/application/authentication/authentication_bloc.dart';
import 'package:rapid_task/views/authentication/signin/signin.dart';
import 'package:rapid_task/views/widgets/snackbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGNUP'),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width / 16),
        child: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Enter email ',
                  ),
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
                ),
                SizedBox(
                  height: size.height / 18,
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Enter username',
                  ),
                ),
                SizedBox(
                  height: size.height / 18,
                ),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return SizedBox(
                      width: size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (usernameController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                              SignUpUser(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                usernameController.text.trim(),context
                              ),
                            );
                          } else {
                            callSnackBar(
                              msg: 'Please fill all the fields',
                              ctx: context,
                            );
                          }
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
                    const Text("Already have an account ? "),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      ),
                      child: const Text(
                        "Signin",
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
        )),
      ),
    );
  }
}
