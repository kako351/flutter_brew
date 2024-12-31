import 'package:flutter/cupertino.dart';

abstract interface class HeroTag {
  ValueKey<String> key;

  HeroTag({required this.key});

  String get tag;
}

class _HeroTagImpl implements HeroTag {
  @override
  ValueKey<String> key;

  _HeroTagImpl({required this.key});

  @override
  String get tag => key.value;
}

class HeroTagBuilder {
  HeroTagBuilder()
    : _key = UniqueKey().toString();

  String _key;

  void setKey(String key) {
    _key = key;
  }

  HeroTag build() {
    return _HeroTagImpl(key: ValueKey(_key));
  }
}
