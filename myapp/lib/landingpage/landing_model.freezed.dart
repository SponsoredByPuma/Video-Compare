// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'landing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LandingModel {
  bool get lightmode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LandingModelCopyWith<LandingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LandingModelCopyWith<$Res> {
  factory $LandingModelCopyWith(
          LandingModel value, $Res Function(LandingModel) then) =
      _$LandingModelCopyWithImpl<$Res, LandingModel>;
  @useResult
  $Res call({bool lightmode});
}

/// @nodoc
class _$LandingModelCopyWithImpl<$Res, $Val extends LandingModel>
    implements $LandingModelCopyWith<$Res> {
  _$LandingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightmode = null,
  }) {
    return _then(_value.copyWith(
      lightmode: null == lightmode
          ? _value.lightmode
          : lightmode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LandingModelCopyWith<$Res>
    implements $LandingModelCopyWith<$Res> {
  factory _$$_LandingModelCopyWith(
          _$_LandingModel value, $Res Function(_$_LandingModel) then) =
      __$$_LandingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool lightmode});
}

/// @nodoc
class __$$_LandingModelCopyWithImpl<$Res>
    extends _$LandingModelCopyWithImpl<$Res, _$_LandingModel>
    implements _$$_LandingModelCopyWith<$Res> {
  __$$_LandingModelCopyWithImpl(
      _$_LandingModel _value, $Res Function(_$_LandingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightmode = null,
  }) {
    return _then(_$_LandingModel(
      lightmode: null == lightmode
          ? _value.lightmode
          : lightmode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LandingModel implements _LandingModel {
  const _$_LandingModel({required this.lightmode});

  @override
  final bool lightmode;

  @override
  String toString() {
    return 'LandingModel(lightmode: $lightmode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LandingModel &&
            (identical(other.lightmode, lightmode) ||
                other.lightmode == lightmode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lightmode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LandingModelCopyWith<_$_LandingModel> get copyWith =>
      __$$_LandingModelCopyWithImpl<_$_LandingModel>(this, _$identity);
}

abstract class _LandingModel implements LandingModel {
  const factory _LandingModel({required final bool lightmode}) =
      _$_LandingModel;

  @override
  bool get lightmode;
  @override
  @JsonKey(ignore: true)
  _$$_LandingModelCopyWith<_$_LandingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
