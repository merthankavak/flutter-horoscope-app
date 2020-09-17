import 'package:HoroscopeApp/components/custom_appbar.dart';
import 'package:HoroscopeApp/components/custom_bottombar.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'detail_page.dart';
import 'package:HoroscopeApp/services/admob_service.dart';
import '../model/horoscope.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List horoscopes;
  final ams = AdMobService(); //Admob Service
  @override
  void initState() {
    horoscopes = getHoroscopes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Horoscope horoscope) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Image.asset(
              horoscope.image,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            horoscope.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 0, top: 10),
                child: Text(horoscope.subtitle,
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ]),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(horoscope: horoscope)));
          },
        );

    Card makeCard(Horoscope horoscope) => Card(
          elevation: 12.0,
          margin: new EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: makeListTile(horoscope),
          ),
        );

    final makeBody = Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: horoscopes.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(horoscopes[index]);
        },
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(title: 'HOROSCOPE', height: 55.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdmobBanner(
              adUnitId: ams.getBannedAdId(),
              adSize: AdmobBannerSize.FULL_BANNER),
          Expanded(child: makeBody),
          AdmobBanner(
              adUnitId: ams.getBannedAdId()(),
              adSize: AdmobBannerSize.FULL_BANNER),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
