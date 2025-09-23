import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_prayer_times/islamic_prayer_times.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('SalahTime calculate returns correct prayer times for Dhaka 2025',
      () async {
    final countryConfig = (await CountryConfig.getByCountryCode('bd'));
    var method = await SalahCalculationMethod.getCalculationMethod(
        countryConfig.method.defaultValue);
    method = method.copyWith(
      madhab: countryConfig.asrMethod.defaultValue,
    );
    final salahTimes = await SalahTimes.calculate(
      date: DateTime.utc(2025, 9, 23),
      latitude: 23.777176,
      longitude: 90.399452,
      method: method,
    );
    // Approximate expected times for Dhaka on 2025-09-23
    final fajr = DateTime.utc(2025, 9, 22, 22, 32);
    expect(fajr.difference(salahTimes.fajr.start).inMinutes, closeTo(0, 1));
    final dhuhr = DateTime.utc(2025, 9, 22, 5, 51);
    expect(dhuhr.difference(salahTimes.dhuhr.start).inMinutes, closeTo(0, 1));
    final asr = DateTime.utc(2025, 9, 22, 9, 19);
    expect(asr.difference(salahTimes.asr.start).inMinutes, closeTo(0, 1));
    final maghrib = DateTime.utc(2025, 9, 22, 11, 54);
    expect(
        maghrib.difference(salahTimes.maghrib.start).inMinutes, closeTo(0, 1));
    final isha = DateTime.utc(2025, 9, 22, 13, 9);
    expect(isha.difference(salahTimes.isha.start).inMinutes, closeTo(0, 1));
  });

}
