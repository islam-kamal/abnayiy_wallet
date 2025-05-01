import 'dart:async';
import 'package:abnayiy_wallet/Features/Authentication/presentation/pages/login_screen.dart';
import 'package:abnayiy_wallet/Shared/Base/common/navigtor.dart';
import 'package:abnayiy_wallet/Shared/Base/common/shared.dart';
import 'package:abnayiy_wallet/Shared/Base/common/shared_preference_manger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../BottomNavigationBar/index_screen.dart';
import '../../../BottomNavigationBar/model/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      Shared.device_token = token!;
      print("Device Token: $token");
    });
    authetication_fun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/reportLogo1.png"),
      ),
    );
  }

  void _getCurrentUser() async {
    try {
      String authToken =
          await sharedPreferenceManager.readString(CachingKey.AUTH_TOKEN);
      bool isExpired = JwtDecoder.isExpired(authToken);
      DateTime? expirationDate = JwtDecoder.getExpirationDate(authToken);

      if (authToken != null && !isExpired) {
        customAnimatedPushNavigation(
            context,
            IndexScreen(
              index: 0,
            )
        );
      } else {
        customAnimatedPushNavigation(context, const LoginScreen());
      }
    } catch (e) {
      customAnimatedPushNavigation(context, const LoginScreen());
    }
  }

  void authetication_fun() {
    Timer(Duration(seconds: 1), () async {
      try {
        _getCurrentUser();
      } catch (e) {
        _getCurrentUser();
      }
    });
  }
}
