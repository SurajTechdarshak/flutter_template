import 'package:talker_flutter/talker_flutter.dart';

class Log {
  Log._();

  static late Talker _talker;

  static Talker init() {
    _talker = TalkerFlutter.init();
    return _talker;
  }

  static void d(String message) {
    _talker.debug(message);
  }

  static void e(String message, {error, StackTrace? trace}) {
    _talker.error(message, error, trace);
  }

  static void i(String message) {
    _talker.info(message);
  }

  static void v(String message) {
    _talker.verbose(message);
  }

  static void w(String message) {
    _talker.warning(message);
  }
}
