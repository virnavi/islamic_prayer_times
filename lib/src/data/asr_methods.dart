part of 'data.dart';

class AsrMethod extends Equatable {
  final String id;
  final String name;

  const AsrMethod._({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id];

  static List<AsrMethod> get list => [
    AsrMethod.hanafi(),
    AsrMethod.shafi(),
  ];

  factory AsrMethod.get(String id) {
    for(final data in list){
      if(data.id == id){
        return data;
      }
    }
    throw Exception('Asr Method not found');
  }


  factory AsrMethod.shafi() => const AsrMethod._(id: 'shafi', name: 'Shafi');
  factory AsrMethod.hanafi() => const AsrMethod._(id: 'hanafi', name: 'Hanafi');
}
