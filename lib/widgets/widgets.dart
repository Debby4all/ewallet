import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Splash screen loading
Widget wAppLoading(BuildContext context) {
  return Center(
    child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CircularProgressIndicator()),
  );
}

Future wPushTo(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Future wPushReplaceTo(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Future wShowToast(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}

// Submit button
Widget wInputSubmit({required String title, required VoidCallback onPressed}) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
      ),
      child: Text(title),
      onPressed: onPressed,
    ),
  );
}
