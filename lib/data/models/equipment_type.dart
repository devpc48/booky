import 'package:isar_community/isar.dart';
import 'package:booky/data/models/equipment.dart';

part 'equipment_type.g.dart';

@collection
class EquipmentType {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String type;

  late List<String> characteristics;

  final equipment = IsarLinks<Equipment>();

  EquipmentType() {
    characteristics = [];
  }

  @override
  String toString() => type;
}