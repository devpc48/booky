// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_type.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEquipmentTypeCollection on Isar {
  IsarCollection<EquipmentType> get equipmentTypes => this.collection();
}

const EquipmentTypeSchema = CollectionSchema(
  name: r'EquipmentType',
  id: -7382036603983751941,
  properties: {
    r'type': PropertySchema(id: 0, name: r'type', type: IsarType.string),
  },

  estimateSize: _equipmentTypeEstimateSize,
  serialize: _equipmentTypeSerialize,
  deserialize: _equipmentTypeDeserialize,
  deserializeProp: _equipmentTypeDeserializeProp,
  idName: r'id',
  indexes: {
    r'type': IndexSchema(
      id: 5117122708147080838,
      name: r'type',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {
    r'equipment': LinkSchema(
      id: 2255735145702368830,
      name: r'equipment',
      target: r'Equipment',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _equipmentTypeGetId,
  getLinks: _equipmentTypeGetLinks,
  attach: _equipmentTypeAttach,
  version: '3.3.0-dev.3',
);

int _equipmentTypeEstimateSize(
  EquipmentType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _equipmentTypeSerialize(
  EquipmentType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.type);
}

EquipmentType _equipmentTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EquipmentType();
  object.id = id;
  object.type = reader.readString(offsets[0]);
  return object;
}

P _equipmentTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _equipmentTypeGetId(EquipmentType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _equipmentTypeGetLinks(EquipmentType object) {
  return [object.equipment];
}

void _equipmentTypeAttach(
  IsarCollection<dynamic> col,
  Id id,
  EquipmentType object,
) {
  object.id = id;
  object.equipment.attach(
    col,
    col.isar.collection<Equipment>(),
    r'equipment',
    id,
  );
}

extension EquipmentTypeQueryWhereSort
    on QueryBuilder<EquipmentType, EquipmentType, QWhere> {
  QueryBuilder<EquipmentType, EquipmentType, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhere> anyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'type'),
      );
    });
  }
}

extension EquipmentTypeQueryWhere
    on QueryBuilder<EquipmentType, EquipmentType, QWhereClause> {
  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> idBetween(
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

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> typeEqualTo(
    String type,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'type', value: [type]),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> typeNotEqualTo(
    String type,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [],
                upper: [type],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [type],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [type],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [],
                upper: [type],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> typeGreaterThan(
    String type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [type],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> typeLessThan(
    String type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [],
          upper: [type],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> typeBetween(
    String lowerType,
    String upperType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [lowerType],
          includeLower: includeLower,
          upper: [upperType],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> typeStartsWith(
    String TypePrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [TypePrefix],
          upper: ['$TypePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'type', value: ['']),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterWhereClause>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'type', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'type', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'type', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'type', upper: ['']),
            );
      }
    });
  }
}

extension EquipmentTypeQueryFilter
    on QueryBuilder<EquipmentType, EquipmentType, QFilterCondition> {
  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition> idBetween(
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

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  typeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  typeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition> typeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'type',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }
}

extension EquipmentTypeQueryObject
    on QueryBuilder<EquipmentType, EquipmentType, QFilterCondition> {}

extension EquipmentTypeQueryLinks
    on QueryBuilder<EquipmentType, EquipmentType, QFilterCondition> {
  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition> equipment(
    FilterQuery<Equipment> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'equipment');
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  equipmentLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', length, true, length, true);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  equipmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', 0, true, 0, true);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  equipmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', 0, false, 999999, true);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  equipmentLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', 0, true, length, include);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  equipmentLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'equipment', length, include, 999999, true);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterFilterCondition>
  equipmentLengthBetween(
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

extension EquipmentTypeQuerySortBy
    on QueryBuilder<EquipmentType, EquipmentType, QSortBy> {
  QueryBuilder<EquipmentType, EquipmentType, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension EquipmentTypeQuerySortThenBy
    on QueryBuilder<EquipmentType, EquipmentType, QSortThenBy> {
  QueryBuilder<EquipmentType, EquipmentType, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<EquipmentType, EquipmentType, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension EquipmentTypeQueryWhereDistinct
    on QueryBuilder<EquipmentType, EquipmentType, QDistinct> {
  QueryBuilder<EquipmentType, EquipmentType, QDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension EquipmentTypeQueryProperty
    on QueryBuilder<EquipmentType, EquipmentType, QQueryProperty> {
  QueryBuilder<EquipmentType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EquipmentType, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
