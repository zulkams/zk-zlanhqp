import 'package:intl/intl.dart';

// helper utility ext for DateTime formatting
extension DateFormatting on String {
  // eg '10 Jun 2025'
  String get formatDate {
    final DateTime dateTime = DateTime.parse(this);
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }
}
