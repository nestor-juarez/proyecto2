import 'package:flutter/material.dart';
import 'package:sistema_experto_pg2/util/widgets.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Producto'),
        centerTitle: true,
        backgroundColor: Color(0xFF0077B6),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            MyFormField("campo1"),
            MyFormField("campo1"),
            MyFormField("campo1"),
            MyFormField("campo1"),
          ],
        ),
      )
      //FutureBuilder------
      );

}
