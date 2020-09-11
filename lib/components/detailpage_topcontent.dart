import 'package:flutter/material.dart';

class DetailPageTopContent extends StatelessWidget {
  const DetailPageTopContent({
    Key key,
    @required this.topContentText,
  }) : super(key: key);

  final Column topContentText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("Purple-Space.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(55, 11, 86, .7)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
  }
}
