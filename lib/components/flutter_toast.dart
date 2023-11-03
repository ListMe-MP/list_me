import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static toast({required String msg}) {
    Fluttertoast.showToast(msg: msg);
  }
}
