part of 'OriginalityBloc.dart';

class OriginalityEvent extends Equatable {
  OriginalityEvent();

  @override
  List<Object?> get props => [];
}

class ThemeChanged extends OriginalityEvent {
  ThemeChanged();

  @override
  List<Object?> get props => [];
}

class FontSizeChanged extends OriginalityEvent {
  final double fontSize;

  FontSizeChanged(this.fontSize);

  @override
  List<Object?> get props => [fontSize];
}
