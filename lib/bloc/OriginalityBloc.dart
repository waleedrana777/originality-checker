//create a Bloc
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
            appTheme: ThemeData.dark(),

            //FONT SIZE
            fontSize: 18,
            products: [])) {
    on<ThemeChanged>(_ChangeTheme);
  }

  @override
  void onTransition(Transition<OriginalityEvent, OriginalityState> transition) {
    super.onTransition(transition);
  }

  void _ChangeTheme(ThemeChanged event, Emitter<OriginalityState> emit) {
    ThemeData OriginalTheme = state.appTheme;
    bool isLightModeOnValue = state.isLightModeOn;

    print('${isLightModeOnValue}');

    emit(state.copyWith(
        isLightModeOn: !isLightModeOnValue,
        appTheme: OriginalTheme == ThemeData.dark()
            ? ThemeData.light()
            : ThemeData.dark()));
  }
}
