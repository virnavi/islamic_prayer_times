import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../helper/date_time_helper.dart';
import 'sun_calculator.dart';

part 'sun_time_table.g.dart';

@JsonSerializable(explicitToJson: true)
class SunTimeTable {
  @JsonKey(
    fromJson: DateTimeHelper.fromJson,
    toJson: DateTimeHelper.toJson,
  )
  final DateTime solarNoon;
  @JsonKey(
    fromJson: DateTimeHelper.fromJson,
    toJson: DateTimeHelper.toJson,
  )
  final DateTime nadir;
  @JsonKey(
    fromJson: DateTimeHelper.fromJson,
    toJson: DateTimeHelper.toJson,
  )
  final DateTime dawn;
  @JsonKey(
    fromJson: DateTimeHelper.fromJson,
    toJson: DateTimeHelper.toJson,
  )
  final DateTime dusk;
  @JsonKey(
    fromJson: DateTimeHelper.fromJson,
    toJson: DateTimeHelper.toJson,
  )
  final DateTime nauticalDawn;
  @JsonKey(
    fromJson: DateTimeHelper.fromJson,
    toJson: DateTimeHelper.toJson,
  )
  final DateTime nauticalDusk;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange night;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange sunrise;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange sunset;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange goldenHour;

  //final DateTimeRange moon;

  const SunTimeTable({
    required this.solarNoon,
    required this.nadir,
    required this.sunrise,
    required this.sunset,
    required this.dawn,
    required this.dusk,
    required this.nauticalDawn,
    required this.nauticalDusk,
    required this.night,
    required this.goldenHour,
    //  required this.moon,
  });

  factory SunTimeTable.calculate({
    required DateTime dateTime,
    required double latitude,
    required double longitude,
  }) {
    final timetable = SunCalculator.getTimes(
      dateTime.toUtc(),
      latitude,
      longitude,
    );
    /*final moonTimetable = SunCalculator.getMoonTimes(
      DateTime.now(),
      latitude,
      longitude,
      inUTC: true,
    );
*/
    final empty = DateTime.fromMillisecondsSinceEpoch(0);
    print(timetable);
    return SunTimeTable(
      solarNoon: timetable['solarNoon'] ?? empty,
      nadir: timetable['nadir'] ?? empty,
      dawn: timetable['dawn'] ?? empty,
      dusk: timetable['dusk'] ?? empty,
      nauticalDawn: timetable['nauticalDawn'] ?? empty,
      nauticalDusk: timetable['nauticalDusk'] ?? empty,
      sunrise: DateTimeRange(
        start: timetable['sunrise'] ?? empty,
        end: timetable['sunriseEnd'] ?? empty,
      ),
      night: DateTimeRange(
        start: timetable['night'] ?? empty,
        end: timetable['nightEnd'] ?? empty,
      ),
      goldenHour: DateTimeRange(
        start: timetable['goldenHour'] ?? empty,
        end: timetable['goldenHourEnd'] ?? empty,
      ),
      sunset: DateTimeRange(
        start: timetable['sunsetStart'] ?? empty,
        end: timetable['sunset'] ?? empty,
      ),
      /* moon: DateTimeRange(
        from: moonTimetable['rise'] ?? empty,
        to: moonTimetable['set'] ?? empty,
      ),*/
    );
  }
}
