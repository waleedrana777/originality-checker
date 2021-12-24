import 'package:flutter/foundation.dart';

final String ProductsTable = 'product';

class ProductFields {
  static final List<String> values = [
    PID,
    Name,
    Condition,
    Weight,
    Brand,
    Color,
    Rating,
    P_Category,
    Img_Url,
    ProductLink
  ];

  static final String PID = 'pid';
  static final String Name = 'name';
  static final String Condition = 'condition';
  static final String Weight = 'weight';
  static final String Brand = 'brand';
  static final String Color = 'color';
  static final String Rating = 'rating';
  static final String P_Category = 'category';
  static final String Img_Url = 'img_url';
  static final String ProductLink = 'productlink';
}

class Product {
  int? PID;
  String Name;
  String Condition;
  int Weight;
  String Brand;
  String Color;
  String Rating;
  String P_Category;
  String Img_Url;
  String ProductLink;

  //constructor
  Product(
      {this.PID,
      required this.Name,
      required this.Condition,
      required this.Weight,
      required this.Brand,
      required this.Color,
      required this.Rating,
      required this.P_Category,
      required this.Img_Url,
      required this.ProductLink});

  //from Json
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      PID: json[ProductFields.PID] as int,
      Name: json[ProductFields.Name] as String,
      Condition: json[ProductFields.Condition] as String,
      Weight: json[ProductFields.Weight] as int,
      Brand: json[ProductFields.Brand] as String,
      Color: json[ProductFields.Color] as String,
      Rating: json[ProductFields.Rating] as String,
      P_Category: json[ProductFields.P_Category] as String,
      Img_Url: json[ProductFields.Img_Url] as String,
      ProductLink: json[ProductFields.ProductLink] as String,
    );
  }

  //to Json
  Map<String, dynamic> toJson() {
    return {
      ProductFields.PID: this.PID,
      ProductFields.Name: this.Name,
      ProductFields.Condition: this.Condition,
      ProductFields.Weight: this.Weight,
      ProductFields.Brand: this.Brand,
      ProductFields.Color: this.Color,
      ProductFields.Rating: this.Rating,
      ProductFields.P_Category: this.P_Category,
      ProductFields.Img_Url: this.Img_Url,
      ProductFields.ProductLink: this.ProductLink,
    };
  }

  //copy constructor for deep copy and update given values
  Product copyWith(
      {int? PID,
      String? Name,
      String? Condition,
      int? Weight,
      String? Brand,
      String? Color,
      String? Rating,
      String? P_Category,
      String? Img_Url,
      String? ProductLink}) {
    return Product(
      PID: PID ?? this.PID,
      Name: Name ?? this.Name,
      Condition: Condition ?? this.Condition,
      Weight: Weight ?? this.Weight,
      Brand: Brand ?? this.Brand,
      Color: Color ?? this.Color,
      Rating: Rating ?? this.Rating,
      P_Category: P_Category ?? this.P_Category,
      Img_Url: Img_Url ?? this.Img_Url,
      ProductLink: ProductLink ?? this.ProductLink,
    );
  }

  //to String
  @override
  String toString() {
    return 'Product {PID: $PID, Name: $Name, Condition: $Condition, P_Category: $P_Category, Weight: $Weight, Brand: $Brand, Color: $Color, Rating: $Rating, Img_Url: $Img_Url, ProductLink: $ProductLink}';
  }
}
