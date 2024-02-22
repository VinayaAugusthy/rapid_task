import 'package:flutter/material.dart';

class UploadItemScreen extends StatelessWidget {
  const UploadItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController itemController = TextEditingController();
    TextEditingController quantityController = TextEditingController();

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: itemController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Enter Item',
                ),
              ),
              SizedBox(
                height: size.height / 18,
              ),
              TextFormField(
                controller: quantityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Enter quantity',
                ),
              ),
              SizedBox(
                height: size.height / 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
