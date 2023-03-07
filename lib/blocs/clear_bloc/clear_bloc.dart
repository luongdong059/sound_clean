import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sound_clean/themes/app_assets.dart';

part 'clear_event.dart';
part 'clear_state.dart';

class ClearBloc extends Bloc<ClearEvent, ClearState> {
  final player = AudioPlayer();

  ClearBloc() : super(ClearInitial()) {
    on<PressSoundEvent>(_onPressSoundEvent);
  }

  Future<void> _onPressSoundEvent(
      PressSoundEvent event, Emitter<ClearState> emit) async {
    player.setAsset(AppAssets.sound);

    if (!event.isPress) {
      await player.play();
      emit(const SoundPlayingState(true));
    }
    if (event.isPress) {
      await player.stop();
      emit(const SoundPlayingState(false));
    }
    Future<ByteData> loadAsset() async {
      return await rootBundle.load('lib/assets/sounds/165Hz.mp3');
    }
  }
}
