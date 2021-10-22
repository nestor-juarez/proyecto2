import 'package:sistema_experto_pg2/model/product_model.dart';

class ProductRepository {
  ProductRepository._privateConstructor();

  static final ProductRepository shared =
      ProductRepository._privateConstructor();

  void saveItems(List<Product> data) {}
}
