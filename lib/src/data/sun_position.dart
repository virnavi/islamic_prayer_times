part of 'data.dart';

class SunPosition {
  final double azimuth;
  final double altitude;

  const SunPosition._({
    required this.azimuth,
    required this.altitude,
  });

  factory SunPosition.get(DateTime dateTime, LatLng latLng) {
    final data =
        SunCalc.getSunPosition(dateTime, latLng.latitude, latLng.longitude);

    return SunPosition._(
      azimuth: data['azimuth'] ?? 0,
      altitude: data['altitude'] ?? 0,
    );
  }
}
