import 'package:sistema_experto_pg2/util/app_type.dart';

class ResponseData {
  HttpStatus? status;
  HttpCode? code;
  String? msg;
  dynamic recordset;

  ResponseData({this.status, this.code, this.msg, this.recordset});

/*ResponseData({status, code, msg, recordset}) {
    this.status = status;
    this.code = code;
    this.msg = msg;
    this.recordset = recordset;
  }*/

}
