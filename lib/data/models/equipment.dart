import 'package:isar_community/isar.dart';
import 'package:booky/data/models/user.dart';
import 'package:booky/data/models/local.dart';
import 'package:booky/data/models/equipment_type.dart';

part 'equipment.g.dart';

@collection
class Equipment {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String nombre_equipo;
  
  String? descripcion;
  
  @Index(type: IndexType.value)
  late DateTime fecha_creacion;
  
  String? categoria;
  String? logo;
  String? modelo;
  String? numero_serie;

  // Relationships
  final user = IsarLink<User>();
  final local = IsarLink<Local>();
  final tipo_equipo = IsarLink<EquipmentType>();

  @override
  String toString() => nombre_equipo;
}