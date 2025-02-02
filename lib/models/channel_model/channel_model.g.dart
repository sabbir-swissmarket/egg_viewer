// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelModelImpl _$$ChannelModelImplFromJson(Map<String, dynamic> json) =>
    _$ChannelModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      icon: json['icon'] as String,
      programs: (json['programs'] as List<dynamic>)
          .map((e) => ProgramModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChannelModelImplToJson(_$ChannelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'icon': instance.icon,
      'programs': instance.programs,
    };
