import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/equipment.dart';
import '../../providers/providers.dart';
import '../widgets/crud_screen.dart';
import '../widgets/equipment_form_dialog.dart';

class EquipmentScreen extends ConsumerWidget {
  const EquipmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipmentAsync = ref.watch(equipmentStreamProvider);

    return equipmentAsync.when(
      data: (equipment) => CrudScreen<Equipment>(
        title: 'Equipos',
        items: equipment,
        itemBuilder: (equip) => ListTile(
          title: Text(equip.nombre_equipo),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categoría: ${equip.categoria ?? 'No especificada'}'),
              Text('Modelo: ${equip.modelo ?? 'No especificado'}'),
              Text('Serie: ${equip.numero_serie ?? 'No especificado'}'),
            ],
          ),
          isThreeLine: true,
          onTap: () => _showEditDialog(context, ref, equip),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDelete(context, ref, equip),
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
      builder: (context) => EquipmentFormDialog(
        title: 'Agregar Equipo',
        submitLabel: 'Agregar',
        onSubmit: (nombreEquipo, descripcion, categoria, logo, modelo, numeroSerie,
            user, local, tipoEquipo, characteristics) async {
          final equipment = Equipment()
            ..nombre_equipo = nombreEquipo
            ..descripcion = descripcion
            ..fecha_creacion = DateTime.now()
            ..categoria = categoria
            ..logo = logo
            ..modelo = modelo
            ..numero_serie = numeroSerie
            ..characteristics = characteristics;

          if (user != null) {
            equipment.user.value = user;
          }
          
          if (local != null) {
            equipment.local.value = local;
          }
          
          if (tipoEquipo != null) {
            equipment.tipo_equipo.value = tipoEquipo;
          }

          final repository = ref.read(equipmentRepositoryProvider);
          await repository.save(equipment);
        },
      ),
    );
  }

  Future<void> _showEditDialog(BuildContext context, WidgetRef ref, Equipment equipment) async {
    showDialog(
      context: context,
      builder: (context) => EquipmentFormDialog(
        title: 'Editar Equipo',
        submitLabel: 'Guardar',
        initialNombreEquipo: equipment.nombre_equipo,
        initialDescripcion: equipment.descripcion,
        initialCategoria: equipment.categoria,
        initialLogo: equipment.logo,
        initialModelo: equipment.modelo,
        initialNumeroSerie: equipment.numero_serie,
        initialUser: equipment.user.value,
        initialLocal: equipment.local.value,
        initialTipoEquipo: equipment.tipo_equipo.value,
        initialCharacteristics: equipment.characteristics,
        onSubmit: (nombreEquipo, descripcion, categoria, logo, modelo, numeroSerie,
            user, local, tipoEquipo, characteristics) async {
          equipment.nombre_equipo = nombreEquipo;
          equipment.descripcion = descripcion;
          equipment.categoria = categoria;
          equipment.logo = logo;
          equipment.modelo = modelo;
          equipment.numero_serie = numeroSerie;
          equipment.characteristics = characteristics;
          equipment.user.value = user;
          equipment.local.value = local;
          equipment.tipo_equipo.value = tipoEquipo;

          final repository = ref.read(equipmentRepositoryProvider);
          await repository.save(equipment);
        },
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Equipment equipment) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: Text('¿Estás seguro de que deseas eliminar el equipo ${equipment.nombre_equipo}?'),
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
      final repository = ref.read(equipmentRepositoryProvider);
      await repository.delete(equipment.id);
    }
  }
}