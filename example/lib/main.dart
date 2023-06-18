import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';
import 'package:tbib_gen_timezone_serializable/tbib_gen_timezone_serializable.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

part 'main.g.dart';

@JsonSerializable()
class GenerateTimezone {
  final DateTime date;
  @JsonTimezoneConverter()
  final TZDateTime timezone;

  GenerateTimezone(this.date, this.timezone);
  factory GenerateTimezone.fromJson(Map<String, dynamic> json) =>
      _$GenerateTimezoneFromJson(json);
}
// location name Cairo

void main() {
  initializeTimeZones();
  JsonTimezoneSerializable.init('Africa/Cairo');
  final json = {
    "date": "2021-08-01T00:00:00.000Z",
    "timezone": DateTime.now().toIso8601String()
  };
  final generateTimezone = GenerateTimezone.fromJson(json);
  log("origin time: ${DateTime.now().toIso8601String()}");
  log(generateTimezone.timezone.toIso8601());
}
