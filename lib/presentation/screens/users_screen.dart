import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user.dart';
import '../../providers/providers.dart';
import '../widgets/crud_screen.dart';
import '../widgets/user_form_dialog.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersStreamProvider);

    return usersAsync.when(
      data: (users) => CrudScreen<User>(
        title: 'Usuarios',
        items: users,
        itemBuilder: (user) => ListTile(
          title: Text(user.fullname),
          subtitle: Text('Rol: ${user.role.toString().split('.').last}'),
          onTap: () => _showEditDialog(context, ref, user),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDelete(context, ref, user),
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
        builder: (context) => UserFormDialog(
          title: 'Agregar Usuario',
          submitLabel: 'Agregar',
          onSubmit: (fullname, role, password) async {
            final user = User()
              ..fullname = fullname
              ..role = role
              ..password = password;

            final repository = ref.read(userRepositoryProvider);
            await repository.save(user);
          },
        ),
      );
  }

  Future<void> _showEditDialog(BuildContext context, WidgetRef ref, User user) async {
      showDialog(
        context: context,
        builder: (context) => UserFormDialog(
          title: 'Editar Usuario',
          submitLabel: 'Guardar',
          initialFullname: user.fullname,
          initialRole: user.role,
          initialPassword: user.password,
          onSubmit: (fullname, role, password) async {
            user.fullname = fullname;
            user.role = role;
            user.password = password;

            final repository = ref.read(userRepositoryProvider);
            await repository.save(user);
          },
        ),
      );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, User user) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: Text('¿Estás seguro de que deseas eliminar el usuario ${user.fullname}?'),
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
      final repository = ref.read(userRepositoryProvider);
      await repository.delete(user.id);
    }
  }
}