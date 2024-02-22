// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:rapid_task/models/items/items.dart';
import 'package:rapid_task/viewmodels/services/manage_items/manage_items.dart';
import 'package:rapid_task/views/widgets/snackbar.dart';

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
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width / 16,
            right: size.width / 16,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  keyboardType: TextInputType.number,
                  controller: quantityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    labelText: 'Enter quantity',
                  ),
                  validator: (value) {
                    if (quantityController.text.isEmpty) {
                      return 'Please fill this field';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: size.height / 18,
                ),
                SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (itemController.text.isEmpty ||
                          quantityController.text.isEmpty) {
                        callSnackBar(msg: 'Please fill all the fields', ctx: context);
                      } else {
                        final item = Items(
                          item: itemController.text.trim(),
                          quantity: quantityController.text.trim(),
                        );
                        uploadItems(item, context);
                        Navigator.of(context).pop();
                        print('success');
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
