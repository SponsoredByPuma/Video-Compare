import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_model.freezed.dart';

@freezed
class LandingModel with _$LandingModel {
  const factory LandingModel({
    required bool lightmode,
    required String currentLanguage,
  }) = _LandingModel;
}
