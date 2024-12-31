// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beverage_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$beverageDetailViewModelHash() =>
    r'6fe99b65facb1da0f321d9a27b3d5e003e781bff';

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

abstract class _$BeverageDetailViewModel
    extends BuildlessAutoDisposeAsyncNotifier<Beverage> {
  late final int id;
  late final BeverageType type;

  FutureOr<Beverage> build(
    int id,
    BeverageType type,
  );
}

/// See also [BeverageDetailViewModel].
@ProviderFor(BeverageDetailViewModel)
const beverageDetailViewModelProvider = BeverageDetailViewModelFamily();

/// See also [BeverageDetailViewModel].
class BeverageDetailViewModelFamily extends Family<AsyncValue<Beverage>> {
  /// See also [BeverageDetailViewModel].
  const BeverageDetailViewModelFamily();

  /// See also [BeverageDetailViewModel].
  BeverageDetailViewModelProvider call(
    int id,
    BeverageType type,
  ) {
    return BeverageDetailViewModelProvider(
      id,
      type,
    );
  }

  @override
  BeverageDetailViewModelProvider getProviderOverride(
    covariant BeverageDetailViewModelProvider provider,
  ) {
    return call(
      provider.id,
      provider.type,
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
  String? get name => r'beverageDetailViewModelProvider';
}

/// See also [BeverageDetailViewModel].
class BeverageDetailViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BeverageDetailViewModel,
        Beverage> {
  /// See also [BeverageDetailViewModel].
  BeverageDetailViewModelProvider(
    int id,
    BeverageType type,
  ) : this._internal(
          () => BeverageDetailViewModel()
            ..id = id
            ..type = type,
          from: beverageDetailViewModelProvider,
          name: r'beverageDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$beverageDetailViewModelHash,
          dependencies: BeverageDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              BeverageDetailViewModelFamily._allTransitiveDependencies,
          id: id,
          type: type,
        );

  BeverageDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.type,
  }) : super.internal();

  final int id;
  final BeverageType type;

  @override
  FutureOr<Beverage> runNotifierBuild(
    covariant BeverageDetailViewModel notifier,
  ) {
    return notifier.build(
      id,
      type,
    );
  }

  @override
  Override overrideWith(BeverageDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: BeverageDetailViewModelProvider._internal(
        () => create()
          ..id = id
          ..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BeverageDetailViewModel, Beverage>
      createElement() {
    return _BeverageDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BeverageDetailViewModelProvider &&
        other.id == id &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BeverageDetailViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<Beverage> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `type` of this provider.
  BeverageType get type;
}

class _BeverageDetailViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BeverageDetailViewModel,
        Beverage> with BeverageDetailViewModelRef {
  _BeverageDetailViewModelProviderElement(super.provider);

  @override
  int get id => (origin as BeverageDetailViewModelProvider).id;
  @override
  BeverageType get type => (origin as BeverageDetailViewModelProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
