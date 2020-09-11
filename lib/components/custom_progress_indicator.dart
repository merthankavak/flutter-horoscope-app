import 'package:HoroscopeApp/model/horoscope.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator(
      {Key key, @required this.horoscope, this.valcolor, this.indicatorvalue})
      : super(key: key);

  final Horoscope horoscope;
  final Color valcolor;
  final double indicatorvalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          value: indicatorvalue,
          valueColor: AlwaysStoppedAnimation(valcolor),
        ),
      ),
    );
  }
}
