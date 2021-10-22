import 'package:flutter/material.dart';
import 'package:sistema_experto_pg2/model/product_model.dart';
import 'package:sistema_experto_pg2/provider/api_manager.dart';
import 'package:sistema_experto_pg2/provider/url_provider.dart';
import 'package:sistema_experto_pg2/repository/product_repository.dart';
import 'package:sistema_experto_pg2/util/app_type.dart';

class ProductProvider {
  ProductProvider._privateConstructor();

  static final ProductProvider shared = ProductProvider._privateConstructor();

  void getAllProducts(BuildContext context) async {
    final result = await ApiManager.shared.request(
      baseUrl: BaseUri.shared.apiUrl,
      uri: PathUri.shared.getAllProducts,
      type: HttpType.get,
    );

    if (result.status == HttpStatus.success) {
      var x = Products.fromService(result.recordset);
      ProductRepository.shared.saveItems(x.products);
    }
  }
}
