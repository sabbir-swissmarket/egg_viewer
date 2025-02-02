// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) {
  return _ProgramModel.fromJson(json);
}

/// @nodoc
mixin _$ProgramModel {
  String get channel => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this ProgramModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgramModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgramModelCopyWith<ProgramModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramModelCopyWith<$Res> {
  factory $ProgramModelCopyWith(
          ProgramModel value, $Res Function(ProgramModel) then) =
      _$ProgramModelCopyWithImpl<$Res, ProgramModel>;
  @useResult
  $Res call(
      {String channel,
      String title,
      String startTime,
      String endTime,
      String description});
}

/// @nodoc
class _$ProgramModelCopyWithImpl<$Res, $Val extends ProgramModel>
    implements $ProgramModelCopyWith<$Res> {
  _$ProgramModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgramModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramModelImplCopyWith<$Res>
    implements $ProgramModelCopyWith<$Res> {
  factory _$$ProgramModelImplCopyWith(
          _$ProgramModelImpl value, $Res Function(_$ProgramModelImpl) then) =
      __$$ProgramModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channel,
      String title,
      String startTime,
      String endTime,
      String description});
}

/// @nodoc
class __$$ProgramModelImplCopyWithImpl<$Res>
    extends _$ProgramModelCopyWithImpl<$Res, _$ProgramModelImpl>
    implements _$$ProgramModelImplCopyWith<$Res> {
  __$$ProgramModelImplCopyWithImpl(
      _$ProgramModelImpl _value, $Res Function(_$ProgramModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgramModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? description = null,
  }) {
    return _then(_$ProgramModelImpl(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramModelImpl implements _ProgramModel {
  const _$ProgramModelImpl(
      {required this.channel,
      required this.title,
      required this.startTime,
      required this.endTime,
      required this.description});

  factory _$ProgramModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramModelImplFromJson(json);

  @override
  final String channel;
  @override
  final String title;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String description;

  @override
  String toString() {
    return 'ProgramModel(channel: $channel, title: $title, startTime: $startTime, endTime: $endTime, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramModelImpl &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, channel, title, startTime, endTime, description);

  /// Create a copy of ProgramModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramModelImplCopyWith<_$ProgramModelImpl> get copyWith =>
      __$$ProgramModelImplCopyWithImpl<_$ProgramModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramModelImplToJson(
      this,
    );
  }
}

abstract class _ProgramModel implements ProgramModel {
  const factory _ProgramModel(
      {required final String channel,
      required final String title,
      required final String startTime,
      required final String endTime,
      required final String description}) = _$ProgramModelImpl;

  factory _ProgramModel.fromJson(Map<String, dynamic> json) =
      _$ProgramModelImpl.fromJson;

  @override
  String get channel;
  @override
  String get title;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get description;

  /// Create a copy of ProgramModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgramModelImplCopyWith<_$ProgramModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
