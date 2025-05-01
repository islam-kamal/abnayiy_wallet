import 'dart:async';
import 'package:abnayiy_wallet/Features/Authentication/data/repositories/login_repository.dart';
import 'package:abnayiy_wallet/Shared/Base/Helper/app_event.dart';
import 'package:abnayiy_wallet/Shared/Base/Helper/app_state.dart';
import 'package:abnayiy_wallet/Shared/Base/common/shared_preference_manger.dart';
import 'package:abnayiy_wallet/Shared/Base/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginBloc extends Bloc<AppEvent,AppState> with Validator {

  LoginBloc() :super(Start()) {
    on<loginClickEvent>(_onLogin);
  }


  Future<void> _onLogin(loginClickEvent event,
      Emitter<AppState> emit) async {
    emit(Loading());
    var response = await loginRepository.Login(
        loginEntity: event.loginEntity
    );
    print('response: $response');
    if (response.accessToken != null) {
      sharedPreferenceManager.writeData(CachingKey.AUTH_TOKEN, response.accessToken!);
      sharedPreferenceManager.writeData(CachingKey.GUARDIAN_ID, response.user?.guardian!.id.toString());
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: event.loginEntity!.userName,
            password:event.loginEntity!.password
        );
        print("Login successful: ${userCredential.user?.uid}");
        if (userCredential.user != null) {
          sharedPreferenceManager.writeData(CachingKey.FIREBASE_USER_ID, userCredential.user?.uid);

         // emit(Done());
        } else {
          emit(ErrorLoading(message: userCredential.toString()));

        }
      } on FirebaseAuthException catch (e) {
        print("Login failed: ${e.code} - ${e.message}");
        emit(ErrorLoading(message: e.message));

      }
      print("accessToken : ${response.accessToken}");

      emit(Done(token: response.accessToken));
    } else {
      print("response## : ${response.message}");
      emit(ErrorLoading(message: response.message));
    }
  }
}
LoginBloc loginBloc = new LoginBloc();


