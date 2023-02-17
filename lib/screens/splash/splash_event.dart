import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class GetVersionEvent extends SplashEvent {
  final version;

  const GetVersionEvent({this.version});

  @override
  List<Object> get props => [version];
}

class GoNavScreensEvent extends SplashEvent {
  final context;
  GoNavScreensEvent({required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [context];
}
