part of 'item_bloc.dart';

class ItemState {
  final List<Items> listItems;

  ItemState({required this.listItems});
}

final class ItemInitial extends ItemState {
  ItemInitial({required super.listItems});
}
