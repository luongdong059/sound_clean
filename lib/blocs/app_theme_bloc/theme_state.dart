part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState({required this.theme});
  final ThemeData theme;

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(theme: AppTheme.light);
}
