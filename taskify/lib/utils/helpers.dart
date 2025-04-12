import 'package:intl/intl.dart';

class Helpers {
  // Format date into a readable string (e.g., "Mar 25, 2025")
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  // Format time into a readable string (e.g., "2:30 PM")
  static String formatTime(DateTime time) {
    return DateFormat.jm().format(time);
  }

  // Convert a string to DateTime (used for JSON storage)
  static DateTime parseDate(String dateString) {
    return DateTime.parse(dateString);
  }
}
