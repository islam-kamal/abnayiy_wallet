
import 'dart:convert';


import 'package:abnayiy_wallet/Features/Authentication/data/models/login_model.dart';
import 'package:abnayiy_wallet/Features/Authentication/domain/entities/login_entity.dart';
import 'package:abnayiy_wallet/Shared/Base/common/config.dart';
import 'package:abnayiy_wallet/Shared/Base/common/shared.dart';
import 'package:abnayiy_wallet/Shared/Base/network/network_util.dart';


class LoginRepository {

   Future<LoginModel> Login({LoginEntity? loginEntity}) async {

    return NetworkUtil.internal().post(LoginModel(),
        baseUrl +  loginUrl,
        body: jsonEncode( {
          "user_name": loginEntity?.userName,
          "password": loginEntity?.password,
          "fcm_token" : Shared.device_token
        }),
        headers: Map<String, String>.from({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }));
  }

}
LoginRepository loginRepository = new LoginRepository();