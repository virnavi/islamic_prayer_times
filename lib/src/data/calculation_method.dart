part of 'data.dart';

@JsonSerializable()
class CalculationMethod {
  final String id;
  final String name;
  final Map<String, dynamic> fajr;
  final Map<String, dynamic> maghrib;
  final Map<String, dynamic> isha;
  final Map<String, dynamic> midnight;

  const CalculationMethod({
    required this.id,
    required this.name,
    required this.fajr,
    required this.maghrib,
    required this.isha,
    required this.midnight,
  });

  factory CalculationMethod.fromJson(Map<String, dynamic> json) =>
      _$CalculationMethodFromJson(json);

  Map<String, dynamic> toJson() => _$CalculationMethodToJson(this);

  static Future<List<CalculationMethod>> getList() async {
    final list = <CalculationMethod>[];
    final jsonString = await rootBundle.loadString(
        'packages/${Constants.packageName}/assets/data/calculation_method.json');
    final map = jsonDecode(jsonString) as Map<String, dynamic>;
    final dataList = map['data'] as List;
    for (final i in dataList) {
      final item = i as Map<String, dynamic>;
      list.add(
        CalculationMethod.fromJson(item),
      );
    }
    return list;
  }

  static Future<CalculationMethod> get(String id) async {
    final list = await getList();
    for (final data in list) {
      if (data.id == id) {
        return data;
      }
    }
    throw Exception('No Prayer Calculation Method Found');
  }
}
