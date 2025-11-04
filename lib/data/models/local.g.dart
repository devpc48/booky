// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalCollection on Isar {
  IsarCollection<Local> get locals => this.collection();
}

const LocalSchema = CollectionSchema(
  name: r'Local',
  id: 2416625477685656561,
  properties: {
    r'nombre_local': PropertySchema(
      id: 0,
      name: r'nombre_local',
      type: IsarType.string,
    ),
    r'ubicacion': PropertySchema(
      id: 1,
      name: r'ubicacion',
      type: IsarType.string,
    ),
  },

  estimateSize: _localEstimateSize,
  serialize: _localSerialize,
  deserialize: _localDeserialize,
  deserializeProp: _localDeserializeProp,
  idName: r'id',
  indexes: {
    r'nombre_local': IndexSchema(
      id: 3952037556453990651,
      name: r'nombre_local',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nombre_local',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {
    r'users': LinkSchema(
      id: -5626953978141102194,
      name: r'users',
      target: r'User',
      single: false,
    ),
    r'equipment': LinkSchema(
      id: -1115152166343783046,
      name: r'equipment',
      target: r'Equipment',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _localGetId,
  getLinks: _localGetLinks,
  attach: _localAttach,
  version: '3.3.0-dev.3',
);

int _localEstimateSize(
  Local object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nombre_local.length * 3;
  bytesCount += 3 + object.ubicacion.length * 3;
  return bytesCount;
}

void _localSerialize(
  Local object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nombre_local);
  writer.writeString(offsets[1], object.ubicacion);
}

Local _localDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Local();
  object.id = id;
  object.nombre_local = reader.readString(offsets[0]);
  object.ubicacion = reader.readString(offsets[1]);
  return object;
}

P _localDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localGetId(Local object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localGetLinks(Local object) {
  return [object.users, object.equipment];
}

void _localAttach(IsarCollection<dynamic> col, Id id, Local object) {
  object.id = id;
  object.users.attach(col, col.isar.collection<User>(), r'users', id);
  object.equipment.attach(
    col,
    col.isar.collection<Equipment>(),
    r'equipment',
    id,
  );
}

extension LocalQueryWhereSort on QueryBuilder<Local, Local, QWhere> {
  QueryBuilder<Local, Local, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Local, Local, QAfterWhere> anyNombre_local() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nombre_local'),
      );
    });
  }
}

extension LocalQueryWhere on QueryBuilder<Local, Local, QWhereClause> {
  QueryBuilder<Local, Local, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Local, Local, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> idBetween(
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

  QueryBuilder<Local, Local, QAfterWhereClause> nombre_localEqualTo(
    String nombre_local,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'nombre_local',
          value: [nombre_local],
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> nombre_localNotEqualTo(
    String nombre_local,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nombre_local',
                lower: [],
                upper: [nombre_local],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nombre_local',
                lower: [nombre_local],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nombre_local',
                lower: [nombre_local],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'nombre_local',
                lower: [],
                upper: [nombre_local],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> nombre_localGreaterThan(
    String nombre_local, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nombre_local',
          lower: [nombre_local],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> nombre_localLessThan(
    String nombre_local, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nombre_local',
          lower: [],
          upper: [nombre_local],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> nombre_localBetween(
    String lowerNombre_local,
    String upperNombre_local, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nombre_local',
          lower: [lowerNombre_local],
          includeLower: includeLower,
          upper: [upperNombre_local],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> nombre_localStartsWith(
    String Nombre_localPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'nombre_local',
          lower: [Nombre_localPrefix],
          upper: ['$Nombre_localPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> nombre_localIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'nombre_local', value: ['']),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterWhereClause> nombre_localIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'nombre_local',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'nombre_local',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'nombre_local',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'nombre_local',
                upper: [''],
              ),
            );
      }
    });
  }
}

extension LocalQueryFilter on QueryBuilder<Local, Local, QFilterCondition> {
  QueryBuilder<Local, Local, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Local, Local, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Local, Local, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nombre_local',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nombre_local',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nombre_local',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nombre_local',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nombre_local',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nombre_local',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nombre_local',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nombre_local',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nombre_local', value: ''),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> nombre_localIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nombre_local', value: ''),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ubicacion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ubicacion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ubicacion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ubicacion',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'ubicacion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'ubicacion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'ubicacion',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'ubicacion',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ubicacion', value: ''),
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> ubicacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'ubicacion', value: ''),
      );
    });
  }
}

extension LocalQueryObject on QueryBuilder<Local, Local, QFilterCondition> {}

extension LocalQueryLinks on QueryBuilder<Local, Local, QFilterCondition> {
  QueryBuilder<Local, Local, QAfterFilterCondition> users(FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'users');
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> usersLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'users', length, true, length, true);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> usersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'users', 0, true, 0, true);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> usersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'users', 0, false, 999999, true);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> usersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'users', 0, true, length, include);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> usersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'users', length, include, 999999, true);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> usersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'users',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> equipment(
    FilterQuery<Equipment> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'equipment');
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> equipmentLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', length, true, length, true);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> equipmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', 0, true, 0, true);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> equipmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', 0, false, 999999, true);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> equipmentLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', 0, true, length, include);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> equipmentLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', length, include, 999999, true);
    });
  }

  QueryBuilder<Local, Local, QAfterFilterCondition> equipmentLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'equipment',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension LocalQuerySortBy on QueryBuilder<Local, Local, QSortBy> {
  QueryBuilder<Local, Local, QAfterSortBy> sortByNombre_local() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_local', Sort.asc);
    });
  }

  QueryBuilder<Local, Local, QAfterSortBy> sortByNombre_localDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_local', Sort.desc);
    });
  }

  QueryBuilder<Local, Local, QAfterSortBy> sortByUbicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ubicacion', Sort.asc);
    });
  }

  QueryBuilder<Local, Local, QAfterSortBy> sortByUbicacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ubicacion', Sort.desc);
    });
  }
}

extension LocalQuerySortThenBy on QueryBuilder<Local, Local, QSortThenBy> {
  QueryBuilder<Local, Local, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Local, Local, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Local, Local, QAfterSortBy> thenByNombre_local() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_local', Sort.asc);
    });
  }

  QueryBuilder<Local, Local, QAfterSortBy> thenByNombre_localDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_local', Sort.desc);
    });
  }

  QueryBuilder<Local, Local, QAfterSortBy> thenByUbicacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ubicacion', Sort.asc);
    });
  }

  QueryBuilder<Local, Local, QAfterSortBy> thenByUbicacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ubicacion', Sort.desc);
    });
  }
}

extension LocalQueryWhereDistinct on QueryBuilder<Local, Local, QDistinct> {
  QueryBuilder<Local, Local, QDistinct> distinctByNombre_local({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre_local', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Local, Local, QDistinct> distinctByUbicacion({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ubicacion', caseSensitive: caseSensitive);
    });
  }
}

extension LocalQueryProperty on QueryBuilder<Local, Local, QQueryProperty> {
  QueryBuilder<Local, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Local, String, QQueryOperations> nombre_localProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre_local');
    });
  }

  QueryBuilder<Local, String, QQueryOperations> ubicacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ubicacion');
    });
  }
}
