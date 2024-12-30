// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchResultViewModelHash() =>
    r'0058261ec61032541522aae412d81c7bf0233809';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SearchResultViewModel
    extends BuildlessAutoDisposeAsyncNotifier<SearchResultViewState> {
  late final String words;

  FutureOr<SearchResultViewState> build(
    String words,
  );
}

/// See also [SearchResultViewModel].
@ProviderFor(SearchResultViewModel)
const searchResultViewModelProvider = SearchResultViewModelFamily();

/// See also [SearchResultViewModel].
class SearchResultViewModelFamily
    extends Family<AsyncValue<SearchResultViewState>> {
  /// See also [SearchResultViewModel].
  const SearchResultViewModelFamily();

  /// See also [SearchResultViewModel].
  SearchResultViewModelProvider call(
    String words,
  ) {
    return SearchResultViewModelProvider(
      words,
    );
  }

  @override
  SearchResultViewModelProvider getProviderOverride(
    covariant SearchResultViewModelProvider provider,
  ) {
    return call(
      provider.words,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchResultViewModelProvider';
}

/// See also [SearchResultViewModel].
class SearchResultViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchResultViewModel,
        SearchResultViewState> {
  /// See also [SearchResultViewModel].
  SearchResultViewModelProvider(
    String words,
  ) : this._internal(
          () => SearchResultViewModel()..words = words,
          from: searchResultViewModelProvider,
          name: r'searchResultViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchResultViewModelHash,
          dependencies: SearchResultViewModelFamily._dependencies,
          allTransitiveDependencies:
              SearchResultViewModelFamily._allTransitiveDependencies,
          words: words,
        );

  SearchResultViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.words,
  }) : super.internal();

  final String words;

  @override
  FutureOr<SearchResultViewState> runNotifierBuild(
    covariant SearchResultViewModel notifier,
  ) {
    return notifier.build(
      words,
    );
  }

  @override
  Override overrideWith(SearchResultViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchResultViewModelProvider._internal(
        () => create()..words = words,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        words: words,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchResultViewModel,
      SearchResultViewState> createElement() {
    return _SearchResultViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultViewModelProvider && other.words == words;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, words.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchResultViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<SearchResultViewState> {
  /// The parameter `words` of this provider.
  String get words;
}

class _SearchResultViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchResultViewModel,
        SearchResultViewState> with SearchResultViewModelRef {
  _SearchResultViewModelProviderElement(super.provider);

  @override
  String get words => (origin as SearchResultViewModelProvider).words;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
