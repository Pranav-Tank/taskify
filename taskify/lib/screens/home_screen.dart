import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/storage_service.dart';
import '../services/notification_service.dart';
import '../widgets/task_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService _storageService = StorageService();
  final NotificationService _notificationService = NotificationService();
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
    _notificationService.init();
  }

  Future<void> _loadTasks() async {
    List<Task> loadedTasks = await _storageService.loadTasks();
    setState(() => _tasks = loadedTasks);
  }

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
    _storageService.saveTasks(_tasks);
    if (task.reminderTime != null) {
      _notificationService.showTaskReminder(task.id.hashCode, task.title, "Reminder: ${task.title}", task.reminderTime!);
    }
  }

  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
    _storageService.saveTasks(_tasks);
    _notificationService.cancelNotification(task.id.hashCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Taskify - Calendar Tasks")),
      body: TaskListWidget(tasks: _tasks, onDelete: _deleteTask),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open Add Task Screen (to be implemented)
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
