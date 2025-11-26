import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user.dart';
import '../../data/models/local.dart';
import '../../data/models/equipment_type.dart';
import '../../data/models/characteristic.dart';
import '../../providers/providers.dart';

class EquipmentFormDialog extends ConsumerStatefulWidget {
  final String title;
  final String submitLabel;
  final String? initialNombreEquipo;
  final String? initialDescripcion;
  final String? initialCategoria;
  final String? initialLogo;
  final String? initialModelo;
  final String? initialNumeroSerie;
  final User? initialUser;
  final Local? initialLocal;
  final EquipmentType? initialTipoEquipo;
  final List<Characteristic>? initialCharacteristics;
  final Function(
    String nombreEquipo,
    String? descripcion,
    String? categoria,
    String? logo,
    String? modelo,
    String? numeroSerie,
    User? user,
    Local? local,
    EquipmentType? tipoEquipo,
    List<Characteristic> characteristics,
  ) onSubmit;

  const EquipmentFormDialog({
    super.key,
    required this.title,
    required this.submitLabel,
    required this.onSubmit,
    this.initialNombreEquipo,
    this.initialDescripcion,
    this.initialCategoria,
    this.initialLogo,
    this.initialModelo,
    this.initialNumeroSerie,
    this.initialUser,
    this.initialLocal,
    this.initialTipoEquipo,
    this.initialCharacteristics,
  });

  @override
  ConsumerState<EquipmentFormDialog> createState() => _EquipmentFormDialogState();
}

class _EquipmentFormDialogState extends ConsumerState<EquipmentFormDialog> {
  late final TextEditingController _nombreEquipoController;
  late final TextEditingController _descripcionController;
  late final TextEditingController _categoriaController;
  late final TextEditingController _logoController;
  late final TextEditingController _modeloController;
  late final TextEditingController _numeroSerieController;
  User? _selectedUser;
  Local? _selectedLocal;
  EquipmentType? _selectedTipoEquipo;
  late Map<String, String> _characteristicValues;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nombreEquipoController = TextEditingController(text: widget.initialNombreEquipo);
    _descripcionController = TextEditingController(text: widget.initialDescripcion);
    _categoriaController = TextEditingController(text: widget.initialCategoria);
    _logoController = TextEditingController(text: widget.initialLogo);
    _modeloController = TextEditingController(text: widget.initialModelo);
    _numeroSerieController = TextEditingController(text: widget.initialNumeroSerie);
    _selectedUser = widget.initialUser;
    _selectedLocal = widget.initialLocal;
    _selectedTipoEquipo = widget.initialTipoEquipo;
    _characteristicValues = {};
    _initializeCharacteristics();
  }

  void _initializeCharacteristics() {
    if (_selectedTipoEquipo != null) {
      // Create a map from initialCharacteristics for quick lookup
      final initialMap = <String, String>{};
      if (widget.initialCharacteristics != null) {
        for (final char in widget.initialCharacteristics!) {
          initialMap[char.name] = char.value;
        }
      }
      
      // Initialize values from equipment type characteristics
      for (final characteristic in _selectedTipoEquipo!.characteristics) {
        _characteristicValues[characteristic] = initialMap[characteristic] ?? '';
      }
    }
  }

  void _updateCharacteristics(EquipmentType? newType) {
    _characteristicValues.clear();
    if (newType != null) {
      for (final characteristic in newType.characteristics) {
        _characteristicValues[characteristic] = '';
      }
    }
  }

  @override
  void dispose() {
    _nombreEquipoController.dispose();
    _descripcionController.dispose();
    _categoriaController.dispose();
    _logoController.dispose();
    _modeloController.dispose();
    _numeroSerieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(usersStreamProvider);
    final localsAsync = ref.watch(localsStreamProvider);
    final typesAsync = ref.watch(equipmentTypesStreamProvider);

    return AlertDialog(
      title: Text(widget.title),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          maxWidth: double.infinity,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              TextFormField(
                controller: _nombreEquipoController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del Equipo',
                  hintText: 'Ingrese el nombre del equipo',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del equipo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  hintText: 'Ingrese la descripción',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _categoriaController,
                decoration: const InputDecoration(
                  labelText: 'Categoría',
                  hintText: 'Ingrese la categoría',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _logoController,
                decoration: const InputDecoration(
                  labelText: 'Logo',
                  hintText: 'Ingrese la URL del logo',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _modeloController,
                decoration: const InputDecoration(
                  labelText: 'Modelo',
                  hintText: 'Ingrese el modelo',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _numeroSerieController,
                decoration: const InputDecoration(
                  labelText: 'Número de Serie',
                  hintText: 'Ingrese el número de serie',
                ),
              ),
              const SizedBox(height: 16),
              usersAsync.when(
                data: (users) => DropdownButtonFormField<User>(
                  initialValue: _selectedUser,
                  decoration: const InputDecoration(
                    labelText: 'Usuario Responsable',
                  ),
                  items: users.map((user) {
                    return DropdownMenuItem(
                      value: user,
                      child: Text(user.fullname),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedUser = value;
                    });
                  },
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
              const SizedBox(height: 16),
              localsAsync.when(
                data: (locals) => DropdownButtonFormField<Local>(
                  initialValue: _selectedLocal,
                  decoration: const InputDecoration(
                    labelText: 'Local',
                  ),
                  items: locals.map((local) {
                    return DropdownMenuItem(
                      value: local,
                      child: Text(local.nombre_local),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedLocal = value;
                    });
                  },
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
              const SizedBox(height: 16),
              typesAsync.when(
                data: (types) => DropdownButtonFormField<EquipmentType>(
                  initialValue: _selectedTipoEquipo,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Equipo',
                  ),
                  items: types.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTipoEquipo = value;
                      _updateCharacteristics(value);
                    });
                  },
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
              const SizedBox(height: 16),
              if (_selectedTipoEquipo != null && _selectedTipoEquipo!.characteristics.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Características',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ..._selectedTipoEquipo!.characteristics.map((characteristic) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: TextFormField(
                          initialValue: _characteristicValues[characteristic] ?? '',
                          onChanged: (value) {
                            _characteristicValues[characteristic] = value;
                          },
                          decoration: InputDecoration(
                            labelText: characteristic,
                            hintText: 'Ingrese el valor para $characteristic',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
            ],
          ),
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
              // Convert characteristic values to list of Characteristic objects
              final characteristicsList = _characteristicValues.entries
                  .map((entry) {
                    final char = Characteristic();
                    char.name = entry.key;
                    char.value = entry.value;
                    return char;
                  })
                  .toList();
              
              widget.onSubmit(
                _nombreEquipoController.text,
                _descripcionController.text,
                _categoriaController.text,
                _logoController.text,
                _modeloController.text,
                _numeroSerieController.text,
                _selectedUser,
                _selectedLocal,
                _selectedTipoEquipo,
                characteristicsList,
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