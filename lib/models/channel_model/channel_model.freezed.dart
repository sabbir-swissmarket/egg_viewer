// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) {
  return _ChannelModel.fromJson(json);
}

/// @nodoc
mixin _$ChannelModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  List<ProgramModel> get programs => throw _privateConstructorUsedError;

  /// Serializes this ChannelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelModelCopyWith<ChannelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelModelCopyWith<$Res> {
  factory $ChannelModelCopyWith(
          ChannelModel value, $Res Function(ChannelModel) then) =
      _$ChannelModelCopyWithImpl<$Res, ChannelModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String url,
      String icon,
      List<ProgramModel> programs});
}

/// @nodoc
class _$ChannelModelCopyWithImpl<$Res, $Val extends ChannelModel>
    implements $ChannelModelCopyWith<$Res> {
  _$ChannelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? icon = null,
    Object? programs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      programs: null == programs
          ? _value.programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<ProgramModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelModelImplCopyWith<$Res>
    implements $ChannelModelCopyWith<$Res> {
  factory _$$ChannelModelImplCopyWith(
          _$ChannelModelImpl value, $Res Function(_$ChannelModelImpl) then) =
      __$$ChannelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String url,
      String icon,
      List<ProgramModel> programs});
}

/// @nodoc
class __$$ChannelModelImplCopyWithImpl<$Res>
    extends _$ChannelModelCopyWithImpl<$Res, _$ChannelModelImpl>
    implements _$$ChannelModelImplCopyWith<$Res> {
  __$$ChannelModelImplCopyWithImpl(
      _$ChannelModelImpl _value, $Res Function(_$ChannelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? icon = null,
    Object? programs = null,
  }) {
    return _then(_$ChannelModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      programs: null == programs
          ? _value._programs
          : programs // ignore: cast_nullable_to_non_nullable
              as List<ProgramModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelModelImpl implements _ChannelModel {
  const _$ChannelModelImpl(
      {required this.id,
      required this.name,
      required this.url,
      required this.icon,
      required final List<ProgramModel> programs})
      : _programs = programs;

  factory _$ChannelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final String icon;
  final List<ProgramModel> _programs;
  @override
  List<ProgramModel> get programs {
    if (_programs is EqualUnmodifiableListView) return _programs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programs);
  }

  @override
  String toString() {
    return 'ChannelModel(id: $id, name: $name, url: $url, icon: $icon, programs: $programs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._programs, _programs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url, icon,
      const DeepCollectionEquality().hash(_programs));

  /// Create a copy of ChannelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelModelImplCopyWith<_$ChannelModelImpl> get copyWith =>
      __$$ChannelModelImplCopyWithImpl<_$ChannelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelModelImplToJson(
      this,
    );
  }
}

abstract class _ChannelModel implements ChannelModel {
  const factory _ChannelModel(
      {required final String id,
      required final String name,
      required final String url,
      required final String icon,
      required final List<ProgramModel> programs}) = _$ChannelModelImpl;

  factory _ChannelModel.fromJson(Map<String, dynamic> json) =
      _$ChannelModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  String get icon;
  @override
  List<ProgramModel> get programs;

  /// Create a copy of ChannelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelModelImplCopyWith<_$ChannelModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
