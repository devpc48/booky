import 'package:isar_community/isar.dart';
import 'package:booky/data/models/enums.dart';
import 'package:booky/data/models/local.dart';
import 'package:booky/data/models/equipment.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String fullname;

  @enumerated
  late UserRole role;

  String? password;

  final locals = IsarLinks<Local>();
  
  final equipment = IsarLinks<Equipment>();

  @override
  String toString() => fullname;
}