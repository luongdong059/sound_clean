import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'clear_event.dart';
part 'clear_state.dart';

class ClearBloc extends Bloc<ClearEvent, ClearState> {
  ClearBloc() : super(ClearInitial()) {
    on<ClearEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
