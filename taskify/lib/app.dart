import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

class ToDoCalendarApp extends StatelessWidget {
  const ToDoCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do Calendar',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Supports system-wide dark mode
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
