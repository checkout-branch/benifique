import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:benefique/screens/bottomNavigation/bootomBar.dart';

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ProfileOfbenifiqueAdapter().typeId)) {
    Hive.registerAdapter(ProfileOfbenifiqueAdapter());
    Hive.registerAdapter(ProdectmodelAdapter());
  }
  await Hive.openBox('userBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Botoommm(),
    );
  }
}
