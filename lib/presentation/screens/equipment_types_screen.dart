import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/equipment_type.dart';
import '../../providers/providers.dart';
import '../widgets/crud_screen.dart';
import '../widgets/equipment_type_form_dialog.dart';

class EquipmentTypesScreen extends ConsumerWidget {
  const EquipmentTypesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typesAsync = ref.watch(equipmentTypesStreamProvider);

    return typesAsync.when(
      data: (types) => CrudScreen<EquipmentType>(
        title: 'Tipos de Equipo',
        items: types,
        itemBuilder: (type) => ListTile(
          title: Text(type.type),
          onTap: () => _showEditDialog(context, ref, type),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDelete(context, ref, type),
          ),
        ),
        onAdd: () => _showAddDialog(context, ref),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      builder: (context) => EquipmentTypeFormDialog(
        title: 'Agregar Tipo de Equipo',
        submitLabel: 'Agregar',
        onSubmit: (type) async {
          final equipmentType = EquipmentType()
            ..type = type;

          final repository = ref.read(equipmentTypeRepositoryProvider);
          await repository.save(equipmentType);
        },
      ),
    );
  }

  Future<void> _showEditDialog(BuildContext context, WidgetRef ref, EquipmentType equipmentType) async {
    showDialog(
      context: context,
      builder: (context) => EquipmentTypeFormDialog(
        title: 'Editar Tipo de Equipo',
        submitLabel: 'Guardar',
        initialType: equipmentType.type,
        onSubmit: (type) async {
          equipmentType.type = type;

          final repository = ref.read(equipmentTypeRepositoryProvider);
          await repository.save(equipmentType);
        },
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, EquipmentType equipmentType) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: Text('¿Estás seguro de que deseas eliminar el tipo de equipo ${equipmentType.type}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final repository = ref.read(equipmentTypeRepositoryProvider);
      await repository.delete(equipmentType.id);
    }
  }
}