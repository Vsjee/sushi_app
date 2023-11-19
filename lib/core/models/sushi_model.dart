import 'dart:convert';

List<Sushi> sushiFromJson(String str) =>
    List<Sushi>.from(json.decode(str).map((x) => Sushi.fromJson(x)));

String sushiToJson(List<Sushi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sushi {
  String id;
  String sushiName;
  int price;
  int? discount;
  String image;
  List<Ingredient> ingredients;
  String sushiOrigin;
  int rating;

  Sushi({
    required this.id,
    required this.sushiName,
    required this.price,
    this.discount,
    required this.image,
    required this.ingredients,
    required this.sushiOrigin,
    required this.rating,
  });

  factory Sushi.fromJson(Map<String, dynamic> json) => Sushi(
        id: json["_id"],
        sushiName: json["sushi_name"],
        price: json["price"],
        discount: json["discount"],
        image: json["image"],
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        sushiOrigin: json["sushi_origin"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sushi_name": sushiName,
        "price": price,
        "discount": discount,
        "image": image,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "sushi_origin": sushiOrigin,
        "rating": rating,
      };
}

class Ingredient {
  String ingredientName;
  int calories;

  Ingredient({
    required this.ingredientName,
    required this.calories,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        ingredientName: json["ingredient_name"],
        calories: json["calories"],
      );

  Map<String, dynamic> toJson() => {
        "ingredient_name": ingredientName,
        "calories": calories,
      };
}
