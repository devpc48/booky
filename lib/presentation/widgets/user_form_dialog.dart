import 'package:flutter/material.dart';
import '../../data/models/enums.dart';

class UserFormDialog extends StatefulWidget {
  final String title;
  final String submitLabel;
  final String? initialFullname;
  final UserRole? initialRole;
  final String? initialPassword;
  final Function(String fullname, UserRole role, String? password) onSubmit;

  const UserFormDialog({
    super.key,
    required this.title,
    required this.submitLabel,
    required this.onSubmit,
    this.initialFullname,
    this.initialRole,
    this.initialPassword,
  });

  @override
  State<UserFormDialog> createState() => _UserFormDialogState();
}

class _UserFormDialogState extends State<UserFormDialog> {
  late final TextEditingController _fullnameController;
  late UserRole _selectedRole;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fullnameController = TextEditingController(text: widget.initialFullname);
    _selectedRole = widget.initialRole ?? UserRole.observer;
    _passwordController = TextEditingController(text: widget.initialPassword);
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final requiresPassword = _selectedRole.isPasswordRequired;

    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _fullnameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Completo',
                  hintText: 'Ingrese el nombre completo',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre completo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<UserRole>(
                initialValue: _selectedRole,
                decoration: const InputDecoration(
                  labelText: 'Rol',
                ),
                items: UserRole.values.map((role) {
                  return DropdownMenuItem(
                    value: role,
                      child: Text(role.label),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedRole = value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor seleccione un rol';
                  }
                  return null;
                },
              ),
              if (requiresPassword) ...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Ingrese la contraseña',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (requiresPassword && (value == null || value.isEmpty)) {
                      return 'Por favor ingrese una contraseña';
                    }
                    return null;
                  },
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSubmit(
                _fullnameController.text,
                _selectedRole,
                requiresPassword ? _passwordController.text : null,
              );
              Navigator.pop(context);
            }
          },
          child: Text(widget.submitLabel),
        ),
      ],
    );
  }
}