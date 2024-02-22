part of 'item_bloc.dart';

class ItemEvent {}

class UploadItemsEvent extends ItemEvent {
  final Items items;

  UploadItemsEvent({required this.items});


}

class DeleteItemsEvent extends ItemEvent {
  final int itemId;

  DeleteItemsEvent({required this.itemId});

  
}

class UpdateItemsEvent extends  ItemEvent{
  final int updateId;
  final Items items;

  UpdateItemsEvent({required this.updateId, required this.items});
}