import 'package:abnayiy_wallet/Features/Authentication/presentation/pages/register_screen.dart';
import 'package:abnayiy_wallet/Features/BottomNavigationBar/index_screen.dart';
import 'package:abnayiy_wallet/Features/Home/presentation/pages/home_screen.dart';
import 'package:abnayiy_wallet/Shared/Base/common/navigtor.dart';
import 'package:abnayiy_wallet/Shared/Base/common/shared.dart';
import 'package:abnayiy_wallet/Shared/Base/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: Shared.height * 0.05,
          right: 20,
          left: 20,
          top: Shared.height * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Image.asset('assets/images/AppLogo.png')),
            SizedBox(
              height: Shared.height * 0.02,
            ),
            Text(
              'مرحبًا بعودتك👋',
              style: GoogleFonts.cairo(
                  fontSize: 38.75, fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('إلي ',
                    style: GoogleFonts.cairo(
                        fontSize: 38.75, fontWeight: FontWeight.w400)),
                Text(
                  'أبنائي',
                  style: GoogleFonts.cairo(
                      fontSize: 38.75,
                      color: kroseColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: Shared.height * 0.02,
            ),
            Opacity(
                opacity: 0.8,
                child: Text(
                  'مرحبًا بك، قم بالاختيار للمتابعة',
                  style: GoogleFonts.cairo(
                      fontSize: 19.38,
                      color: kGreyColor,
                      fontWeight: FontWeight.w300),
                )),
            const SizedBox(
              height: 26,
            ),
            const Spacer(),

            SizedBox(
              height: Shared.height * 0.02,
            ),
            SizedBox(
              width: double.infinity,
              height: Shared.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  customAnimatedPushNavigation(context, RegisterScreen());

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kroseColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: Text(
                  'تسجيل دخول',
                  style: GoogleFonts.cairo(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
