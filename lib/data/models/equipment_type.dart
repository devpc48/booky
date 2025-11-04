import 'package:isar_community/isar.dart';
import 'package:booky/data/models/equipment.dart';

part 'equipment_type.g.dart';

@collection
class EquipmentType {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String type;

  final equipment = IsarLinks<Equipment>();

  @override
  String toString() => type;
}