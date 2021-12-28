part of 'OriginalityBloc.dart';

class OriginalityState extends Equatable {
  bool isLightModeOn;

  ThemeData appTheme;

  int fontSize;

  List<Product> products;

  List<Product> suggestions;
  List<Product> notRendered;



  OriginalityState({
    required this.isLightModeOn,
    required this.appTheme,
    required this.fontSize,
    required this.products,
    required this.suggestions,
    required this.notRendered,

  });

  @override
  List<Object?> get props =>
      [isLightModeOn, appTheme, fontSize, products, suggestions, notRendered];

  OriginalityState copyWith(
      {bool? isLightModeOn,
      ThemeData? appTheme,
      int? fontSize,
      List<Product>? products,
      List<Product>? suggestions,
      List<Product>? notRendered}) {
    return OriginalityState(
      isLightModeOn: isLightModeOn ?? this.isLightModeOn,
      appTheme: appTheme ?? this.appTheme,
      fontSize: fontSize ?? this.fontSize,
      products: products ?? this.products,
      suggestions: suggestions ?? this.suggestions,
      notRendered: notRendered ?? this.notRendered,
    );
  }
}
