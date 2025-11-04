import 'package:isar_community/isar.dart';
import '../models/local.dart';
import 'isar_repository.dart';

class LocalRepository extends IsarRepository<Local> {
  LocalRepository(super.isar);

  Future<Local?> getByName(String name) async {
      return await isar.locals.where()
        .nombre_localEqualTo(name)
        .findFirst();
  }
  
  Future<List<Local>> search(String query) async {
    if (query.isEmpty) {
        return await getAll();
    }
    
      return await isar.locals.where()
        .filter()
        .nombre_localContains(query, caseSensitive: false)
        .findAll();
  }

  Stream<List<Local>> watchAll() {
      return isar.locals.where()
        .watch(fireImmediately: true);
  }
}