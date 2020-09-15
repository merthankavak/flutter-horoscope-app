import 'package:HoroscopeApp/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class FindMySign extends StatefulWidget {
  const FindMySign({Key key}) : super(key: key);
  @override
  _FindMySignState createState() => _FindMySignState();
}

class _FindMySignState extends State<FindMySign> {
  String _date = "Your Birthday";
  bool _visible = false, _isButtonDisabled = false;
  int zodiacDay = 0, zodiacMonth = 0;
  String _img = "       ";
  _FindMySignState();
  @override
  void initState() {
    super.initState();
  }

  String getZodiacSign(int day, int month) {
    //Function for Calculating Zodiac Sign

    if ((month == 1 && day <= 20) || (month == 12 && day >= 22)) {
      return _img = "003-capricorn.png";
    } else if ((month == 1 && day >= 21) || (month == 2 && day <= 18)) {
      return _img = "011-aquaris.png";
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return _img = "009-pisces.png";
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 20)) {
      return _img = "002-aries.png";
    } else if ((month == 4 && day >= 21) || (month == 5 && day <= 20)) {
      return _img = "007-taurus.png";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return _img = "006-gemini.png";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return _img = "012-cancer.png";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 23)) {
      return _img = "004-leo.png";
    } else if ((month == 8 && day >= 24) || (month == 9 && day <= 23)) {
      return _img = "010-virgo.png";
    } else if ((month == 9 && day >= 24) || (month == 10 && day <= 23)) {
      return _img = "005-libra.png";
    } else if ((month == 10 && day >= 24) || (month == 11 && day <= 22)) {
      return _img = "001-scorpio.png";
    } else if ((month == 11 && day >= 23) || (month == 12 && day <= 21)) {
      return _img = "008-sagittarius.png";
    } else {
      return "broken.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'FIND MY SIGN',
        height: 55,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime.now(),
                    onConfirm: (date) {
                      print('confirm $date');
                      _date = ' ${date.day} - ${date.month} - ${date.year}';
                      setState(() {
                        //Assign the input date to the variable.
                        zodiacDay = date.day;
                        zodiacMonth = date.month;
                      });
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.blue,
              ),
              SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  if (_isButtonDisabled == false) {
                    setState(() {
                      _visible = true;
                      _isButtonDisabled = true;
                    });
                  } else {
                    return null;
                  }
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: const Text('FIND MY SIGN',
                      style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 250,
                child: Column(
                  children: <Widget>[
                    Visibility(
                      child: Container(
                        height: 250,
                        width: 250,
                        alignment: Alignment.center,
                        color: Colors.green,
                        child:
                            // Get Specific Image by Date
                            Image.asset(getZodiacSign(zodiacDay, zodiacMonth)),
                      ),
                      maintainSize: false,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: _visible,
                    ),
                    SizedBox(height: 25),
                    Visibility(
                      child: Container(
                        width: 250,
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.green,
                        child: Text(
                          (_img.replaceAll('.png', ''))
                              .substring(4)
                              .toUpperCase(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      maintainSize: false,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: _visible,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
