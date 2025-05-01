import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  SharedPreferences? sharedPreferences;

  Future<bool> removeData(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.remove(key.value);
  }

  Future<Future> writeData(CachingKey key, value) async {
    print("${key.value} : $value");
    sharedPreferences = await SharedPreferences.getInstance();
    Future? returnedValue;
    if (value is String) {
      returnedValue = sharedPreferences!.setString(key.value, value);
    } else if (value is int) {
      returnedValue = sharedPreferences!.setInt(key.value, value);
    } else if (value is bool) {
      returnedValue = sharedPreferences!.setBool(key.value, value);
    } else if (value is double) {
      returnedValue = sharedPreferences!.setDouble(key.value, value);
    }else if (value is List<String>) {
      returnedValue = sharedPreferences!.setStringList(key.value, value);

    }else {
      return Future.error(NotValidCacheTypeException());
    }
    return returnedValue;
  }


  // Save object as JSON
  Future<bool> saveObject(CachingKey key, Object value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(value);
    return sharedPreferences!.setString(key.value, jsonString);
  }

  // Retrieve object from JSON
  Future<Map<String, dynamic>?> getObject(CachingKey key) async {
    print("${key.value}");
    sharedPreferences = await SharedPreferences.getInstance();
    String? jsonString = sharedPreferences!.getString(key.value);
    if (jsonString == null) return null;
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  Future<bool> removeObject(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.remove(key.value);
  }

  Future<List<String>> readListString(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();

    return Future.value(sharedPreferences!.getStringList(key.value) ?? []);
  }

  Future<String> readString(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();

    return Future.value(sharedPreferences!.getString(key.value).toString() ?? "");
  }

  Future<bool> readBool(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return Future.value(sharedPreferences!.getBool(key.value)?? true);
  }
  Future<int> readInt(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();

    return Future.value(sharedPreferences!.getInt(key.value));
  }
  Future<double> readDouble(CachingKey key) async {
    sharedPreferences = await SharedPreferences.getInstance();

    return Future.value(sharedPreferences!.getDouble(key.value));
  }
}

class NotValidCacheTypeException implements Exception {
  String message() => "Not a valid cahing type";
}

class CachingKey extends Enum<String> {
  const CachingKey(String val) : super(val);

  static const CachingKey AUTH_TOKEN = CachingKey('AUTH_TOKEN');
  static const CachingKey DEVICE_TOKEN = CachingKey('DEVICE_TOKEN');
  static const CachingKey USER_NAME = const CachingKey('USER_NAME');
  static const CachingKey REFRESH_TOKEN = const CachingKey('REFRESH_TOKEN');
  static const CachingKey VISITOR = const CachingKey('VISITOR');

  static const CachingKey ADMISSION_REQUEST_ACTIVE_STEP = CachingKey('ADMISSION_REQUEST_ACTIVE_STEP');

  static const CachingKey GUARDIAN_ID = const CachingKey('GUARDIAN_ID');
  static const CachingKey STUDENT_ID = const CachingKey('STUDENT_ID');
  static const CachingKey FIREBASE_USER_ID = const CachingKey('FIREBASE_USER_ID');
  static const CachingKey ADMISSION_REQUEST_ID = const CachingKey('ADMISSION_REQUEST_ID');


  static const CachingKey USER_PHONE = const CachingKey('USER_PHONE');
  static const CachingKey PROFILE_IMAGE = const CachingKey('PROFILE_IMAGE');

  static const CachingKey APP_LANGUAGE = const CachingKey('APP_LANGUAGE');

  //DropDowns
  static const CachingKey STUDENT_NATIONALITY = const CachingKey('STUDENT_NATIONALITY');
  static const CachingKey STUDENT_GROUP_DEGREE = const CachingKey('STUDENT_GROUP_DEGREE');
  static const CachingKey STUDENT_DEGREE = const CachingKey('STUDENT_DEGREE');
  static const CachingKey STUDENT_GENDER = const CachingKey('STUDENT_GENDER');
  static const CachingKey SCHOOL_HUB_ID = const CachingKey('SCHOOL_HUBS_ID');
  static const CachingKey SCHOOL_ID = const CachingKey('SCHOOL_ID');
  static const CachingKey ACADEMIC_YEAR = const CachingKey('ACADEMIC_YEAR');
  static const CachingKey ACADEMIC_DEGREE = const CachingKey('ACADEMIC_DEGREE');
  static const CachingKey PAYMENT_PLAN = const CachingKey('PAYMENT_PLAN');
  static const CachingKey BRANCH_ID = const CachingKey('BRANCH_ID');

  //Textfieds
  static const CachingKey STUDENT_FIRST_NAME_AR = const CachingKey('STUDENT_FIRST_NAME_AR');
  static const CachingKey STUDENT_LAST_NAME_AR = const CachingKey('STUDENT_LAST_NAME_AR');
  static const CachingKey STUDENT_FIRST_NAME_LATIN = const CachingKey('STUDENT_FIRST_NAME_LATIN');
  static const CachingKey STUDENT_LAST_NAME_LATIN = const CachingKey('STUDENT_LAST_NAME_LATIN');
  static const CachingKey STUDENT_NATIONALITY_NUMBER = const CachingKey('STUDENT_NATIONALITY_NUMBER');
  static const CachingKey BIRTH_DATE = const CachingKey('BIRTH_DATE');
  static const CachingKey FATHER_NATIONALITY_NUMBER  = const CachingKey('FATHER_NATIONALITY_NUMBER ');
  static const CachingKey CHRONIC_DISEASE  = const CachingKey('CHRONIC_DISEASE');
  static const CachingKey ADDRESS  = const CachingKey('ADDRESS');
  static const CachingKey SCHOOL_NAME  = const CachingKey('SCHOOL_NAME');

  //interview
  static const CachingKey SELECTED_DATE = const CachingKey('SELECTED_DATE');
  static const CachingKey SELECTED_TIME = const CachingKey('SELECTED_TIME');


  //withdrawal request
  static const CachingKey STUDENT_DATA = const CachingKey('STUDENT_DATA');
  static const CachingKey WITHDRAWAL_REASON = const CachingKey('WITHDRAWAL_REASON');
  static const CachingKey WITHDRAWAL_TO_SCHOOL = const CachingKey('WITHDRAWAL_TO_SCHOOL');
  static const CachingKey WITHDRAWAL_REASON_COMMENT = const CachingKey('WITHDRAWAL_REASON_COMMENT');
  static const CachingKey WITHDRAWAL_REASON_DATE = const CachingKey('WITHDRAWAL_REASON_DATE');

  //admission request

  static const CachingKey ADMISSION_REQUEST_CREATED_BEFORE = const CachingKey('ADMISSION_REQUEST_CREATED_BEFORE');
}

final sharedPreferenceManager = SharedPreferenceManager();
abstract class Enum<T> {
  final T _value;

  const Enum(this._value);

  T get value => _value;
}
