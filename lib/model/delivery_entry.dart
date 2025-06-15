import 'package:hive_flutter/hive_flutter.dart';
part 'delivery_entry.g.dart';

@HiveType(typeId: 0)
class DeliveryEntry extends HiveObject {
  @HiveField(0)
  DateTime date;
  @HiveField(1)
  Map<String, double> materials;

  DeliveryEntry({required this.date, required this.materials});
}
