import 'dart:io';

class AdMobService {
  String getAdMobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6954311518744708~1930586273'; //Admob Application ID
    } else {
      return null;
    }
  }

//BANNER AD 1
  String getBannedAdId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; //Banned Ad ID 1
    } else {
      return null;
    }
  }

//BANNER AD 2
  String getBannedAdId2() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6954311518744708/7230391327'; //Banned Ad ID 2
    } else {
      return null;
    }
  }
}
