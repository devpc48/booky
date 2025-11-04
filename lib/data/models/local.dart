import 'package:isar_community/isar.dart';
import 'package:booky/data/models/user.dart';
import 'package:booky/data/models/equipment.dart';

part 'local.g.dart';

@collection
class Local {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String nombre_local;
  
  late String ubicacion;

  final users = IsarLinks<User>();
  final equipment = IsarLinks<Equipment>();

  @override
  String toString() => nombre_local;
}