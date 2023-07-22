// ignore_for_file: avoid_setters_without_getters

import 'package:json_annotation/json_annotation.dart';
import 'package:tbib_gen_timezone_serializable/src/ext_in_timezone/ext_timezone.dart';
import 'package:tbib_timezone_offset/tbib_timezone_offset.dart';
import 'package:timezone/timezone.dart';

/// use this class to initialize the location
class JsonTimezoneSerializable {
  /// Creates a new [JsonTimezoneSerializable] with the given ["location"].
  const JsonTimezoneSerializable();

  static late String _location;

  /// add your location here
  static set init(String loc) => _location = loc;
}

/// use this annotation to convert json to [TZDateTime] and vice versa
class JsonTimezoneConverter implements JsonConverter<TZDateTime, String> {
  /// Creates a new [JsonTimezoneConverter] with the given ["location"].
  const JsonTimezoneConverter();

  @override
  TZDateTime fromJson(String json) {
    final loc = getLocation(JsonTimezoneSerializable._location);
    return TZDateTime.parse(loc, json);
  }

  @override
  String toJson(TZDateTime json) => json.toIso8601();
}

/// use this annotation to convert json to [TZDateTime] and vice versa
class JsonTimezoneWithOffsetIsoConverter
    implements JsonConverter<TZDateTime, String> {
  /// Creates a new [JsonTimezoneWithOffsetIsoConverter] with the given
  ///  ["location"].
  const JsonTimezoneWithOffsetIsoConverter();

  @override
  TZDateTime fromJson(String json) {
    final loc = getLocation(JsonTimezoneSerializable._location);
    return TZDateTime.parse(loc, json);
  }

  @override
  String toJson(TZDateTime json) => json.toIso8601().toIsoDateTimeLocalString;
}

/// use this annotation to convert json to [TZDateTime] and vice versa
class JsonTimezoneUTCIsoConverter implements JsonConverter<TZDateTime, String> {
  /// Creates a new [JsonTimezoneUTCIsoConverter] with the given ["location"].
  const JsonTimezoneUTCIsoConverter();

  @override
  TZDateTime fromJson(String json) {
    final loc = getLocation(JsonTimezoneSerializable._location);
    return TZDateTime.parse(loc, json);
  }

  @override
  String toJson(TZDateTime json) => json.toIso8601().toIsoDateTimeUTCString;
}
