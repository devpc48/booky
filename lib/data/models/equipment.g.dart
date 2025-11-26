// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEquipmentCollection on Isar {
  IsarCollection<Equipment> get equipments => this.collection();
}

const EquipmentSchema = CollectionSchema(
  name: r'Equipment',
  id: -8369049013398099124,
  properties: {
    r'categoria': PropertySchema(
      id: 0,
      name: r'categoria',
      type: IsarType.string,
    ),
    r'characteristics': PropertySchema(
      id: 1,
      name: r'characteristics',
      type: IsarType.objectList,

      target: r'Characteristic',
    ),
    r'descripcion': PropertySchema(
      id: 2,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'fecha_creacion': PropertySchema(
      id: 3,
      name: r'fecha_creacion',
      type: IsarType.dateTime,
    ),
    r'logo': PropertySchema(id: 4, name: r'logo', type: IsarType.string),
    r'modelo': PropertySchema(id: 5, name: r'modelo', type: IsarType.string),
    r'nombre_equipo': PropertySchema(
      id: 6,
      name: r'nombre_equipo',
      type: IsarType.string,
    ),
    r'numero_serie': PropertySchema(
      id: 7,
      name: r'numero_serie',
      type: IsarType.string,
    ),
  },

  estimateSize: _equipmentEstimateSize,
  serialize: _equipmentSerialize,
  deserialize: _equipmentDeserialize,
  deserializeProp: _equipmentDeserializeProp,
  idName: r'id',
  indexes: {
    r'nombre_equipo': IndexSchema(
      id: -8216944183962785303,
      name: r'nombre_equipo',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nombre_equipo',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'fecha_creacion': IndexSchema(
      id: 6536623734559977604,
      name: r'fecha_creacion',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fecha_creacion',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {
    r'user': LinkSchema(
      id: -2883354981854343306,
      name: r'user',
      target: r'User',
      single: true,
    ),
    r'local': LinkSchema(
      id: -6802173166801730924,
      name: r'local',
      target: r'Local',
      single: true,
    ),
    r'tipo_equipo': LinkSchema(
      id: 2567104638131868954,
      name: r'tipo_equipo',
      target: r'EquipmentType',
      single: true,
    ),
  },
  embeddedSchemas: {r'Characteristic': CharacteristicSchema},

  getId: _equipmentGetId,
  getLinks: _equipmentGetLinks,
  attach: _equipmentAttach,
  version: '3.3.0-dev.3',
);

int _equipmentEstimateSize(
  Equipment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.categoria;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.characteristics.length * 3;
  {
    final offsets = allOffsets[Characteristic]!;
    for (var i = 0; i < object.characteristics.length; i++) {
      final value = object.characteristics[i];
      bytesCount += CharacteristicSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.modelo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre_equipo.length * 3;
  {
    final value = object.numero_serie;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _equipmentSerialize(
  Equipment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoria);
  writer.writeObjectList<Characteristic>(
    offsets[1],
    allOffsets,
    CharacteristicSchema.serialize,
    object.characteristics,
  );
  writer.writeString(offsets[2], object.descripcion);
  writer.writeDateTime(offsets[3], object.fecha_creacion);
  writer.writeString(offsets[4], object.logo);
  writer.writeString(offsets[5], object.modelo);
  writer.writeString(offsets[6], object.nombre_equipo);
  writer.writeString(offsets[7], object.numero_serie);
}

Equipment _equipmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Equipment();
  object.categoria = reader.readStringOrNull(offsets[0]);
  object.characteristics =
      reader.readObjectList<Characteristic>(
        offsets[1],
        CharacteristicSchema.deserialize,
        allOffsets,
        Characteristic(),
      ) ??
      [];
  object.descripcion = reader.readStringOrNull(offsets[2]);
  object.fecha_creacion = reader.readDateTime(offsets[3]);
  object.id = id;
  object.logo = reader.readStringOrNull(offsets[4]);
  object.modelo = reader.readStringOrNull(offsets[5]);
  object.nombre_equipo = reader.readString(offsets[6]);
  object.numero_serie = reader.readStringOrNull(offsets[7]);
  return object;
}

P _equipmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<Characteristic>(
                offset,
                CharacteristicSchema.deserialize,
                allOffsets,
                Characteristic(),
              ) ??
              [])
          as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _equipmentGetId(Equipment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _equipmentGetLinks(Equipment object) {
  return [object.user, object.local, object.tipo_equipo];
}

void _equipmentAttach(IsarCollection<dynamic> col, Id id, Equipment object) {
  object.id = id;
  object.user.attach(col, col.isar.collection<User>(), r'user', id);
  object.local.attach(col, col.isar.collection<Local>(), r'local', id);
  object.tipo_equipo.attach(
    col,
    col.isar.collection<EquipmentType>(),
    r'tipo_equipo',
    id,
  );
}

extension EquipmentQueryWhereSort
    on QueryBuilder<Equipment, Equipment, QWhere> {
  QueryBuilder<Equipment, Equipment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhere> anyNombre_equipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nombre_equipo'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhere> anyFecha_creacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fecha_creacion'),
      );
    });
  }
}

extension EquipmentQueryWhere
    on QueryBuilder<Equipment, Equipment, QWhereClause> {
  QueryBuilder<Equipment, Equipment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> nombre_equipoEqualTo(
    String nombre_equipo,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'nombre_equipo',
          value: [nombre_equipo],
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> nombre_equipoNotEqualTo(
    String nombre_equipo,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nombre_equipo',
                lower: [],
                upper: [nombre_equipo],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nombre_equipo',
                lower: [nombre_equipo],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nombre_equipo',
                lower: [nombre_equipo],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nombre_equipo',
                lower: [],
                upper: [nombre_equipo],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause>
  nombre_equipoGreaterThan(String nombre_equipo, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nombre_equipo',
          lower: [nombre_equipo],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> nombre_equipoLessThan(
    String nombre_equipo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nombre_equipo',
          lower: [],
          upper: [nombre_equipo],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> nombre_equipoBetween(
    String lowerNombre_equipo,
    String upperNombre_equipo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nombre_equipo',
          lower: [lowerNombre_equipo],
          includeLower: includeLower,
          upper: [upperNombre_equipo],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> nombre_equipoStartsWith(
    String Nombre_equipoPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nombre_equipo',
          lower: [Nombre_equipoPrefix],
          upper: ['$Nombre_equipoPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> nombre_equipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'nombre_equipo', value: ['']),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause>
  nombre_equipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'nombre_equipo',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'nombre_equipo',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'nombre_equipo',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'nombre_equipo',
                upper: [''],
              ),
            );
      }
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> fecha_creacionEqualTo(
    DateTime fecha_creacion,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'fecha_creacion',
          value: [fecha_creacion],
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause>
  fecha_creacionNotEqualTo(DateTime fecha_creacion) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'fecha_creacion',
                lower: [],
                upper: [fecha_creacion],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'fecha_creacion',
                lower: [fecha_creacion],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'fecha_creacion',
                lower: [fecha_creacion],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'fecha_creacion',
                lower: [],
                upper: [fecha_creacion],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause>
  fecha_creacionGreaterThan(DateTime fecha_creacion, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'fecha_creacion',
          lower: [fecha_creacion],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> fecha_creacionLessThan(
    DateTime fecha_creacion, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'fecha_creacion',
          lower: [],
          upper: [fecha_creacion],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterWhereClause> fecha_creacionBetween(
    DateTime lowerFecha_creacion,
    DateTime upperFecha_creacion, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'fecha_creacion',
          lower: [lowerFecha_creacion],
          includeLower: includeLower,
          upper: [upperFecha_creacion],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension EquipmentQueryFilter
    on QueryBuilder<Equipment, Equipment, QFilterCondition> {
  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'categoria'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  categoriaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'categoria'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'categoria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  categoriaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'categoria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'categoria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'categoria',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'categoria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'categoria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'categoria',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'categoria',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> categoriaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'categoria', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  categoriaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'categoria', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  characteristicsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'characteristics', length, true, length, true);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  characteristicsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'characteristics', 0, true, 0, true);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  characteristicsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'characteristics', 0, false, 999999, true);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  characteristicsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'characteristics', 0, true, length, include);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  characteristicsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characteristics',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  characteristicsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characteristics',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'descripcion'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'descripcion'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> descripcionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'descripcion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  descripcionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'descripcion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> descripcionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'descripcion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> descripcionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'descripcion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  descripcionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'descripcion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'descripcion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> descripcionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'descripcion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> descripcionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'descripcion',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'descripcion', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'descripcion', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  fecha_creacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fecha_creacion', value: value),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  fecha_creacionGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fecha_creacion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  fecha_creacionLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fecha_creacion',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  fecha_creacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fecha_creacion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'logo'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'logo'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'logo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'logo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'logo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'logo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'logo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'logo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'logo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'logo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'logo', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> logoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'logo', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'modelo'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'modelo'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'modelo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'modelo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'modelo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'modelo', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> modeloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'modelo', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nombre_equipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nombre_equipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nombre_equipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nombre_equipo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nombre_equipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nombre_equipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nombre_equipo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nombre_equipo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nombre_equipo', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  nombre_equipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nombre_equipo', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'numero_serie'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'numero_serie'),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> numero_serieEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'numero_serie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'numero_serie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'numero_serie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> numero_serieBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'numero_serie',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'numero_serie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'numero_serie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'numero_serie',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> numero_serieMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'numero_serie',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'numero_serie', value: ''),
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  numero_serieIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'numero_serie', value: ''),
      );
    });
  }
}

extension EquipmentQueryObject
    on QueryBuilder<Equipment, Equipment, QFilterCondition> {
  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  characteristicsElement(FilterQuery<Characteristic> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'characteristics');
    });
  }
}

extension EquipmentQueryLinks
    on QueryBuilder<Equipment, Equipment, QFilterCondition> {
  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> user(
    FilterQuery<User> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> local(
    FilterQuery<Local> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'local');
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> localIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'local', 0, true, 0, true);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition> tipo_equipo(
    FilterQuery<EquipmentType> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tipo_equipo');
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterFilterCondition>
  tipo_equipoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tipo_equipo', 0, true, 0, true);
    });
  }
}

extension EquipmentQuerySortBy on QueryBuilder<Equipment, Equipment, QSortBy> {
  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByFecha_creacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha_creacion', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByFecha_creacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha_creacion', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByModelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByModeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByNombre_equipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_equipo', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByNombre_equipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_equipo', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByNumero_serie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero_serie', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> sortByNumero_serieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero_serie', Sort.desc);
    });
  }
}

extension EquipmentQuerySortThenBy
    on QueryBuilder<Equipment, Equipment, QSortThenBy> {
  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByCategoria() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByCategoriaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoria', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByFecha_creacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha_creacion', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByFecha_creacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha_creacion', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByModelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByModeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByNombre_equipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_equipo', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByNombre_equipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_equipo', Sort.desc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByNumero_serie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero_serie', Sort.asc);
    });
  }

  QueryBuilder<Equipment, Equipment, QAfterSortBy> thenByNumero_serieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numero_serie', Sort.desc);
    });
  }
}

extension EquipmentQueryWhereDistinct
    on QueryBuilder<Equipment, Equipment, QDistinct> {
  QueryBuilder<Equipment, Equipment, QDistinct> distinctByCategoria({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoria', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Equipment, Equipment, QDistinct> distinctByDescripcion({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Equipment, Equipment, QDistinct> distinctByFecha_creacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha_creacion');
    });
  }

  QueryBuilder<Equipment, Equipment, QDistinct> distinctByLogo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Equipment, Equipment, QDistinct> distinctByModelo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Equipment, Equipment, QDistinct> distinctByNombre_equipo({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'nombre_equipo',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Equipment, Equipment, QDistinct> distinctByNumero_serie({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numero_serie', caseSensitive: caseSensitive);
    });
  }
}

extension EquipmentQueryProperty
    on QueryBuilder<Equipment, Equipment, QQueryProperty> {
  QueryBuilder<Equipment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Equipment, String?, QQueryOperations> categoriaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoria');
    });
  }

  QueryBuilder<Equipment, List<Characteristic>, QQueryOperations>
  characteristicsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characteristics');
    });
  }

  QueryBuilder<Equipment, String?, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<Equipment, DateTime, QQueryOperations> fecha_creacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha_creacion');
    });
  }

  QueryBuilder<Equipment, String?, QQueryOperations> logoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logo');
    });
  }

  QueryBuilder<Equipment, String?, QQueryOperations> modeloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelo');
    });
  }

  QueryBuilder<Equipment, String, QQueryOperations> nombre_equipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre_equipo');
    });
  }

  QueryBuilder<Equipment, String?, QQueryOperations> numero_serieProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numero_serie');
    });
  }
}
