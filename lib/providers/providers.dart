import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:isar_community/isar.dart';
import '../data/models/user.dart';
import '../data/models/local.dart';
import '../data/models/equipment.dart';
import '../data/models/equipment_type.dart';
import '../data/repositories/user_repository.dart';
import '../data/repositories/local_repository.dart';
import '../data/repositories/equipment_type_repository.dart';
import '../data/repositories/equipment_repository.dart';
import '../main.dart';

// Global Isar provider
final isarProvider = Provider<Isar>((ref) => isar);

// Repository providers
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return UserRepository(isar);
});

final localRepositoryProvider = Provider<LocalRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return LocalRepository(isar);
});

final equipmentTypeRepositoryProvider = Provider<EquipmentTypeRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return EquipmentTypeRepository(isar);
});

final equipmentRepositoryProvider = Provider<EquipmentRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return EquipmentRepository(isar);
});

// State providers for selected items
final selectedUserProvider = StateProvider<User?>((ref) => null);
final selectedLocalProvider = StateProvider<Local?>((ref) => null);
final selectedEquipmentTypeProvider = StateProvider<EquipmentType?>((ref) => null);
final selectedEquipmentProvider = StateProvider<Equipment?>((ref) => null);

// Stream providers for watching collections
final usersStreamProvider = StreamProvider<List<User>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.users.where().watch(fireImmediately: true);
});

final localsStreamProvider = StreamProvider<List<Local>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.locals.where().watch(fireImmediately: true);
});

final equipmentTypesStreamProvider = StreamProvider<List<EquipmentType>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.equipmentTypes.where().watch(fireImmediately: true);
});

final equipmentStreamProvider = StreamProvider<List<Equipment>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.equipments.where().watch(fireImmediately: true);
});