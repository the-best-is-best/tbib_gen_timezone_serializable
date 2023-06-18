// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateTimezone _$GenerateTimezoneFromJson(Map<String, dynamic> json) =>
    GenerateTimezone(
      DateTime.parse(json['date'] as String),
      const JsonTimezoneConverter().fromJson(json['timezone'] as String),
    );

Map<String, dynamic> _$GenerateTimezoneToJson(GenerateTimezone instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'timezone': const JsonTimezoneConverter().toJson(instance.timezone),
    };
