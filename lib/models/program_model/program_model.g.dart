// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgramModelImpl _$$ProgramModelImplFromJson(Map<String, dynamic> json) =>
    _$ProgramModelImpl(
      channel: json['channel'] as String,
      title: json['title'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ProgramModelImplToJson(_$ProgramModelImpl instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'title': instance.title,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
    };
