part of 'data.dart';

class PrayerTimes {
  final FardTimes fard;
  final SunnahTimes sunnah;
  final RestrictedTimes restricted;

  PrayerTimes._({
    required this.fard,
    required this.sunnah,
    required this.restricted,
  });

  static Future<PrayerTimes> calculate(
      PrayerTimeCalculationConfig config) async {
    final asrMethod = AsrMethod.get(config.asrMethod);
    final calculationMethod =
        await CalculationMethod.get(config.calculationMethod);
    final latitude = Latitude.get(config.latitude);
    final timeZone = config.timeZone ??
        tzmap.latLngToTimezoneString(
          config.latLng.latitude,
          config.latLng.longitude,
        );
    final dateTime = config.dateTime ?? DateTime.now();
    final timetable = TimeTable.calculate(dateTime, config.latLng);

    // Define the geographical coordinates for the location
    pt.Coordinates coordinates = pt.Coordinates(
      config.latLng.latitude,
      config.latLng.longitude,
    );

    // Specify the calculation parameters for prayer times
    pt.PrayerCalculationParameters params = _getParams(calculationMethod);
    if (config.asrMethod == AsrMethod.hanafi().id) {
      params.madhab = pt.PrayerMadhab.hanafi;
    } else if (config.asrMethod == AsrMethod.shafi().id) {
      params.madhab = pt.PrayerMadhab.shafi;
    }

    // Create a PrayerTimes instance for the specified location
    pt.PrayerTimes prayerTimes = pt.PrayerTimes(
      dateTime: dateTime,
      coordinates: coordinates,
      calculationParameters: params,
      precision: true,
      locationName: timeZone,
    );
    final fard = _getFardTimes(timetable, prayerTimes);
    final restriction = _getRestrictedTimes(timetable, fard);
    final sunnah = _getSunnahTimes(timetable, fard);
    return PrayerTimes._(
      fard: fard,
      sunnah: sunnah,
      restricted: restriction,
    );
  }

  static SunnahTimes _getSunnahTimes(
    TimeTable timetable,
    FardTimes fard,
  ) {
    return SunnahTimes(
      tahajjud: DateTimeRange(
        from: fard.isha.from,
        to: fard.fajr.from.add(const Duration(hours: 23, minutes: 59)),
      ),
    );
  }

  static RestrictedTimes _getRestrictedTimes(
          TimeTable timetable, FardTimes fard) =>
      RestrictedTimes(
        sunrise: timetable.sunrise,
        noon: DateTimeRange(from: timetable.solarNoon, to: fard.dhuhr.from),
        sunset: timetable.sunset,
      );

  static FardTimes _getFardTimes(
      TimeTable timetable, pt.PrayerTimes prayerTimes) {
    final empty = DateTime.fromMillisecondsSinceEpoch(0);

    final fajrStart = prayerTimes.fajrStartTime ?? empty;
    var dhuhrStart = prayerTimes.dhuhrStartTime ?? empty;
    if (!timetable.solarNoon.isBefore(dhuhrStart)) {
      dhuhrStart = timetable.solarNoon.add(const Duration(minutes: 5));
    }
    final asrStart = prayerTimes.asrStartTime ?? empty;
    var maghribStart = prayerTimes.maghribStartTime ?? empty;
    if (!timetable.sunset.to.isBefore(maghribStart)) {
      maghribStart = timetable.sunset.to;
    }
    final ishaStart = prayerTimes.ishaStartTime ?? empty;

    var fajrEnd = timetable.dawn;
    if (prayerTimes.fajrStartTime != null &&
        prayerTimes.fajrEndTime!.isBefore(fajrEnd)) {
      fajrEnd = prayerTimes.fajrEndTime!;
    }
    var dhuhrEnd = prayerTimes.dhuhrEndTime ?? asrStart;
    var asrEnd = timetable.sunset.from;
    if (prayerTimes.asrEndTime != null &&
        prayerTimes.asrEndTime!.isBefore(asrEnd)) {
      asrEnd = prayerTimes.asrEndTime!;
    }
    final maghribEnd = prayerTimes.maghribEndTime ?? ishaStart;
    final ishaEnd =
        prayerTimes.ishaEndTime ?? fajrStart.add(const Duration(hours: 24));

    return FardTimes(
      fajr: DateTimeRange(from: fajrStart, to: fajrEnd),
      dhuhr: DateTimeRange(from: dhuhrStart, to: dhuhrEnd),
      asr: DateTimeRange(from: asrStart, to: asrEnd),
      maghrib: DateTimeRange(from: maghribStart, to: maghribEnd),
      isha: DateTimeRange(from: ishaStart, to: ishaEnd),
    );
  }

  static pt.PrayerCalculationParameters _getParams(CalculationMethod method) {
    String id = method.id;
    if (id == 'MWL') {
      return pt.PrayerCalculationMethod.muslimWorldLeague();
    } else if (id == 'ISNA') {
      return pt.PrayerCalculationMethod.northAmerica();
    } else if (id == 'Egypt') {
      return pt.PrayerCalculationMethod.egyptian();
    } else if (id == 'Makkah') {
      return pt.PrayerCalculationMethod.ummAlQura();
    } else if (id == 'Karachi') {
      return pt.PrayerCalculationMethod.karachi();
    } else if (id == 'Tehran') {
      return pt.PrayerCalculationMethod.tehran();
    } else if (id == 'Jafari') {
      pt.PrayerCalculationParameters params = pt.PrayerCalculationParameters(
        "Jafari",
        method.fajr["type"]["angle"] ?? 16,
        method.isha["type"]["angle"] ?? 14,
        maghribAngle: method.maghrib["type"]["angle"] ?? 4.0,
      );
      // params.methodAdjustments = {'dhuhr': 1};
      // return params;
      throw Exception('Jadri Method not set');
    } else if (id == 'Kuwait') {
      return pt.PrayerCalculationMethod.kuwait();
    } else if (id == 'Gulf') {
      throw Exception('Gulf Method not set');
      //  return pt.PrayerCalculationMethod.dubai();
    } else if (id == 'Karachi') {
      return pt.PrayerCalculationMethod.karachi();
    } else if (id == 'Qatar') {
      return pt.PrayerCalculationMethod.qatar();
    } else if (id == 'Singapore') {
      return pt.PrayerCalculationMethod.singapore();
    } else if (id == 'France') {
      throw Exception('France Method not set');
    } else if (id == 'Türkiye') {
      return pt.PrayerCalculationMethod.turkey();
    } else if (id == 'Russia') {
      throw Exception('Russia Method not set');
    } else if (id == 'Dubai') {
      return pt.PrayerCalculationMethod.dubai();
    } else if (id == 'JAKIM') {
      throw Exception('JAKIM Method not set');
    } else if (id == 'Tunisia') {
      throw Exception('Tunisia Method not set');
    } else if (id == 'Algeria') {
      throw Exception('Tunisia Method not set');
    } else if (id == 'KEMENAG') {
      throw Exception('KEMENAG Method not set');
    } else if (id == 'Morocco') {
      return pt.PrayerCalculationMethod.morocco();
    } else if (id == 'Portugal') {
      throw Exception('Portugal Method not set');
    } else if (id == 'Jordan') {
      throw Exception('Portugal Method not set');
    }

    throw Exception('$id Method not Mapped');
  }
}
