import 'package:isar_community/isar.dart';
import '../models/equipment_type.dart';
import 'isar_repository.dart';

class EquipmentTypeRepository extends IsarRepository<EquipmentType> {
  EquipmentTypeRepository(super.isar);

  Future<EquipmentType?> getByType(String type) async {
      return await isar.equipmentTypes.where()
        .typeEqualTo(type)
        .findFirst();
  }
  
  Future<List<EquipmentType>> search(String query) async {
    if (query.isEmpty) {
        return await getAll();
    }
    
      return await isar.equipmentTypes.where()
        .filter()
        .typeContains(query, caseSensitive: false)
        .findAll();
  }

  Stream<List<EquipmentType>> watchAll() {
      return isar.equipmentTypes.where()
        .watch(fireImmediately: true);
  }
}