import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'measure_event.dart';
part 'measure_state.dart';

class MeasureBloc extends Bloc<MeasureEvent, MeasureState> {
  MeasureBloc() : super(MeasureInitial()) {
    on<MeasureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
