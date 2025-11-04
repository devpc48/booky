import 'package:flutter/material.dart';

class LocalFormDialog extends StatefulWidget {
  final String title;
  final String submitLabel;
  final String? initialNombreLocal;
  final String? initialUbicacion;
  final Function(String nombreLocal, String ubicacion) onSubmit;

  const LocalFormDialog({
    super.key,
    required this.title,
    required this.submitLabel,
    required this.onSubmit,
    this.initialNombreLocal,
    this.initialUbicacion,
  });

  @override
  State<LocalFormDialog> createState() => _LocalFormDialogState();
}

class _LocalFormDialogState extends State<LocalFormDialog> {
  late final TextEditingController _nombreLocalController;
  late final TextEditingController _ubicacionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nombreLocalController = TextEditingController(text: widget.initialNombreLocal);
    _ubicacionController = TextEditingController(text: widget.initialUbicacion);
  }

  @override
  void dispose() {
    _nombreLocalController.dispose();
    _ubicacionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nombreLocalController,
              decoration: const InputDecoration(
                labelText: 'Nombre del Local',
                hintText: 'Ingrese el nombre del local',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre del local';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _ubicacionController,
              decoration: const InputDecoration(
                labelText: 'Ubicación',
                hintText: 'Ingrese la ubicación',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la ubicación';
                }
                return null;
              },
            ),
          ],
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
                _nombreLocalController.text,
                _ubicacionController.text,
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