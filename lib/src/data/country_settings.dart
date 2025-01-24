part of 'data.dart';

@JsonSerializable(explicitToJson: true)
class CountrySetting {
  final String id;
  final SelectableOptions method;
  final SelectableOptions latitude;
  final SelectableOptions asrMethod;

  CountrySetting({
    required this.id,
    required this.method,
    required this.latitude,
    required this.asrMethod,
  });

  factory CountrySetting.fromJson(Map<String, dynamic> json) =>
      _$CountrySettingFromJson(json);

  Map<String, dynamic> toJson() => _$CountrySettingToJson(this);


  static Future<List<CountrySetting>> getList() async {
    final list = <CountrySetting>[];
    final jsonString = await rootBundle.loadString(
        'packages/${Constants.packageName}/assets/data/country_settings.json');
    final map = jsonDecode(jsonString) as Map<String, dynamic>;
    final dataList = map['data'] as List;
    for (final i in dataList) {
      final item = i as Map<String, dynamic>;
      list.add(CountrySetting.fromJson(item));
    }
    return list;
  }

  static Future<CountrySetting> getByCountryCode(String iso3166_1Alpha2) async {
    final list = await getList();
    for (final data in list) {
      if (data.id == iso3166_1Alpha2) {
        return data;
      }
    }
    throw Exception('No Prayer Settings for the Country');
  }

}
