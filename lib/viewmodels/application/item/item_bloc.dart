import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rapid_task/models/items/items.dart';
import 'package:rapid_task/viewmodels/services/manage_items/manage_items.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial(listItems: itemsList)) {
    on<UploadItemsEvent>((event, emit) {
      itemsList.add(event.items);
      return emit(ItemState(listItems: itemsList));
    });
    on<DeleteItemsEvent>((event, emit) {
      itemsList.removeAt(event.itemId);
      return emit(ItemState(listItems: itemsList));
    });
    on<UpdateItemsEvent>((event, emit) {
      itemsList.removeAt(event.updateId);
      itemsList.insert(event.updateId, event.items);
      return emit(ItemState(listItems: itemsList));
    });
  }
}
