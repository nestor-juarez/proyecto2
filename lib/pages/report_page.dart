import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sistema_experto_pg2/util/widgets.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReportPage> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          openCloseDial: isDialOpen,
          backgroundColor: Color(0xFF0077B6),
          overlayColor: Colors.grey,
          overlayOpacity: 0.5,
          spacing: 15,
          spaceBetweenChildren: 15,
          closeManually: true,
          children: [
            SpeedDialChild(
                child: Icon(Icons.assessment_outlined),
                label: 'Reporte a Excel',
                backgroundColor: Colors.green,
                onTap: () {
                  print('Excel');
                }),
            SpeedDialChild(
                child: Icon(Icons.analytics_outlined),
                label: 'Reporte CSV',
                backgroundColor: Colors.lightGreen,
                onTap: () {
                  print('CSV');
                }),
            SpeedDialChild(
                child: Icon(Icons.insert_drive_file_outlined),
                label: 'Reporte a PDF',
                backgroundColor: Colors.redAccent,
                onTap: () {
                  print('Modificar');
                }),
          ],
        ),
        appBar: AppBar(
          title: Text('Reportes'),
          centerTitle: true,
          backgroundColor: Color(0xFF0077B6),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Column(
                  children: const [
                    ListTile(
                      title: Text(
                        'Reporte de procesos',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    TableTitle(['No. Prod', 'Nombre', 'Producto']),
                    TableContent(['1', 'ABC', 'DEF']),
                    TableContent(['2', 'ABC', 'DEF']),
                    TableContent(['3', 'ABC', 'DEF']),
                    TableContent(['4', 'ABC', 'DEF']),
                    TableContent(['5', 'ABC', 'DEF']),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: const [
                    ListTile(
                      title: Text(
                        'Reporte de procesos',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    TableTitle(['No. Prod', 'Nombre', 'Producto']),
                    TableContent(['1', 'ABC', 'DEF']),
                    TableContent(['2', 'ABC', 'DEF']),
                    TableContent(['3', 'ABC', 'DEF']),
                    TableContent(['4', 'ABC', 'DEF']),
                    TableContent(['5', 'ABC', 'DEF']),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
