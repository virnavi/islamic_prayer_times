part of "models.dart";

@JsonSerializable()
class SalahTimeConfig {
  @JsonKey(name: "madhabs")
  final List<Madhab> madhabs;
  @JsonKey(name: "highLatitudeRules")
  final List<HighLatitudeRule> highLatitudeRules;
  @JsonKey(name: "methods")
  final List<Method> methods;
  @JsonKey(name: "config")
  final List<CountryConfig> config;

  SalahTimeConfig({
    required this.madhabs,
    required this.highLatitudeRules,
    required this.methods,
    required this.config,
  });

  factory SalahTimeConfig.fromJson(Map<String, dynamic> json) =>
      _$SalahTimeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SalahTimeConfigToJson(this);
}

