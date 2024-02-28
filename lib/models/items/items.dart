import 'package:hive/hive.dart';
part 'items.g.dart';
@HiveType(typeId: 1)
class Items {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String item;

  @HiveField(2)
  final String quantity;

  Items({required this.item,required this.quantity});
}
