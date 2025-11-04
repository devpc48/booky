import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/local.dart';
import '../../providers/providers.dart';
import '../widgets/crud_screen.dart';
import '../widgets/local_form_dialog.dart';

class LocalsScreen extends ConsumerWidget {
  const LocalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localsAsync = ref.watch(localsStreamProvider);

    return localsAsync.when(
      data: (locals) => CrudScreen<Local>(
        title: 'Locales',
        items: locals,
        itemBuilder: (local) => ListTile(
          title: Text(local.nombre_local),
          subtitle: Text(local.ubicacion),
          onTap: () => _showEditDialog(context, ref, local),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDelete(context, ref, local),
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
      builder: (context) => LocalFormDialog(
        title: 'Agregar Local',
        submitLabel: 'Agregar',
        onSubmit: (nombreLocal, ubicacion) async {
          final local = Local()
            ..nombre_local = nombreLocal
            ..ubicacion = ubicacion;

          final repository = ref.read(localRepositoryProvider);
          await repository.save(local);
        },
      ),
    );
  }

  Future<void> _showEditDialog(BuildContext context, WidgetRef ref, Local local) async {
    showDialog(
      context: context,
      builder: (context) => LocalFormDialog(
        title: 'Editar Local',
        submitLabel: 'Guardar',
        initialNombreLocal: local.nombre_local,
        initialUbicacion: local.ubicacion,
        onSubmit: (nombreLocal, ubicacion) async {
          local.nombre_local = nombreLocal;
          local.ubicacion = ubicacion;

          final repository = ref.read(localRepositoryProvider);
          await repository.save(local);
        },
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Local local) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: Text('¿Estás seguro de que deseas eliminar el local ${local.nombre_local}?'),
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
      final repository = ref.read(localRepositoryProvider);
      await repository.delete(local.id);
    }
  }
}