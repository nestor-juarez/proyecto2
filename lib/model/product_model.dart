class Products {
  List<Product> products = [];

  Products();

  Products.fromService(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((element) => products.add(Product.fromService(element)));
  }
}

class Product {
  int? id;
  int? productID;
  String? name;
  String? description;

  Product({
    this.id,
    this.name,
    this.description,
  });

  Product.fromService(Map<String, dynamic> data) {
    productID = data['id'];
    name = data['name'];
    description = data['description'];
  }

  Product.fromDatabase(Map<String, dynamic> data) {
    id = data['id'];
    productID = data['product_id'];
    name = data['name'];
    description = data['description'];
  }

  Map<String, dynamic> toDatabase() => {
        "product_id": productID,
        "name": name,
        "description": description,
      };
}
