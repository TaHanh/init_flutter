import 'dart:math';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:guide_ice_scream/config/env.dart';
import 'package:guide_ice_scream/main.dart';
import 'package:guide_ice_scream/store/AppStore.dart';
import 'package:guide_ice_scream/util/admob_ad_event.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AdmobInterstitial interstitialAd;
  AdmobBannerSize bannerSize;

  @override
  void initState() {
    super.initState();
    bannerSize = AdmobBannerSize.BANNER;
  }

  @override
  void dispose() {
    super.dispose();
    if (interstitialAd != null) {
      interstitialAd.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  clickAdmob(context, () {
                    print("object");
                  }, 100);
                },
                child: Text("HIHI !"),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: AdmobBanner(
              adUnitId: admobBannerID,
              adSize: bannerSize,
              listener: (AdmobAdEvent event, Map<String, dynamic> args) {
                handleEventBanner(event, args, 'Banner');
              },
            ),
          ),
        ],
      ),
    );
  }
}
