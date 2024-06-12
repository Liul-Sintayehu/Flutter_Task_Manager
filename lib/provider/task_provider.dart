import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/model/task.dart';

class TaskProvider extends ChangeNotifier {
  //late Box<Task> _taskBox;
  List<Task> tasks = [];

  // TaskProvider() {
  //   _init();
  // }
  // void _init() async {
  //   await Hive.initFlutter();
  //   _taskBox = await Hive.openBox<Task>('tasks');
  //   tasks = _taskBox.values.toList();
  // }

  void addTask(task) {
    tasks.add(task);
    //_taskBox.add(task);
    notifyListeners();
  }

  List<Task> get getTasks => tasks;
}
