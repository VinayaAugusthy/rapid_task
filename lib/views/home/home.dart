import 'package:flutter/material.dart';
import 'package:rapid_task/views/manage_items/upload.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(
        left: size.width / 16,
        right: size.width / 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UploadItemScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    )));
  }
}
