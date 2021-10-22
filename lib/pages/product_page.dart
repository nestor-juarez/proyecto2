import 'package:flutter/material.dart';
import 'package:sistema_experto_pg2/provider/product_provider.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Producto'),
          centerTitle: true,
          backgroundColor: Color(0xFF0077B6),
        ),
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  ProductProvider.shared.getAllProducts(context);
                },
                child: Text('qlo'))
          ],
        ),
        //FutureBuilder------
      );
}
