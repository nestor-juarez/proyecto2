import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _value1 = false;
  bool _value2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configuración'),
          centerTitle: true,
          backgroundColor: const Color(0xFF0077B6),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              _getConfigItem(
                'Notificaciones por correo electrónico',
                Checkbox(
                  value: _value1,
                  onChanged: (v) => setState(() => _value1 = !_value1),
                  visualDensity: VisualDensity.compact,
                ),
              ),
              _getConfigItem(
                'Notificaciones en el app',
                Checkbox(
                  value: _value2,
                  onChanged: (v) => setState(() => _value2 = !_value2),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ));
  }

  Widget _getConfigItem(String title, Widget content) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ), //SizedBox
              Text(
                title,
                style: const TextStyle(fontSize: 17.0),
              ), //Text
              const SizedBox(width: 10),
            ],
          ),
        ),
        SizedBox(child: content),
      ],
    );
  }
}
