import 'package:benefique/modal/prodectModal/prodectModal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Prodectmodel>> prodectList = ValueNotifier([]);

Future addProdectTolist(Prodectmodel value) async {
  final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
  prodectDb.add(value);

  prodectList.value.add(value);

  prodectList.notifyListeners();
}

Future getAllProdect() async {
  final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
  prodectList.value.clear();
  prodectList.value.addAll(prodectDb.values);
  prodectList.notifyListeners();
}

Future deleteProdect(int index) async {
  final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');
  prodectDb.deleteAt(index);
  getAllProdect();
}

Future<void> editingProdect(index, Prodectmodel value) async {
  final prodectDb = await Hive.openBox<Prodectmodel>('save_prodect');

  prodectList.value.clear();
  prodectList.value.addAll(prodectDb.values);
  prodectList.notifyListeners();
  prodectDb.putAt(index, value);
  getAllProdect();
}

ValueNotifier<List<Prodectmodel>> filterlist = ValueNotifier([]);
