import 'package:freezed_annotation/freezed_annotation.dart';

part 'beverage_response.freezed.dart';
part 'beverage_response.g.dart';

@freezed
class BeverageResponse with _$BeverageResponse {
  const BeverageResponse._();

  const factory BeverageResponse({
    required String title,
    required String description,
    required List<String> ingredients,
    required String image,
    required int id,
  }) = _BeverageResponse;

  factory BeverageResponse.fromJson(Map<String, dynamic> json) => _$BeverageResponseFromJson(json);
}
