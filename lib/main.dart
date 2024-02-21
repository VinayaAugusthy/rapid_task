import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rapid_task/viewmodels/application/bloc/authentication_bloc.dart';
import 'package:rapid_task/views/authentication/authentication.dart';
import 'package:rapid_task/views/authentication/signin/signin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthenticationFlowScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
