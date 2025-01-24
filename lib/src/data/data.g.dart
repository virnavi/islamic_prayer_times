// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculationMethod _$CalculationMethodFromJson(Map<String, dynamic> json) =>
    CalculationMethod(
      id: json['id'] as String,
      name: json['name'] as String,
      fajr: json['fajr'] as Map<String, dynamic>,
      maghrib: json['maghrib'] as Map<String, dynamic>,
      isha: json['isha'] as Map<String, dynamic>,
      midnight: json['midnight'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CalculationMethodToJson(CalculationMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fajr': instance.fajr,
      'maghrib': instance.maghrib,
      'isha': instance.isha,
      'midnight': instance.midnight,
    };

CountrySetting _$CountrySettingFromJson(Map<String, dynamic> json) =>
    CountrySetting(
      id: json['id'] as String,
      method:
          SelectableOptions.fromJson(json['method'] as Map<String, dynamic>),
      latitude:
          SelectableOptions.fromJson(json['latitude'] as Map<String, dynamic>),
      asrMethod:
          SelectableOptions.fromJson(json['asrMethod'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountrySettingToJson(CountrySetting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method.toJson(),
      'latitude': instance.latitude.toJson(),
      'asrMethod': instance.asrMethod.toJson(),
    };

SelectableOptions _$SelectableOptionsFromJson(Map<String, dynamic> json) =>
    SelectableOptions(
      defaultSelected: json['default'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SelectableOptionsToJson(SelectableOptions instance) =>
    <String, dynamic>{
      'default': instance.defaultSelected,
      'options': instance.options,
    };
