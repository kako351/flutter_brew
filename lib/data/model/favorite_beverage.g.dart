// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_beverage.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavoriteBeverageCollection on Isar {
  IsarCollection<FavoriteBeverage> get favoriteBeverages => this.collection();
}

const FavoriteBeverageSchema = CollectionSchema(
  name: r'FavoriteBeverage',
  id: -7854054924169928878,
  properties: {
    r'isFavorite': PropertySchema(
      id: 0,
      name: r'isFavorite',
      type: IsarType.bool,
    )
  },
  estimateSize: _favoriteBeverageEstimateSize,
  serialize: _favoriteBeverageSerialize,
  deserialize: _favoriteBeverageDeserialize,
  deserializeProp: _favoriteBeverageDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _favoriteBeverageGetId,
  getLinks: _favoriteBeverageGetLinks,
  attach: _favoriteBeverageAttach,
  version: '3.1.0+1',
);

int _favoriteBeverageEstimateSize(
  FavoriteBeverage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _favoriteBeverageSerialize(
  FavoriteBeverage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isFavorite);
}

FavoriteBeverage _favoriteBeverageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavoriteBeverage(
    isFavorite: reader.readBool(offsets[0]),
  );
  return object;
}

P _favoriteBeverageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favoriteBeverageGetId(FavoriteBeverage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favoriteBeverageGetLinks(FavoriteBeverage object) {
  return [];
}

void _favoriteBeverageAttach(
    IsarCollection<dynamic> col, Id id, FavoriteBeverage object) {}

extension FavoriteBeverageQueryWhereSort
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QWhere> {
  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FavoriteBeverageQueryWhere
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QWhereClause> {
  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavoriteBeverageQueryFilter
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QFilterCondition> {
  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterFilterCondition>
      isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }
}

extension FavoriteBeverageQueryObject
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QFilterCondition> {}

extension FavoriteBeverageQueryLinks
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QFilterCondition> {}

extension FavoriteBeverageQuerySortBy
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QSortBy> {
  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterSortBy>
      sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterSortBy>
      sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }
}

extension FavoriteBeverageQuerySortThenBy
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QSortThenBy> {
  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterSortBy>
      thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QAfterSortBy>
      thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }
}

extension FavoriteBeverageQueryWhereDistinct
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QDistinct> {
  QueryBuilder<FavoriteBeverage, FavoriteBeverage, QDistinct>
      distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }
}

extension FavoriteBeverageQueryProperty
    on QueryBuilder<FavoriteBeverage, FavoriteBeverage, QQueryProperty> {
  QueryBuilder<FavoriteBeverage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FavoriteBeverage, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }
}
