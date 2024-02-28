// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapid_task/viewmodels/application/item/item_bloc.dart';
import 'package:rapid_task/viewmodels/services/manage_items/manage_items.dart';
import 'package:rapid_task/views/manage_items/update.dart';
import 'package:rapid_task/views/manage_items/upload.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getItems();

    Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: size.width / 16,
              right: size.width / 16,
              top: size.width / 16,
            ),
            child: state.listItems.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (ctx, index) {
                      var data = state.listItems[index];
                      return ListTile(
                        title: Text(data.item),
                        subtitle: Text('Quantity(Kg): ${data.quantity}'),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateItems(
                                        index: index,
                                        items: data,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                                color: Colors.blue),
                            IconButton(
                              onPressed: () {
                                deleteAlert(context, index);
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: state.listItems.length,
                  )
                : const Center(
                    child: Text(
                      'No Items',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UploadItemScreen(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  deleteAlert(BuildContext context, key) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text('Delete data Permanently?'),
        actions: [
          TextButton(
              onPressed: () {
                deleteItems(key, context);
                Navigator.of(context).pop(ctx);
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              )),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(ctx);
            },
            child: const Text('Cancel'),
          )
        ],
      ),
    );
  }
}
