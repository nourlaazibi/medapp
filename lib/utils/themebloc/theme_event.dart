part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  ThemeEvent([List props = const []]);
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({
    required this.theme,
  }) : super([theme]);

  @override
  List<Object> get props => [theme];
}
