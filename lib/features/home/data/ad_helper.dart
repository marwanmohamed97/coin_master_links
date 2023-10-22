import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6805595132227771/6638087232";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6805595132227771/9786041781";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
