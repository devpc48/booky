import 'package:flutter/material.dart';

class EquipmentTypeFormDialog extends StatefulWidget {
  final String title;
  final String submitLabel;
  final String? initialType;
  final List<String>? initialCharacteristics;
  final Function(String type, List<String> characteristics) onSubmit;

  const EquipmentTypeFormDialog({
    super.key,
    required this.title,
    required this.submitLabel,
    required this.onSubmit,
    this.initialType,
    this.initialCharacteristics,
  });

  @override
  State<EquipmentTypeFormDialog> createState() => _EquipmentTypeFormDialogState();
}

class _EquipmentTypeFormDialogState extends State<EquipmentTypeFormDialog> {
  late final TextEditingController _typeController;
  late final TextEditingController _characteristicController;
  late List<String> _characteristics;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _typeController = TextEditingController(text: widget.initialType);
    _characteristicController = TextEditingController();
    _characteristics = List.from(widget.initialCharacteristics ?? []);
  }

  @override
  void dispose() {
    _typeController.dispose();
    _characteristicController.dispose();
    super.dispose();
  }

  void _addCharacteristic() {
    final characteristic = _characteristicController.text.trim();
    if (characteristic.isNotEmpty && !_characteristics.contains(characteristic)) {
      setState(() {
        _characteristics.add(characteristic);
        _characteristicController.clear();
      });
    }
  }

  void _removeCharacteristic(int index) {
    setState(() {
      _characteristics.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
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
              const SizedBox(height: 16),
              Text(
                'Características',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _characteristicController,
                      decoration: const InputDecoration(
                        labelText: 'Nueva característica',
                        hintText: 'Ej: Color, Tamaño, Peso',
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (_) => _addCharacteristic(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    mini: true,
                    onPressed: _addCharacteristic,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (_characteristics.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No hay características agregadas',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                )
              else
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: _characteristics.length,
                    itemBuilder: (context, index) => ListTile(
                      dense: true,
                      title: Text(_characteristics[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, size: 20),
                        onPressed: () => _removeCharacteristic(index),
                      ),
                    ),
                  ),
                ),
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
              widget.onSubmit(_typeController.text, _characteristics);
              Navigator.pop(context);
            }
          },
          child: Text(widget.submitLabel),
        ),
      ],
    );
  }
}
