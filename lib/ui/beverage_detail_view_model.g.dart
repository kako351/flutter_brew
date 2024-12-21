// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beverage_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$beverageDetailViewModelHash() =>
    r'980d48b26c0a30c28b6b7ad12778a9085f0e9e7e';

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

  FutureOr<Beverage> build(
    int id,
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
  ) {
    return BeverageDetailViewModelProvider(
      id,
    );
  }

  @override
  BeverageDetailViewModelProvider getProviderOverride(
    covariant BeverageDetailViewModelProvider provider,
  ) {
    return call(
      provider.id,
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
  ) : this._internal(
          () => BeverageDetailViewModel()..id = id,
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
        );

  BeverageDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<Beverage> runNotifierBuild(
    covariant BeverageDetailViewModel notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(BeverageDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: BeverageDetailViewModelProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
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
    return other is BeverageDetailViewModelProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BeverageDetailViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<Beverage> {
  /// The parameter `id` of this provider.
  int get id;
}

class _BeverageDetailViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BeverageDetailViewModel,
        Beverage> with BeverageDetailViewModelRef {
  _BeverageDetailViewModelProviderElement(super.provider);

  @override
  int get id => (origin as BeverageDetailViewModelProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
