import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(task),
        trailing: Icon(Icons.check_circle_outline, color: Colors.green),
      ),
    );
  }
}
