// To parse this JSON data, do
//
//     final pentagon = pentagonFromJson(jsonString);

import 'dart:convert';

List<Pentagon> pentagonFromJson(String str) => List<Pentagon>.from(json.decode(str).map((x) => Pentagon.fromJson(x)));

String pentagonToJson(List<Pentagon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pentagon {
    int? id;
    String? title;
    double? price;
    String? description;
    Category? category;
    String? image;
    Rating? rating;

    Pentagon({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
    });

    factory Pentagon.fromJson(Map<String, dynamic> json) => Pentagon(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating?.toJson(),
    };
}

enum Category {
    ELECTRONICS,
    JEWELERY,
    MEN_S_CLOTHING,
    WOMEN_S_CLOTHING
}

final categoryValues = EnumValues({
    "electronics": Category.ELECTRONICS,
    "jewelery": Category.JEWELERY,
    "men's clothing": Category.MEN_S_CLOTHING,
    "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
    double? rate;
    int? count;

    Rating({
        this.rate,
        this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
