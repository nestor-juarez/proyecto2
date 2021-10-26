import 'package:flutter/material.dart';
import 'package:sistema_experto_pg2/widget/a.dart';
import 'package:sistema_experto_pg2/widget/d.dart';
import 'package:sistema_experto_pg2/widget/navigation_drawer_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0077B6),
        title: const Text('Dashboard'),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getItem1(),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(child: _getBoxContainer(_getTextItem())),
                  const SizedBox(width: 15),
                  Expanded(child: _getBoxContainer(_getTextItem())),
                ],
              ),
              const SizedBox(height: 15),
              _getItem3(),
              const SizedBox(height: 15),
              //_getItem2(),
              //const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getItem1() => _getBoxContainer(
        SizedBox(
            width: double.infinity,
            child: Column(
              children: const [
                Text(
                  'Sales by Month',
                  style: TextStyle(color: Colors.grey, fontSize: 25),
                ),
                Text(
                  '421.3M',
                  style: TextStyle(color: Colors.grey, fontSize: 25),
                ),
                PieChartSample1()
              ],
            )),
      );

  //Widget _getItem2() => _getBoxContainer(BarChartTwo());

  Widget _getItem3() => _getBoxContainer(const LineChartSample1());

  Widget _getTextItem() => SizedBox(
        width: double.infinity,
        child: Column(
          children: const [
            Text('abc', style: TextStyle(fontSize: 28)),
            Text('abc', style: TextStyle(fontSize: 17)),
          ],
        ),
      );

  Widget _getBoxContainer(Widget content) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 5),
                  color: Colors.black12,
                  spreadRadius: 3,
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: content,
      );
}
