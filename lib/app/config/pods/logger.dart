import 'package:logger/logger.dart';

class Log {
  static late Logger _instance;

  static void init() {
    _instance = Logger();
  }

  static void setLevel(Level level) {
    Logger.level = level;
  }

  static void info([message, Object? error, StackTrace? stackTrace]) {
    _instance.i('$message', error: error, stackTrace: stackTrace);
  }

  static void warning([message, Object? error, StackTrace? stackTrace]) {
    _instance.w('$message', error: error, stackTrace: stackTrace);
  }

  static void error([message, Object? error, StackTrace? stackTrace]) {
    _instance.e('$message', error: error, stackTrace: stackTrace);
  }

  static void debug([message, Object? error, StackTrace? stackTrace]) {
    _instance.d('$message', error: error, stackTrace: stackTrace);
  }

  static void verbose([message, Object? error, StackTrace? stackTrace]) {
    _instance.i('$message', error: error, stackTrace: stackTrace);
  }
}
