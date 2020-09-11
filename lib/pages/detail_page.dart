import 'package:HoroscopeApp/components/custom_divider.dart';
import 'package:HoroscopeApp/components/custom_progress_indicator.dart';
import 'package:HoroscopeApp/components/detailpage_bottomcontent.dart';
import 'package:HoroscopeApp/components/detailpage_topcontent.dart';
import 'package:HoroscopeApp/model/horoscope.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatelessWidget {
  final Horoscope horoscope;
  DetailPage({Key key, this.horoscope}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      children: <Widget>[
        Expanded(child: Image.asset(horoscope.image)),
        SizedBox(height: 10.0),
        CustomDivider(),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            horoscope.title,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        SizedBox(height: 15.0),
        Text(
          horoscope.subtitle,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.moneyBill,
              color: Colors.green,
            ),
            FaIcon(
              FontAwesomeIcons.grinHearts,
              color: Colors.red,
            ),
            FaIcon(
              FontAwesomeIcons.heartbeat,
              color: Colors.blue,
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Expanded(
                  flex: 1,
                  child: CustomProgressIndicator(
                    horoscope: horoscope,
                    valcolor: Colors.green,
                    indicatorvalue: horoscope.indicatorValueMoney,
                  )),
            ),
            SizedBox(width: 15.0),
            Container(
              child: Expanded(
                  flex: 1,
                  child: CustomProgressIndicator(
                    horoscope: horoscope,
                    valcolor: Colors.red,
                    indicatorvalue: horoscope.indicatorValueLove,
                  )),
            ),
            SizedBox(width: 15.0),
            Container(
              child: Expanded(
                  flex: 1,
                  child: CustomProgressIndicator(
                    horoscope: horoscope,
                    valcolor: Colors.blue,
                    indicatorvalue: horoscope.indicatorValueHealth,
                  )),
            ),
          ],
        ),
      ],
    );

    final bottomContentText = Text(
      horoscope.content,
      style: TextStyle(fontSize: 20.0),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DetailPageTopContent(topContentText: topContentText),
            DetailPageBottomContent(bottomContentText: bottomContentText)
          ],
        ),
      ),
    );
  }
}
