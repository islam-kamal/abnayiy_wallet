import 'package:abnayiy_wallet/Shared/Base/common/shared_preference_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ChangeLanguageWidget extends StatefulWidget{
  final Color? color;
  ChangeLanguageWidget({this.color});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  @override
  Widget build(BuildContext context) {

    return   OutlinedButton(
      onPressed:(){
        if(LocalizeAndTranslate.getLanguageCode() == 'ar'){
          LocalizeAndTranslate.setLanguageCode('en');
          sharedPreferenceManager.writeData(CachingKey.APP_LANGUAGE, 'en');
        }

        else{
          LocalizeAndTranslate.setLanguageCode('ar');
          sharedPreferenceManager.writeData(CachingKey.APP_LANGUAGE, 'ar');
        }

setState(() {

});
      },
      child:LocalizeAndTranslate.getLanguageCode() == 'ar' ?
      Text("اللغة العربية")
          : Text("English")
    );
  }
}