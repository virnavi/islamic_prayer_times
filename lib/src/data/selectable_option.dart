part of 'data.dart';

@JsonSerializable(explicitToJson: true)
class SelectableOptions {
  @JsonKey(name: 'default')
  final String defaultSelected;
  final List<String> options;

  SelectableOptions({
    required this.defaultSelected,
    required this.options,
  });
  factory SelectableOptions.fromJson(Map<String, dynamic> json) =>
      _$SelectableOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SelectableOptionsToJson(this);


}
