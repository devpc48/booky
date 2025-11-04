import 'package:flutter/material.dart';

class EquipmentTypeFormDialog extends StatefulWidget {
  final String title;
  final String submitLabel;
  final String? initialType;
  final Function(String type) onSubmit;

  const EquipmentTypeFormDialog({
    super.key,
    required this.title,
    required this.submitLabel,
    required this.onSubmit,
    this.initialType,
  });

  @override
  State<EquipmentTypeFormDialog> createState() => _EquipmentTypeFormDialogState();
}

class _EquipmentTypeFormDialogState extends State<EquipmentTypeFormDialog> {
  late final TextEditingController _typeController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _typeController = TextEditingController(text: widget.initialType);
  }

  @override
  void dispose() {
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _typeController,
          decoration: const InputDecoration(
            labelText: 'Tipo de Equipo',
            hintText: 'Ingrese el tipo de equipo',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese el tipo de equipo';
            }
            return null;
          },
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
              widget.onSubmit(_typeController.text);
              Navigator.pop(context);
            }
          },
          child: Text(widget.submitLabel),
        ),
      ],
    );
  }
}