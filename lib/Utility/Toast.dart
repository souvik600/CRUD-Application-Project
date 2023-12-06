import 'package:crud_app/Style/ColorStyle.dart';
import 'package:fluttertoast/fluttertoast.dart';

void ErrorValidation(TextShow){
  validator: (value) {
    if (value == null || value.isEmpty) {
      return TextShow;
    }
    return null;
  };
}


void ErrorToast (mgs) {
  Fluttertoast.showToast(
      msg: mgs,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

  void SuccessToast (mgs){
    Fluttertoast.showToast(
        msg: mgs,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: colorGreen,
        textColor:colorWhite,
        fontSize: 16.0
    );
}
