import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sistema_experto_pg2/util/widgets.dart';

class ComplementPage extends StatefulWidget {
  const ComplementPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ComplementPage> {
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
                  child: Icon(Icons.insert_drive_file_outlined),
                  label: 'Nuevo Registro',
                  backgroundColor: Colors.blueAccent,
                  onTap: () {
                    print('Nuevo');
                  }),
              SpeedDialChild(
                  child: Icon(Icons.update),
                  label: 'Modificar Registro',
                  backgroundColor: Colors.yellowAccent,
                  onTap: () {
                    print('Modificar');
                  }),
              SpeedDialChild(
                  child: Icon(Icons.work_off_outlined),
                  label: 'Deshabilitar',
                  backgroundColor: Colors.redAccent,
                  onTap: () {
                    print('Eliminar');
                  }),
            ],
          ),
          appBar: AppBar(
            title: Text('Certificados'),
            centerTitle: true,
            backgroundColor: Color(0xFF0077B6),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                MyFormField("C??digo de Cerficado"),
                MyFormField("Nombre"),
                MyFormField("Descripci??n"),
                MyFormField("Producto"),
                MyFormField("Estado"),
              ],
            ),
          )),
    );
  }
}
