import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:sound_clean/configs/app_configs.dart';

class Logger {
  static Future<void> d(dynamic message) async {
    return _log(message, level: 'debug');
  }

  static Future<void> w(dynamic message) async {
    return _log(message, level: 'warn');
  }

  static Future<void> e(dynamic message) async {
    return _log(message, level: 'error');
  }

  static Future<void> _log(dynamic message, {required String level}) async {
    if (AppConfigs.instance.values.enableLog) {
      _printLog(message, level: level);
    }
  }

  static void _printLog(dynamic message, {required String level}) {
    String time = '(${DateFormat('HH:mm:ss').format(DateTime.now())})';
    log('$time - $message', name: level);
  }

  /// Convert dynamic to formatted String
  static List<dynamic> _formatString(dynamic message) {
    if (message == null) {
      return <String>['null'];
    } else if (message is String) {
      return message.split('\n');
    } else if (message is Map || message is Iterable) {
      const JsonEncoder encoder = JsonEncoder();
      return <String>[encoder.convert(message)];
    } else if (message is List) {
      return message;
    } else {
      return <String?>[message?.toString()];
    }
  }
}
