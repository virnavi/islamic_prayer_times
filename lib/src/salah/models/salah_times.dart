import 'package:flutter/material.dart';

import '../enums/enums.dart';
import '../services/salah_time_calculator.dart';
import 'config/models.dart';

class SalahTimes {
  final DateTimeRange fajr;
  final DateTimeRange dhuhr;
  final DateTimeRange asr;
  final DateTimeRange maghrib;
  final DateTimeRange isha;

  final DateTimeRange witr;
  final DateTimeRange duha;
  final DateTimeRange awwabin;
  final DateTimeRange tahajjud;

  SalahTimes({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.witr,
    required this.duha,
    required this.awwabin,
    required this.tahajjud,
  });

  static Future<SalahTimes> calculate({
    required DateTime date,
    required double latitude,
    required double longitude,
    required SalahCalculationMethod method,
    Madhab? madhab,
  }) async {
    return SalahTimeCalculator.calculate(
      date: date,
      latitude: latitude,
      longitude: longitude,
      method: method,
      madhab: madhab,
    );
  }
}
