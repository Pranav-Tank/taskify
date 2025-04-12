import 'package:timezone/timezone.dart' as tz;

class Task {
  String id;
  String title;
  String description;
  DateTime date;
  bool isCompleted;
  int priority; // 1 - Low, 2 - Medium, 3 - High, 4 - Urgent
  bool isRecurring;
  String recurrenceType; // 'daily', 'weekly', 'monthly', 'yearly'
  tz.TZDateTime? reminderTime;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    required this.date,
    this.isCompleted = false,
    this.priority = 1,
    this.isRecurring = false,
    this.recurrenceType = '',
    this.reminderTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted,
      'priority': priority,
      'isRecurring': isRecurring,
      'recurrenceType': recurrenceType,
      'reminderTime': reminderTime?.toIso8601String(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      isCompleted: map['isCompleted'],
      priority: map['priority'],
      isRecurring: map['isRecurring'],
      recurrenceType: map['recurrenceType'],
      reminderTime: map['reminderTime'] != null
          ? tz.TZDateTime.parse(tz.local, map['reminderTime'])
          : null,
    );
  }
}
