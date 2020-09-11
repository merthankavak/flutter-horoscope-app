import 'package:flutter/material.dart';

class DetailPageBottomContent extends StatelessWidget {
  const DetailPageBottomContent({
    Key key,
    @required this.bottomContentText,
  }) : super(key: key);

  final Text bottomContentText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );
  }
}
