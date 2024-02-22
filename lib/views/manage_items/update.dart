// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rapid_task/models/items/items.dart';
import 'package:rapid_task/viewmodels/services/manage_items/manage_items.dart';
import 'package:rapid_task/views/basescreen/base_screen.dart';
import 'package:rapid_task/views/home/home.dart';

class UpdateItems extends StatefulWidget {
  UpdateItems({super.key, required this.index, required this.items});

  Items items;
  int index;

  @override
  State<UpdateItems> createState() => _UpdateItemsState();
}

class _UpdateItemsState extends State<UpdateItems> {
  late final itemController = TextEditingController(text: widget.items.item);

  late final quantityController =
      TextEditingController(text: widget.items.quantity);

  Future<void> updateBtnClicked(int index) async {
    final items = Items(
        item: itemController.text.trim(),
        quantity: quantityController.text.trim());
    final itemDB = await Hive.openBox<Items>('items');
    itemDB.putAt(index, items);
    getItems();
  }

  Widget elavatedbtn() {
    return ElevatedButton.icon(
      onPressed: () {
        updateBtnClicked(widget.index);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => const BaseScreen()),
            (route) => false);
      },
      icon: const Icon(Icons.update_rounded),
      label: const Text('Update'),
    );
  }

  Widget textFieldName({
    required TextEditingController myController,
  }) {
    return TextFormField(
      autofocus: false,
      controller: myController,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(234, 236, 238, 2),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget szdBox = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              szdBox,
              textFieldName(myController: itemController),
              szdBox,
              textFieldName(myController: quantityController),
              szdBox,
              elavatedbtn(),
            ],
          ),
        ),
      ),
    );
  }
}
