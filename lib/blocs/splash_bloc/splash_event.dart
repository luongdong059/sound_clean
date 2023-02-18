part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
  @override
  List<Object> get props => [];
}

class GetVersionEvent extends SplashEvent {
  final version;

  const GetVersionEvent({this.version});

  @override
  List<Object> get value => [version];
}

class GoNavScreensEvent extends SplashEvent {
  final BuildContext context;
  const GoNavScreensEvent({required this.context});

  @override
  List<Object?> get value => [context];
}
