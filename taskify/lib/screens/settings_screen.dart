import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _enableRecurringTasks = false;
  bool _enableTaskPriority = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Enable Recurring Tasks"),
            value: _enableRecurringTasks,
            onChanged: (bool value) {
              setState(() {
                _enableRecurringTasks = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text("Enable Task Priority"),
            value: _enableTaskPriority,
            onChanged: (bool value) {
              setState(() {
                _enableTaskPriority = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
