import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sound_clean/screens/nav_controller.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<GetVersionEvent>(_onGetVersion);
    on<GoNavScreensEvent>(_onGoNavScreens);
  }

  Future<void> _onGetVersion(
      GetVersionEvent event, Emitter<SplashState> emit) async {
    String version = "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    if (version.isNotEmpty) {
      emit(GetVersionSuccess(version: version));
      Timer(const Duration(seconds: 3), () {});
    } else {
      emit(const GetVersionFailed());
    }
  }

  void _onGoNavScreens(GoNavScreensEvent event, Emitter<SplashState> emit) {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        event.context,
        MaterialPageRoute(builder: (context) => const NavBarScreen()),
      );
    });
  }
}
