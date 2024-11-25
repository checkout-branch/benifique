import 'package:benefique/modal/cartModal/cartModal.dart';
import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:benefique/modal/profileModal/profileModal.dart';

import 'package:benefique/view/LoginAndSpalsh/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ProfileOfbenifiqueAdapter().typeId)) {
    Hive.registerAdapter(ProfileOfbenifiqueAdapter());
    Hive.registerAdapter(ProdectmodelAdapter());
  }
  if (!Hive.isAdapterRegistered(ProdectmodelAdapter().typeId)) {
    Hive.registerAdapter(ProdectmodelAdapter());
  }
  if (!Hive.isAdapterRegistered(StoreCartAdapter().typeId)) {
    Hive.registerAdapter(StoreCartAdapter());
  }

  await Hive.openBox<StoreCart>('cartBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
