part of 'clear_bloc.dart';

abstract class ClearEvent extends Equatable {
  const ClearEvent();

  @override
  List<Object> get props => [];
}

class PressSoundEvent extends ClearEvent {
  final bool isPress;
  const PressSoundEvent({required this.isPress});

  @override
  List<Object> get props => [];
}
