class Product {
  int id;
  String name;
  String price;
  String description;
  String image;

  // json -> object
  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        description = json['description'],
        image = json['image'];

  // object -> json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'image': image,
      };
}
