class ProductModel
{
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;
  ProductModel(
      {required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.image,
        required this.rating,
        required this.category,
      });
  factory ProductModel.fromJson(jsonData)
  {
    return ProductModel(
        id: jsonData["id"],
        title: jsonData["title"],
        price: jsonData["price"],
        category: jsonData["category"],
        description: jsonData["description"],
        image: jsonData["image"],
        rating: RatingModel.fromJson(jsonData["rating"]), 
    );
  }
}


class RatingModel
{
  final String rate;
  final String count;
  RatingModel(
      {required this.rate,
        required this.count,
      });
  factory RatingModel.fromJson(jsonData)
  {
    return RatingModel(rate: jsonData["rate"], count: jsonData["count"]);
  }
}