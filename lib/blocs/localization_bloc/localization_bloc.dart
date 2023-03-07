import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sound_clean/utils/key_prefs.dart';
import 'package:sound_clean/utils/storage_utils.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(const LocalizationInitial()) {
    on<LocalizationInitialEvent>(
      (event, emit) async {
        final Locale locale = await getLang();

        emit(LocalizationChange(locale));
        await setLang(PrefsKey.langLevel, locale);
      },
    );

    on<LocalizationChangeEvent>(
      (event, emit) {
        emit(LocalizationChange(event.locale));
      },
    );
  }

  Future<Locale> getLang() async {
    final String langCode = await StoragesUtils.getString(
        key: PrefsKey.langLevel, defaultValue: 'en');
    return Locale(langCode);
  }

  Future<void> setLang(String key, Locale locale) async {
    StoragesUtils.setString(
        key: PrefsKey.langLevel, value: locale.languageCode);
  }
}
