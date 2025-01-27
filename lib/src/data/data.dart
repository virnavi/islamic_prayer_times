
import 'package:islamic_prayer_times/src/celestial/models/date_time_range.dart';
import 'package:islamic_prayer_times/src/celestial/sun_calc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:islamic_prayer_times/src/models/models.dart';
import 'package:prayers_times/prayers_times.dart' as pt;

import '../celestial/models/lat_lng.dart';
import '../celestial/time_table.dart';
import '../constants.dart';

part 'data.g.dart';
part 'asr_methods.dart';
part 'calculation_method.dart';
part 'country_settings.dart';
part 'latitude.dart';
part 'moon_position.dart';
part 'selectable_option.dart';
part 'sun_position.dart';
part 'prayer_times.dart';