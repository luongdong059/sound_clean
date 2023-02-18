part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  @override
  List<Object> get props => [];
}

class GetVersionSuccess extends SplashState {
  final String version;
  const GetVersionSuccess({required this.version});

  @override
  List<Object?> get value => [version];
}

class GetVersionFailed extends SplashState {
  const GetVersionFailed();

  @override
  List<Object?> get value => [null];
}

class SplashInitial extends SplashState {}
