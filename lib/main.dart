import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/homepage.dart';

void main() {
  runApp(new MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  )); //Hide the custom android status bar.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
    );
  }
}
