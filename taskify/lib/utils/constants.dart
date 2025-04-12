import 'package:flutter/material.dart';

class AppConstants {
  // Task priority levels
  static const List<String> priorityLevels = [
    "Low",
    "Medium",
    "High",
    "Urgent"
  ];

  // Recurring task options
  static const List<String> recurrenceOptions = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly"
  ];

  // Default notification channel ID (for Android)
  static const String notificationChannelId = "task_reminder_channel";

  // Default colors for different task priorities
  static const Map<String, Color> priorityColors = {
    "Low": Colors.green,
    "Medium": Colors.blue,
    "High": Colors.orange,
    "Urgent": Colors.red,
  };
}
