import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Producto'),
          centerTitle: true,
          backgroundColor: Color(0xFF0077B6),
        ),
      );
}
