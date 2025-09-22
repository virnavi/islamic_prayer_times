part of "models.dart";

@JsonSerializable()
class CountryConfig {
  final List<CountryInfo> ids;
  final ConfigMethod method;
  final ConfigLatitude latitude;
  final ConfigAsrMethod asrMethod;

  CountryConfig({
    required this.ids,
    required this.method,
    required this.latitude,
    required this.asrMethod,
  });

  factory CountryConfig.fromJson(Map<String, dynamic> json) => _$CountryConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CountryConfigToJson(this);
}
