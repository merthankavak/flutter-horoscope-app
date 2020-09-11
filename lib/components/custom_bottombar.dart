import 'package:HoroscopeApp/pages/find_sign_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromRGBO(67, 8, 77, 0.75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.hatWizard, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.calculator, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FindMySign()));
            },
          ),
        ],
      ),
    );
  }
}
