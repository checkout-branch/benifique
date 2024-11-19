import 'package:hive/hive.dart';
part 'pumaModel.g.dart';

@HiveType(typeId: 4)
class Adidasmodal {
  @HiveField(0)
  String? puma;
  Adidasmodal({
    required this.puma,
  });
}
