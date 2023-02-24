part of 'clear_bloc.dart';

abstract class ClearState extends Equatable {
  const ClearState();

  @override
  List<Object> get props => [];
}

class ClearInitial extends ClearState {}

class SoundOnState extends ClearState {
  const SoundOnState();
  @override
  List<Object> get props => [];
}

class SoundOffState extends ClearState {
  final bool isPlaying;
  const SoundOffState(this.isPlaying);
  @override
  List<Object> get props => [isPlaying];
}
