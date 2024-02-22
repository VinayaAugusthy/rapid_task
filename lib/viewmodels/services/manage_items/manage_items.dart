import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rapid_task/models/items/items.dart';
import 'package:rapid_task/viewmodels/application/item/item_bloc.dart';

List<Items> itemsList = [];
getItems() {
  final itemDB = Hive.box<Items>('recipes');
  itemsList.clear();
  itemsList.addAll(itemDB.values);
}
uploadItems(Items items, BuildContext context) {
  final itemBox = Hive.box<Items>('items');
  BlocProvider.of<ItemBloc>(context).add(UploadItemsEvent(items: items));
  itemBox.add(items);
}
deleteItems(int id, BuildContext context) {
  final itemBox = Hive.box<Items>('items');
  BlocProvider.of<ItemBloc>(context).add(DeleteItemsEvent(itemId: id));
  itemBox.deleteAt(id);
}
updateItems(int id, Items items, BuildContext context) {
  final itemBox = Hive.box<Items>('items');
  BlocProvider.of<ItemBloc>(context)
      .add(UpdateItemsEvent(updateId: id, items: items));
  itemBox.putAt(id, items);
}