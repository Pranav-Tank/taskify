import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskListWidget extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onDelete;

  const TaskListWidget({Key? key, required this.tasks, required this.onDelete}) : super(key: key);

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        Task task = tasks[index];
        return Dismissible(
          key: Key(task.id),
          background: Container(color: Colors.red, child: const Icon(Icons.delete, color: Colors.white)),
          onDismissed: (direction) => onDelete(task),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.circle, color: getPriorityColor(task.priority)),
              title: Text(task.title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(task.description),
              trailing: task.isCompleted ? Icon(Icons.check_circle, color: Colors.green) : null,
            ),
          ),
        );
      },
    );
  }
}
