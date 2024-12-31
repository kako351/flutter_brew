// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSearchHistoryCollection on Isar {
  IsarCollection<SearchHistory> get searchHistorys => this.collection();
}

const SearchHistorySchema = CollectionSchema(
  name: r'SearchHistory',
  id: -4204570823138025228,
  properties: {
    r'query': PropertySchema(
      id: 0,
      name: r'query',
      type: IsarType.string,
    ),
    r'queryWords': PropertySchema(
      id: 1,
      name: r'queryWords',
      type: IsarType.string,
    )
  },
  estimateSize: _searchHistoryEstimateSize,
  serialize: _searchHistorySerialize,
  deserialize: _searchHistoryDeserialize,
  deserializeProp: _searchHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'query': IndexSchema(
      id: -3238105102146786367,
      name: r'query',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'query',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'queryWords': IndexSchema(
      id: 6032178025307930284,
      name: r'queryWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'queryWords',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _searchHistoryGetId,
  getLinks: _searchHistoryGetLinks,
  attach: _searchHistoryAttach,
  version: '3.1.0+1',
);

int _searchHistoryEstimateSize(
  SearchHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.query.length * 3;
  bytesCount += 3 + object.queryWords.length * 3;
  return bytesCount;
}

void _searchHistorySerialize(
  SearchHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.query);
  writer.writeString(offsets[1], object.queryWords);
}

SearchHistory _searchHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SearchHistory();
  object.query = reader.readString(offsets[0]);
  return object;
}

P _searchHistoryDeserializeProp<P>(
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

Id _searchHistoryGetId(SearchHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _searchHistoryGetLinks(SearchHistory object) {
  return [];
}

void _searchHistoryAttach(
    IsarCollection<dynamic> col, Id id, SearchHistory object) {}

extension SearchHistoryByIndex on IsarCollection<SearchHistory> {
  Future<SearchHistory?> getByQuery(String query) {
    return getByIndex(r'query', [query]);
  }

  SearchHistory? getByQuerySync(String query) {
    return getByIndexSync(r'query', [query]);
  }

  Future<bool> deleteByQuery(String query) {
    return deleteByIndex(r'query', [query]);
  }

  bool deleteByQuerySync(String query) {
    return deleteByIndexSync(r'query', [query]);
  }

  Future<List<SearchHistory?>> getAllByQuery(List<String> queryValues) {
    final values = queryValues.map((e) => [e]).toList();
    return getAllByIndex(r'query', values);
  }

  List<SearchHistory?> getAllByQuerySync(List<String> queryValues) {
    final values = queryValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'query', values);
  }

  Future<int> deleteAllByQuery(List<String> queryValues) {
    final values = queryValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'query', values);
  }

  int deleteAllByQuerySync(List<String> queryValues) {
    final values = queryValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'query', values);
  }

  Future<Id> putByQuery(SearchHistory object) {
    return putByIndex(r'query', object);
  }

  Id putByQuerySync(SearchHistory object, {bool saveLinks = true}) {
    return putByIndexSync(r'query', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByQuery(List<SearchHistory> objects) {
    return putAllByIndex(r'query', objects);
  }

  List<Id> putAllByQuerySync(List<SearchHistory> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'query', objects, saveLinks: saveLinks);
  }
}

extension SearchHistoryQueryWhereSort
    on QueryBuilder<SearchHistory, SearchHistory, QWhere> {
  QueryBuilder<SearchHistory, SearchHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhere> anyQueryWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'queryWords'),
      );
    });
  }
}

extension SearchHistoryQueryWhere
    on QueryBuilder<SearchHistory, SearchHistory, QWhereClause> {
  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause> idBetween(
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

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause> queryEqualTo(
      String query) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'query',
        value: [query],
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause> queryNotEqualTo(
      String query) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'query',
              lower: [],
              upper: [query],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'query',
              lower: [query],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'query',
              lower: [query],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'query',
              lower: [],
              upper: [query],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause>
      queryWordsEqualTo(String queryWords) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'queryWords',
        value: [queryWords],
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause>
      queryWordsNotEqualTo(String queryWords) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queryWords',
              lower: [],
              upper: [queryWords],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queryWords',
              lower: [queryWords],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queryWords',
              lower: [queryWords],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queryWords',
              lower: [],
              upper: [queryWords],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause>
      queryWordsGreaterThan(
    String queryWords, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'queryWords',
        lower: [queryWords],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause>
      queryWordsLessThan(
    String queryWords, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'queryWords',
        lower: [],
        upper: [queryWords],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause>
      queryWordsBetween(
    String lowerQueryWords,
    String upperQueryWords, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'queryWords',
        lower: [lowerQueryWords],
        includeLower: includeLower,
        upper: [upperQueryWords],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause>
      queryWordsStartsWith(String QueryWordsPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'queryWords',
        lower: [QueryWordsPrefix],
        upper: ['$QueryWordsPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause>
      queryWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'queryWords',
        value: [''],
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterWhereClause>
      queryWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'queryWords',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'queryWords',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'queryWords',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'queryWords',
              upper: [''],
            ));
      }
    });
  }
}

extension SearchHistoryQueryFilter
    on QueryBuilder<SearchHistory, SearchHistory, QFilterCondition> {
  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
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

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'query',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'query',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'query',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'query',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'query',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'query',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'query',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'query',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'query',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'query',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queryWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'queryWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'queryWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'queryWords',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'queryWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'queryWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'queryWords',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'queryWords',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queryWords',
        value: '',
      ));
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterFilterCondition>
      queryWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'queryWords',
        value: '',
      ));
    });
  }
}

extension SearchHistoryQueryObject
    on QueryBuilder<SearchHistory, SearchHistory, QFilterCondition> {}

extension SearchHistoryQueryLinks
    on QueryBuilder<SearchHistory, SearchHistory, QFilterCondition> {}

extension SearchHistoryQuerySortBy
    on QueryBuilder<SearchHistory, SearchHistory, QSortBy> {
  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy> sortByQuery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'query', Sort.asc);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy> sortByQueryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'query', Sort.desc);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy> sortByQueryWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryWords', Sort.asc);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy>
      sortByQueryWordsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryWords', Sort.desc);
    });
  }
}

extension SearchHistoryQuerySortThenBy
    on QueryBuilder<SearchHistory, SearchHistory, QSortThenBy> {
  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy> thenByQuery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'query', Sort.asc);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy> thenByQueryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'query', Sort.desc);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy> thenByQueryWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryWords', Sort.asc);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QAfterSortBy>
      thenByQueryWordsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryWords', Sort.desc);
    });
  }
}

extension SearchHistoryQueryWhereDistinct
    on QueryBuilder<SearchHistory, SearchHistory, QDistinct> {
  QueryBuilder<SearchHistory, SearchHistory, QDistinct> distinctByQuery(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'query', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SearchHistory, SearchHistory, QDistinct> distinctByQueryWords(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'queryWords', caseSensitive: caseSensitive);
    });
  }
}

extension SearchHistoryQueryProperty
    on QueryBuilder<SearchHistory, SearchHistory, QQueryProperty> {
  QueryBuilder<SearchHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SearchHistory, String, QQueryOperations> queryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'query');
    });
  }

  QueryBuilder<SearchHistory, String, QQueryOperations> queryWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'queryWords');
    });
  }
}
