part of "models.dart";

@JsonSerializable()
class Method {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "method")
  final String method;
  @JsonKey(name: "fajrAngle")
  final double fajrAngle;
  @JsonKey(name: "ishaAngle")
  final double? ishaAngle;
  @JsonKey(name: "ishaInterval")
  final int ishaInterval;
  @JsonKey(name: "maghribAngle")
  final double? maghribAngle;
  @JsonKey(name: "madhab")
  final Madhab madhab;
  @JsonKey(name: "highLatitudeRule")
  final HighLatitudeRule highLatitudeRule;
  @JsonKey(name: "adjustments")
  final Adjustments adjustments;
  @JsonKey(name: "methodAdjustments")
  final Adjustments methodAdjustments;

  Method({
    required this.id,
    required this.method,
    required this.fajrAngle,
    required this.ishaAngle,
    required this.ishaInterval,
    required this.maghribAngle,
    required this.madhab,
    required this.highLatitudeRule,
    required this.adjustments,
    required this.methodAdjustments,
  });

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}
