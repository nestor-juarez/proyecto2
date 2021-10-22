import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
    BuildContext context,
    GlobalKey key,
    String text,
  ) async {
    var bodyProgress = Stack(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF30A9C1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 300.0,
            height: 150.0,
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: Center(
                    child: Text(text, style: const TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
