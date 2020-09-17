import 'dart:io';

class AdMobService {
  String getAdMobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-NUMBERS'; //Your Admob Application ID
    } else {
      return null;
    }
  }

//BANNER AD 1
  String getBannedAdId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; //Banned Ad TEST ID 
    } else {
      return null;
    }
  }
}
