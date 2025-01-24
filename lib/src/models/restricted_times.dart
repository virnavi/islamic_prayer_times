part of 'models.dart';

class RestrictedTimes {
  final DateTimeRange sunrise ;
  final DateTimeRange noon ;
  final DateTimeRange sunset ;

  const RestrictedTimes({
    required this.sunrise,
    required this.noon,
    required this.sunset,
  });


}
