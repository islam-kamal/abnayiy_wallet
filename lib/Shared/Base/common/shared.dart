
import 'package:abnayiy_wallet/Features/Authentication/presentation/pages/login_screen.dart';
import 'package:abnayiy_wallet/Features/BottomNavigationBar/index_screen.dart';
import 'package:abnayiy_wallet/Shared/Base/common/navigtor.dart';
import 'package:abnayiy_wallet/Shared/Base/common/theme.dart';
import 'package:abnayiy_wallet/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared {

  static final  double width = MediaQuery.of(navigatorKey.currentContext!).size.width;
  static final  double height = MediaQuery.of(navigatorKey.currentContext!).size.height;
  static  DateTime task_selected_date =DateTime.now();
  static  DateTime day_selected_date =DateTime.now();
  static final googleMapsApiKey = "AIzaSyC76JIq23jldH_jKnTXshkoQVLw_eYQWJo";
  static  String device_token = '';

  //Admission Request
  static  int nationality_id = 0;



  static showLoadingDialog({required BuildContext context}) {
    showDialog(
        context: context,
        useSafeArea: true,
        barrierDismissible: false,
        builder: (ctx) => SpinKitWave(
          color: Colors.white,
          size: 38.0,
        ));
  }

  static dismissDialog({required BuildContext context}) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  // use thos widget to show loading while waiting data from backend
  static final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? kRedColor : kGreenColor,
        ),
      );
    },
  );


  static Widget text_widget ({String? text,TextStyle?textStyle}){
    return Row(
      children: [
        Text("$text",style: textStyle,)
      ],
    );
  }

  static void showSnackBarView({ String? message, String? backend_message,
    bool? error_status}) {

    var snackBar = SnackBar(
      content: Text( backend_message?? LocalizeAndTranslate.translate(message!),
        style: TextStyle(color: error_status!? kWhiteColor :kGreenColor,),
        textDirection: LocalizeAndTranslate.getLanguageCode() == 'en'? TextDirection.ltr : TextDirection.rtl,
      ),
      backgroundColor: error_status? kRedColor :kWhiteColor,
    );
    // Step 3
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }

  // Function to check if this is the first time the app is being opened
  static Future<void> checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      customAnimatedPushNavigation(navigatorKey.currentContext!, IndexScreen(index: 0));
      prefs.setBool('isFirstTime', false);
    } else {
      customAnimatedPushNavigation(navigatorKey.currentContext!, LoginScreen());
    }
  }


}
