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

  ## Can make date time picker

TBIBDatePickerFormField(
          title: 'Date time picker',
          onSaved: (value) {},
          datePickerStyle: TBIBDatePickerStyle(
            isDateAndTime: true,
            getTime: ({required date}) {
              log('date time is $date');
            },
            initDate: DateTime.now().add(const Duration(days: 5)),
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 10)),
          ),
        ),

### Note

- don't use timezone.toIso8601String();
- but use timezone.toIso8601();
- in version 1.1.0 can format date
  <a href="https://pub.dev/packages/tbib_timezone_offset"> click here to more details </a>
