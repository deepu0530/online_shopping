












// import 'dart:convert';
//
// List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));
//
// String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Categories {
//   static var data;
//
//   Categories({
//     this.categoryId,
//     this.categoryName,
//   });
//
//   int categoryId;
//   String categoryName;
//
//   factory Categories.fromJson(Map<String, dynamic> json) => Categories(
//     categoryId: json["category_id"],
//     categoryName: json["category_name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "category_id": categoryId,
//     "category_name": categoryName,
//   };
// }




// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  Categories({
    this.categoryId,
    this.categoryName,
  });

  int categoryId;
  String categoryName;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
