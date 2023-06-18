import 'package:timezone/timezone.dart';

/// extension for [TZDateTime] to convert to iso8601
extension ExtTZDateTime on TZDateTime {
  /// Converts this [TZDateTime] to an ISO-8601 string.
  String toIso8601({bool iso8601 = true}) {
    var offset = timeZone.offset;

    final y = _fourDigits(year);
    final m = _twoDigits(month);
    final d = _twoDigits(day);
    final sep = iso8601 ? 'T' : ' ';
    final h = _twoDigits(hour);
    final min = _twoDigits(minute);
    final sec = _twoDigits(second);
    final ms = _threeDigits(millisecond);
    final us = microsecond == 0 ? '' : _threeDigits(microsecond);

    if (isUtc) {
      return '$y-$m-$d$sep$h:$min:$sec.$ms:${us}Z';
    } else {
      final offSign = offset.sign >= 0 ? '+' : '-';
      offset = offset.abs() ~/ 1000;
      final offH = _twoDigits(offset ~/ 3600);
      final offM = _twoDigits((offset % 3600) ~/ 60);

      return '$y-$m-$d$sep$h:$min:$sec.$ms$us$offSign$offH:$offM';
    }
  }

  static String _fourDigits(int n) {
    final absN = n.abs();
    final sign = n < 0 ? '-' : '';
    if (absN >= 1000) return '$n';
    if (absN >= 100) return '${sign}0$absN';
    if (absN >= 10) return '${sign}00$absN';
    return '${sign}000$absN';
  }

  static String _threeDigits(int n) {
    if (n >= 100) return '$n';
    if (n >= 10) return '0$n';
    return '00$n';
  }

  static String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}
