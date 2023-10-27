import 'package:core/extensions/int_extension.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatted => DateFormat('MMM dd, yyyy').format(this);
  String get utc => toUtc().toString();
  String get dateOnly => DateFormat('yyyy-MM-dd').format(this);
  String get timeOnly => DateFormat('HH:mm:ss').format(this);
  String get to12hrs => DateFormat('hh:mm aa').format(this);

  String get day {
    var formatter = DateFormat('d');
    return formatter.format(this);
  }

  String get nameOfDay {
    var formatter = DateFormat('EEE');
    return formatter.format(this);
  }

  String get month {
    var formatter = DateFormat('MMMM');
    return formatter.format(this);
  }

  String get year {
    var formatter = DateFormat('yyyy');
    return formatter.format(this);
  }

  String get dayOfWeek {
    var formatter = DateFormat('EEEE');
    return formatter.format(this);
  }

  // July 2023
  String get monthAndYear {
    var formatter = DateFormat('MMMM yyyy');
    return formatter.format(this);
  }

  String get monthDaySuffix {
    return '${this.month} ${this.day}${(this.day).suffix()}';
  }

  DateTime get firstDateOfTheMonth {
    return DateTime(this.year, this.month, 1);
  }

  DateTime get lastDateOfTheMonth {
    return DateTime(this.year, this.month + 1, 0);
  }

  DateTime get firstDateOfTheYear {
    return DateTime(this.year, 1, 1);
  }

  DateTime get lastDateOfTheYear {
    return DateTime(this.year, 12, 31);
  }
}
