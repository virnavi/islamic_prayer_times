part of 'models.dart';

class PrayerTimeCalculationConfig {
  final String asrMethod;
  final String calculationMethod;
  final String latitude;

  final LatLng latLng;
  final String? timeZone;
  final DateTime? dateTime;

  PrayerTimeCalculationConfig({
    required this.asrMethod,
    required this.calculationMethod,
    required this.latitude,
    required this.latLng,
    this.dateTime,
    this.timeZone,
  });
}
