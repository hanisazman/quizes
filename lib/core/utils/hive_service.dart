import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveService {
  Future<Box<T>> _openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  Future<T?> getBox<T>({required String boxName}) async {
    final box = await _openBox<T>(boxName);
    return box.get(boxName);
  }

  Future<void> addBoxes<T>(List<T> items, String boxName) async {
    debugPrint("Adding items to $boxName");
    final box = await _openBox<T>(boxName);
    await box.addAll(items);
  }

  Future<List<T>> getBoxes<T>(String boxName) async {
    final box = await _openBox<T>(boxName);
    return box.values.toList().cast<T>();
  }

  Future<void> assign<T>({required T data, required Box<T> box}) async {
    debugPrint("Assigning data to ${box.name}");
    await clearBox(box: box);
    await box.add(data);
  }

  Future<void> assignAll<T>(
      {required List<T> list, required Box<T> box}) async {
    debugPrint("Assigning list to ${box.name}");
    await clearBox(box: box);
    await box.addAll(list);
  }

  Future<void> clearBox<T>({required Box<T> box}) async {
    debugPrint("Clearing ${box.name}");
    await box.clear();
  }

  Future<bool> checkAllBoxesHaveValues(List<String> boxNames) async {
    for (final boxName in boxNames) {
      final box = await _openBox(boxName);
      if (box.isEmpty) {
        return false;
      }
    }
    return true;
  }

  Future<void> putAllWithCategoryKey<T>(
      String category, List<T> items, Box box) async {
    final key = 'category_$category';
    List<T> existingItems = box.get(key)?.cast<T>() ?? [];
    existingItems.addAll(items);
    await box.put(key, existingItems);
  }
}
