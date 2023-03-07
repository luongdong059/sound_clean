part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class LocalizationInitialEvent extends LocalizationEvent {
  const LocalizationInitialEvent();

  @override
  List<Object> get props => [];
}

class LocalizationChangeEvent extends LocalizationEvent {
  const LocalizationChangeEvent({required this.locale});
  final Locale locale;
  @override
  List<Object> get props => [locale];
}
