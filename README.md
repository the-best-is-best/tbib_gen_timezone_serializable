# Tbib Gen Timezone Serializable

## Setup

Use it for make json serializable support TZDateTime Field

### step 1

- note use flutter_timezone to get Local Timezone

```dart
   String location=FlutterTimezone.getLocalTimezone();
  JsonTimezoneSerializable.init = location;
```

### step 2

- use @JsonTimezoneConverter() above TZDateTime

  ```dart
  @JsonSerializable()
    class GenerateTimezone {
    @JsonTimezoneConverter()
    final TZDateTime timezone;

    GenerateTimezone(this.date, this.timezone);
    factory GenerateTimezone.fromJson(Map<String, dynamic> json) =>
        _$GenerateTimezoneFromJson(json);
    }

  ```

### Note

- don't use timezone.toIso8601String();
- but use timezone.toIso8601();
- in version 0.0.2 can format date
  <a href="https://pub.dev/packages/tbib_timezone_offset"> click here to more details </a>
