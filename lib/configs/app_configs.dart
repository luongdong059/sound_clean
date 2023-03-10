import 'package:flutter/material.dart';

class AppConfigs {
  final Flavor flavor;
  final FlavorValues values;

  static AppConfigs? _instance;

  AppConfigs._internal(
    this.flavor,
    this.values,
  );

  factory AppConfigs(Flavor flavor) {
    return _instance ??= AppConfigs._internal(
      flavor,
      flavor.get(),
    );
  }

  static AppConfigs get instance {
    return _instance!;
  }

  Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}

enum Flavor { staging, production }

extension FlavorExtension on Flavor {
  FlavorValues get() {
    switch (this) {
      case Flavor.staging:
        return FlavorValues(
            appName: 'appName',
            mediaUr: 'mediaUr',
            apiUrl: 'apiUrl',
            enableLog: true);
      default:
        return FlavorValues(
            appName: 'appName',
            mediaUr: 'mediaUr',
            apiUrl: 'apiUrl',
            enableLog: false);
    }
  }
}

class FlavorValues {
  final String appName;
  final String apiUrl;
  final String mediaUr;
  final bool enableLog;

  FlavorValues(
      {required this.appName,
      required this.mediaUr,
      required this.apiUrl,
      required this.enableLog});
}
