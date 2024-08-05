class Product{
  int id;
  String name;
  double price;
  String category;
  double rating;
  String description;
  

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.rating,
    required this.description,
  });
  String image () => "$id.png";
}


