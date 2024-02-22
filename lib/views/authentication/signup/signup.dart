// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rapid_task/viewmodels/application/authentication/authentication_bloc.dart';

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
    Uint8List? image;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(size.width / 16),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('SIGNUP'),
              SizedBox(
                height: size.height / 18,
              ),
              Stack(
                children: [
                  (image != null
                      ? CircleAvatar(
                          radius: 55,
                          backgroundImage: MemoryImage(image),
                        )
                      : const CircleAvatar(
                          radius: 55,backgroundColor: Colors.amber,
                          backgroundImage: AssetImage('assets/images/dp.jpg'),
                        )),
                  Positioned(
                    right: 0,
                    bottom: 0.5,
                    child: IconButton(
                      onPressed: () {
                        addPhoto(context);
                      },
                      icon: const Icon(Icons.camera_alt_sharp),
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Form(
                key: _formKey,
                child: Column(
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
                      height: size.height / 20,
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
                      height: size.height / 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: 'Enter username',
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
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
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                SignUpUser(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                ),
                              );
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
                          // onTap: () => Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const SigninScreen(),
                          //   ),
                          // ),
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
            ],
          ),
        )),
      ),
    );
    
  }

  addPhoto(BuildContext context) async {
    Uint8List pickedFile =
        await pickImage( ImageSource.gallery);
      setState(() {
         Uint8List? image = pickedFile;
      });
    
  }
  
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
  // ignore: avoid_print
  print('No image selected');
}
}
