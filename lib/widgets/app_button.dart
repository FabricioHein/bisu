import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onPressed;

  AppButton(this.text, {this.onPressed, bool showProgress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.redAccent,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.10),
            side: BorderSide(color: Colors.redAccent)),

      ),

    );
  }
}
