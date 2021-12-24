import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:originalitygram/models/product.dart';
import 'package:originalitygram/router/constants.dart';
import 'package:originalitygram/screens/Home.dart';
import 'package:originalitygram/screens/ProductSuggestions.dart';
import 'package:originalitygram/screens/Signin.dart';
import 'package:originalitygram/screens/SearchProduct.dart';
import 'package:originalitygram/screens/Signup.dart';
import 'package:originalitygram/screens/ThemeScreen.dart';
import 'package:originalitygram/screens/UserManagement.dart';

class router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());

      case searchProduct:
        return MaterialPageRoute(builder: (_) => SearchProduct());

      case productSuggestionsRoute:
        Product data = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductSuggestions(dataa: data));

      case userManagement:
        return MaterialPageRoute(builder: (_) => UserManagement());

      case signupRoute:
        return MaterialPageRoute(builder: (_) => Signup());

      case signinRoute:
        return MaterialPageRoute(builder: (_) => Signin());

      case toggleTheme:
        return MaterialPageRoute(builder: (_) => ThemeScreen());

      case changeFontSize:
        return MaterialPageRoute(builder: (_) => Home());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
