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

class SuggestionsFetched extends  OriginalityEvent {
  final String category;

  SuggestionsFetched(this.category);

  @override
  List<Object?> get props => [category];
}

class SuggestionAdded extends OriginalityEvent {
  final Product productToBeAdded;

  SuggestionAdded(this.productToBeAdded);

  @override
  List<Object?> get props => [productToBeAdded];
}

class SuggestionRemoved extends OriginalityEvent {
  final Product productToBeRemoved;

  SuggestionRemoved(this.productToBeRemoved);

  @override
  List<Object?> get props => [productToBeRemoved];
}

class SuggestionsCleared extends OriginalityEvent {}
