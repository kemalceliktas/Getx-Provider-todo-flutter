import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_todo_app/core/utils/keys.dart';
import 'package:getx_todo_app/data/models/task.dart';
import 'package:getx_todo_app/data/services/storage/services.dart';

class TaskProvider {
  final storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }


  void writeTasks(List<Task>tasks){
    storage.write(taskKey, jsonEncode(tasks),);
  }
}
