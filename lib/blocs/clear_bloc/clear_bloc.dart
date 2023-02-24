import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sound_clean/themes/app_assets.dart';

part 'clear_event.dart';
part 'clear_state.dart';

class ClearBloc extends Bloc<ClearEvent, ClearState> {
  ClearBloc() : super(ClearInitial()) {
    final _player = AudioPlayer();
    _player.setAsset(AppAssets.sound);
    // state is ClearInitial ? emit(SoundOffState(false)) : null;

    on<PressSoundEvent>((event, emit) async {
      print(state);
      if (!event.isPress) {
        await _player.play();
        emit(SoundOffState(true));
      }
      if (event.isPress) {
        await _player.stop();
        emit(SoundOffState(false));
      }
      print(state);
      Future<ByteData> loadAsset() async {
        return await rootBundle.load('lib/assets/sounds/165Hz.mp3');
      }
    });
  }
}
