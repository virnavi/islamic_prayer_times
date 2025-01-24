part of 'models.dart';

class SunnahTimes {
  final DateTimeRange tahajjud ;

  const SunnahTimes({
    required this.tahajjud,
  });

  factory SunnahTimes.calculate(PrayerTimeCalculationConfig config){
    return SunnahTimes(
      tahajjud: DateTimeRange(from: DateTime.now(), to: DateTime.now()),
    );
  }

}
