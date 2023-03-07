part of 'clear_bloc.dart';

abstract class ClearState extends Equatable {
  const ClearState();

  @override
  List<Object> get props => [];
}

class ClearInitial extends ClearState {}

class SoundPlayingState extends ClearState {
  final bool isPlaying;
  const SoundPlayingState(this.isPlaying);
  @override
  List<Object> get props => [isPlaying];
}
