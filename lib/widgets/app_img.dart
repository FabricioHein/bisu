import 'package:flutter/material.dart';

class App_img extends StatelessWidget {
  String text;

  App_img(this.text);

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(text,
    ));
  }
 }
