import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveService {
  getBox({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.get(boxName);
  }

  Future<void> addBoxes<T>(List<T> items, String boxName) async {
    debugPrint("adding $boxName");
    final openBox = await Hive.openBox(boxName);
    openBox.addAll(items);
  }

  getBoxes<T>(String boxName) async {
    List<T> boxList = <T>[];

    final openBox = await Hive.openBox(boxName);

    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }

  Future<void> assign(
      {required dynamic data, required Box<dynamic> box}) async {
    debugPrint("adding $box");
    await clearBox(box: box);
    await box.add(data);
  }

  Future<void> assignAll(
      {required List<dynamic> list, required Box<dynamic> box}) async {
    debugPrint("adding $box");
    await clearBox(box: box);
    await box.addAll(list);
  }

  Future<void> clearBox({required Box<dynamic> box}) async {
    debugPrint("clearing $box");
    await box.clear();
  }

  Future<bool> checkAllBoxesHaveValues(List<String> boxNames) async {
    for (final boxName in boxNames) {
      final hasValues = Hive.box(boxName).isNotEmpty;
      if (!hasValues) {
        return false; // Return false if any box is empty
      }
    }
    return true; // All boxes have values
  }

  Future<void> putAllWithCategoryKey<T>(String category, List<T> items, Box box) async {
    final key = 'category_$category';
    List<T> existingItems = box.get(key)?.cast<T>() ?? [];
    existingItems.addAll(items);
    await box.put(key, existingItems);
  }
}
