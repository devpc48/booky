import 'package:isar_community/isar.dart';
import '../models/user.dart';
import 'isar_repository.dart';

class UserRepository extends IsarRepository<User> {
  UserRepository(super.isar);

  Future<User?> getByFullname(String fullname) async {
      return await isar.users.where()
        .fullnameEqualTo(fullname)
        .findFirst();
  }
  
  Future<List<User>> search(String query) async {
    if (query.isEmpty) {
      return getAll();
    }
    
      return await isar.users.where()
        .filter()
        .fullnameContains(query, caseSensitive: false)
        .findAll();
  }

  Stream<List<User>> watchAllUsers() {
      return isar.users.where()
        .watch(fireImmediately: true);
  }
}