part of 'OriginalityBloc.dart';

class OriginalityState extends Equatable {
  bool isLightModeOn;

  ThemeData appTheme;

  int fontSize;

  List<Product> products;

  OriginalityState({
    required this.isLightModeOn,
    required this.appTheme,
    required this.fontSize,
    required this.products,
  });

  @override
  List<Object?> get props => [isLightModeOn, appTheme, fontSize, products];

  OriginalityState copyWith(
      {bool? isLightModeOn,
      ThemeData? appTheme,
      int? fontSize,
      List<Product>? products}) {
    return OriginalityState(
      isLightModeOn: isLightModeOn ?? this.isLightModeOn,
      appTheme: appTheme ?? this.appTheme,
      fontSize: fontSize ?? this.fontSize,
      products: [],
    );
  }
}
