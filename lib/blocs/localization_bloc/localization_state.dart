part of 'localization_bloc.dart';

abstract class LocalizationState extends Equatable {
  final Locale locale;
  const LocalizationState({required this.locale});

  @override
  List<Object> get props => [locale];
}

class LocalizationInitial extends LocalizationState {
  const LocalizationInitial() : super(locale: const Locale('en'));

  @override
  List<Object> get props => [locale];
}

class LocalizationChange extends LocalizationState {
  final Locale locale;
  const LocalizationChange(this.locale) : super(locale: locale);
  @override
  List<Object> get props => [locale];
}
