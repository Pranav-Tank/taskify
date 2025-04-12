import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/task_model.dart';

class StorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveTasks(List<Task> tasks) async {
    String encodedTasks = jsonEncode(tasks.map((task) => task.toMap()).toList());
    await _storage.write(key: 'tasks', value: encodedTasks);
  }

  Future<List<Task>> loadTasks() async {
    String? encodedTasks = await _storage.read(key: 'tasks');
    if (encodedTasks == null) return [];
    List<dynamic> taskList = jsonDecode(encodedTasks);
    return taskList.map((task) => Task.fromMap(task)).toList();
  }
}
