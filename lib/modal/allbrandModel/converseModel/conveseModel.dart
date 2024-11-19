import 'package:hive/hive.dart';
part 'conveseModel.g.dart';

@HiveType(typeId: 5)
class Adidasmodal {
  @HiveField(0)
  String? converse;
  Adidasmodal({
    required this.converse,
  });
}
