import 'package:intl/intl.dart';

extension StringExtension on String {
  DateTime toDateTime() => DateTime.parse(this);
  String capitalizeFirstLetter() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String toTitleCase() => split(' ')
      .map((word) => word.isEmpty
          ? word
          : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
      .join(' ');

  DateTime get fullDateTime {
    final DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
    final DateTime formatted = formatter.parse(this);
    return formatted;
  }

  DateTime get date {
    final DateFormat formatter = DateFormat("yyyy-MM-dd");
    final DateTime formatted = formatter.parse(this);
    return formatted;
  }
}
