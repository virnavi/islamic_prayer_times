import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../helper/date_time_helper.dart';
import '../enums/enums.dart';
import '../services/salah_time_calculator.dart';
import 'config/models.dart';

part 'salah_times.g.dart';

@JsonSerializable(explicitToJson: true)
class SalahTimes {
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange fajr;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange dhuhr;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange asr;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange maghrib;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange isha;

  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange witr;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange duha;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
  final DateTimeRange awwabin;
  @JsonKey(
    fromJson: DateTimeHelper.fromRangeJson,
    toJson: DateTimeHelper.toRangeJson,
  )
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
