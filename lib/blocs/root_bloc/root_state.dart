part of 'root_bloc.dart';

abstract class RootState extends Equatable {
  const RootState();
  
  @override
  List<Object> get props => [];
}

class RootInitial extends RootState {}
