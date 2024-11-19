import 'package:hive_flutter/hive_flutter.dart';
part 'adidasModal.g.dart';
@HiveType(typeId: 3)
class Adidasmodal {
  @HiveField(0)
  String? adidas;
  Adidasmodal({
    required this.adidas,
  });
}
