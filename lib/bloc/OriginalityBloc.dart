//create a Bloc
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'dart:core';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/models/product.dart';

part 'OriginalityEvent.dart';
part 'OriginalityState.dart';

class OriginalityBloc extends Bloc<OriginalityEvent, OriginalityState> {
  OriginalityBloc()
      : super(OriginalityState(
          //initial light state
          isLightModeOn: true,

          //APP THEME
          appTheme: FlexThemeData.light(scheme: FlexScheme.blue),

          //FONT SIZE
          fontSize: 25,
          products: [],
          suggestions: [],
          notRendered: [],
        )) {
    on<ThemeChanged>(_ChangeTheme);
    on<FontSizeChanged>(_ChangeFontSize);

    on<SuggestionsFetched>(_FetchSuggestions);
    on<SuggestionAdded>(_AddSuggestion);
    on<SuggestionRemoved>(_RemoveSuggestion);
    on<SuggestionsCleared>(_ClearSuggestions);
  }

  @override
  void onTransition(Transition<OriginalityEvent, OriginalityState> transition) {
    super.onTransition(transition);
  }

  void _ChangeTheme(ThemeChanged event, Emitter<OriginalityState> emit) {
    ThemeData OriginalTheme = state.appTheme;
    bool isLightModeOnValue = state.isLightModeOn;

    emit(state.copyWith(
        isLightModeOn: !isLightModeOnValue,
        fontSize: 28,
        appTheme: OriginalTheme == FlexThemeData.dark(scheme: FlexScheme.blue)
            ? FlexThemeData.light(scheme: FlexScheme.blue)
            : FlexThemeData.dark(scheme: FlexScheme.blue)));
  }

  void _ChangeFontSize(FontSizeChanged event, Emitter<OriginalityState> emit) {
    double fontSizeValue = event.fontSize;
    emit(state.copyWith(
        appTheme: state.appTheme.copyWith(
            textTheme: TextTheme(button: TextStyle(fontSize: fontSizeValue)))));
  }

  void _FetchSuggestions(
      SuggestionsFetched event, Emitter<OriginalityState> emit) {
    List<Product> newSuggestions = state.products
        .where((element) => element.P_Category == event.category)
        .toList();
    emit(state.copyWith(suggestions: newSuggestions));
  }

  void _AddSuggestion(SuggestionAdded event, Emitter<OriginalityState> emit) {
    List<Product> suggestions = state.suggestions;
    suggestions.add(event.productToBeAdded);
    emit(state.copyWith(suggestions: suggestions));
  }

  void _RemoveSuggestion(
      SuggestionRemoved event, Emitter<OriginalityState> emit) {
    List<Product> suggestions = state.suggestions;
    suggestions.remove(event.productToBeRemoved);
    emit(state.copyWith(suggestions: suggestions));
  }

  void _ClearSuggestions(
      SuggestionsCleared event, Emitter<OriginalityState> emit) {
    emit(state.copyWith(suggestions: [], notRendered: []));
  }
}
