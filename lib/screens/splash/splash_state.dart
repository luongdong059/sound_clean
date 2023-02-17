import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class GetVersionSuccess extends SplashState {
  final String version;
  GetVersionSuccess({required this.version});

  @override
  // TODO: implement props
  List<Object?> get props => [version];
}

class GetVersionFaild extends SplashState {
  GetVersionFaild();

  @override
  // TODO: implement props
  List<Object?> get props => [null];
}

class SplashNotInitializedState extends SplashState {
  SplashNotInitializedState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
