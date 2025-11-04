import 'package:isar_community/isar.dart';
import '../models/equipment.dart';
import 'isar_repository.dart';

class EquipmentRepository extends IsarRepository<Equipment> {
  EquipmentRepository(super.isar);

  Future<Equipment?> getByName(String name) async {
    return await isar.equipments.where()
      .nombre_equipoEqualTo(name)
      .findFirst();
  }
  
  Future<List<Equipment>> search(String query) async {
    if (query.isEmpty) {
        return await getAll();
    }
    
    return await isar.equipments.where()
      .filter()
      .nombre_equipoContains(query, caseSensitive: false)
      .findAll();
  }

  Stream<List<Equipment>> watchAll() {
    return isar.equipments.where()
        .watch(fireImmediately: true);
  }
}