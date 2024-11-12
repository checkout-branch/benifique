import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<ProfileOfbenifique>> profileNotifiers = ValueNotifier([]);

Future addProfileData(ProfileOfbenifique values) async {
  final adddataofp = await Hive.openBox<ProfileOfbenifique>('saveData');
  adddataofp.add(values);
  profileNotifiers.value.add(values);
  profileNotifiers.notifyListeners();
}

Future getAll() async {
  final adddataofp = await Hive.openBox<ProfileOfbenifique>('saveData');
  profileNotifiers.value.clear();
  profileNotifiers.value.addAll(adddataofp.values);
    profileNotifiers.notifyListeners();
}
