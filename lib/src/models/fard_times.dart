part of 'models.dart';

class FardTimes {
  final DateTimeRange fajr;
  final DateTimeRange dhuhr;
  final DateTimeRange asr;
  final DateTimeRange maghrib;
  final DateTimeRange isha;

  const FardTimes({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory FardTimes.calculate(PrayerTimeCalculationConfig config){
    return FardTimes(
      fajr: DateTimeRange(from: DateTime.now(), to: DateTime.now()),
      dhuhr: DateTimeRange(from: DateTime.now(), to: DateTime.now()),
      asr: DateTimeRange(from: DateTime.now(), to: DateTime.now()),
      maghrib: DateTimeRange(from: DateTime.now(), to: DateTime.now()),
      isha: DateTimeRange(from: DateTime.now(), to: DateTime.now()),
    );
  }

}
