

import 'models/date_time_range.dart';
import 'models/lat_lng.dart';
import 'sun_calc.dart';

class TimeTable {
  final DateTime solarNoon;
  final DateTime nadir;
  final DateTime dawn;
  final DateTime dusk;
  final DateTime nauticalDawn;
  final DateTime nauticalDusk;
  final DateTimeRange night;
  final DateTimeRange sunrise;
  final DateTimeRange sunset;
  final DateTimeRange goldenHour;
  final DateTimeRange moon;

  const TimeTable._({
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
    required this.moon,
  });

  factory TimeTable.calculate(DateTime dateTime, LatLng latLng) {
    final timetable = SunCalc.getTimes(
      dateTime,
      latLng.latitude,
      latLng.longitude,
    );
    final moonTimetable =
        SunCalc.getMoonTimes(DateTime.now(), latLng.latitude, latLng.longitude, inUTC: true);

    final empty = DateTime.fromMillisecondsSinceEpoch(0);
    print(timetable);
    return TimeTable._(
      solarNoon: timetable['solarNoon'] ?? empty,
      nadir: timetable['nadir'] ?? empty,
      dawn: timetable['dawn'] ?? empty,
      dusk: timetable['dusk'] ?? empty,
      nauticalDawn: timetable['nauticalDawn'] ?? empty,
      nauticalDusk: timetable['nauticalDusk'] ?? empty,
      sunrise: DateTimeRange(
        from: timetable['sunrise'] ?? empty,
        to: timetable['sunriseEnd'] ?? empty,
      ),
      night: DateTimeRange(
        from: timetable['night'] ?? empty,
        to: timetable['nightEnd'] ?? empty,
      ),
      goldenHour: DateTimeRange(
        from: timetable['goldenHour'] ?? empty,
        to: timetable['goldenHourEnd'] ?? empty,
      ),
      sunset: DateTimeRange(
        from: timetable['sunsetStart'] ?? empty,
        to: timetable['sunset'] ?? empty,
      ),
      moon: DateTimeRange(
        from: moonTimetable['rise'] ?? empty,
        to: moonTimetable['set'] ?? empty,
      ),
    );
  }
}
