part of 'data.dart';

class Latitude {
  final String id;
  final String name;

  const Latitude._({
    required this.id,
    required this.name,
  });

  static List<Latitude> get list => [
        Latitude.none(),
        Latitude.midnight(),
        Latitude.one7thOfNight(),
        Latitude.angleBased(),
      ];

  factory Latitude.get(String id) {
    for(final data in list){
      if(data.id == id){
        return data;
      }
    }
    throw Exception('Asr Method not found');
  }

  factory Latitude.none() => const Latitude._(id: 'none', name: 'None');

  factory Latitude.midnight() =>
      const Latitude._(id: 'midnight', name: 'Midnight');

  factory Latitude.one7thOfNight() =>
      const Latitude._(id: 'one7thOfNight', name: 'One-Seventh of the Night');

  factory Latitude.angleBased() =>
      const Latitude._(id: 'angleBased', name: 'Angle-Based Method');
}
