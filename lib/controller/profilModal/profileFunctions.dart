import 'package:benefique/modal/profileModal/profileModal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<ProfileOfbenifique>> profileNotifiers = ValueNotifier([]);

Future addProfileData(ProfileOfbenifique values) async {
  final adddataofp = await Hive.openBox<ProfileOfbenifique>('saveData');
  adddataofp.add(values);
  profileNotifiers.value.add(values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  profileNotifiers.notifyListeners();
}

Future getAllProfile() async {
  final adddataofp = await Hive.openBox<ProfileOfbenifique>('saveData');
  profileNotifiers.value.clear();
  profileNotifiers.value.addAll(adddataofp.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  profileNotifiers.notifyListeners();
}
