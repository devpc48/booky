import 'package:isar_community/isar.dart';

abstract class IsarRepository<T> {
  final Isar isar;
  final IsarCollection<T> collection;

  IsarRepository(this.isar) : collection = isar.collection<T>();

  Future<List<T>> getAll() {
    return collection.where().findAll();
  }

  Future<T?> getById(int id) {
    return collection.get(id);
  }

  Future<bool> save(T item) async {
    try {
      await isar.writeTxn(() async {
        await collection.put(item);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveAll(List<T> items) async {
    try {
      await isar.writeTxn(() async {
        await collection.putAll(items);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    try {
      await isar.writeTxn(() async {
        await collection.delete(id);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAll(List<int> ids) async {
    try {
      await isar.writeTxn(() async {
        await collection.deleteAll(ids);
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}