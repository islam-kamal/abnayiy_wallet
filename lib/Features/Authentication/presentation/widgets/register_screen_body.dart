import 'package:abnayiy_wallet/Features/Authentication/domain/entities/login_entity.dart';
import 'package:abnayiy_wallet/Features/Authentication/presentation/bloc/login_bloc.dart';
import 'package:abnayiy_wallet/Features/Authentication/presentation/widgets/login_text_field.dart';
import 'package:abnayiy_wallet/Features/BottomNavigationBar/index_screen.dart';
import 'package:abnayiy_wallet/Shared/Base/Helper/app_event.dart';
import 'package:abnayiy_wallet/Shared/Base/Helper/app_state.dart';
import 'package:abnayiy_wallet/Shared/Base/common/navigtor.dart';
import 'package:abnayiy_wallet/Shared/Base/common/shared.dart';
import 'package:abnayiy_wallet/Shared/Base/common/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreenBody extends StatefulWidget {
  RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Listeners to detect changes and update UI
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // final isValidEmail = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email);
    final isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    final isValidPassword = password.isNotEmpty && password.length >= 8;

    setState(() {
      _isButtonEnabled = isValidEmail && isValidPassword;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: loginBloc,
        listener: (context, state) {
          if(state is Loading){
            Shared.showLoadingDialog(context: context);
          }
          else if(state is Done){
            print("Done");
            Shared.dismissDialog(context: context);
            customAnimatedPushNavigation(context, IndexScreen(index: 0,));

          }
          else if(state is ErrorLoading){
            print("ErrorLoading");
            print("state.message : ${state.message}");

            Shared.dismissDialog(context: context);
            Shared.showSnackBarView(
              error_status: true,
              backend_message: state.message,
            );
          }
        },
        child:SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset('assets/images/login_background.png'),
              Padding(
                padding: EdgeInsets.only(top: Shared.height * 0.23),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: Shared.width * 0.85,
                    height: Shared.height * 0.6,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Shared.width * 0.02,
                        vertical: Shared.height * 0.04,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Image.asset('assets/images/AppLogo.png', scale: 0.8),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: Shared.height * 0.02),
                              child: Text(
                                'تسجيل الدخول الى الحساب الشخصى',
                                style: GoogleFonts.cairo(
                                  fontSize: 14.38,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Shared.width * 0.05),
                              child: Column(
                                children: [
                                  LoginTextField(
                                    labelText: 'البريد الالكتروني',
                                    suffixIcon: Icon(Icons.person_outlined),
                                    isPassword: false,
                                    onChange: (value) {
                                    },
                                    controller: _emailController,
                                  ),
                                  SizedBox(height: Shared.height * 0.02),
                                  LoginTextField(
                                    labelText: 'كلمة المرور',
                                    suffixIcon: Icon(Icons.visibility_outlined),
                                    isPassword: true,
                                    onChange: (value) {
                                    },
                                    controller: _passwordController,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: Shared.width * 0.7,
                              height: Shared.height * 0.07,
                              child: ElevatedButton(
                                onPressed: () {
                                  customAnimatedPushNavigation(context, IndexScreen(index: 0));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isButtonEnabled
                                      ? kroseColor
                                      : kroseColor.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Text(
                                  'تسجيل دخول',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ),

                            /* SizedBox(
                              width: Shared.width * 0.7,
                              height: Shared.height * 0.07,
                              child: ElevatedButton(
                                onPressed: _isButtonEnabled ?
                                    () {
                                  if (_formKey.currentState!.validate()) {
                                    print("تم تسجيل الدخول بنجاح!");
                                    loginBloc.add(loginClickEvent(
                                      loginEntity: LoginEntity(
                                        userName: _emailController.text,
                                          password: _passwordController.text
                                      )
                                    ));
                                  }
                                }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isButtonEnabled
                                      ? kroseColor
                                      : kroseColor.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Text(
                                  'تسجيل دخول',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ),*/
                            SizedBox(height: Shared.height * 0.04),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    ) );
  }
}
