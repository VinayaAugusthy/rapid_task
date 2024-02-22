import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rapid_task/models/items/items.dart';
import 'package:rapid_task/viewmodels/application/authentication/authentication_bloc.dart';
import 'package:rapid_task/viewmodels/application/navbar/nav_bar_bloc.dart';
import 'package:rapid_task/views/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_task/views/authentication/signup/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemsAdapter());
  await Hive.openBox<Items>('items');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => NavbarBloc(),
        ),
      ],
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
