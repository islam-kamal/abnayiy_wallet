import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 10.0;
const Color kAppBarBackgroundColor = const Color(0xFF03314B);
const Color kSemiPurpleColor = const Color(0xFF25145A);


const Color kMoreNavyColor = const Color(0xFF17243E);
const Color kPartWhiteColor = const Color(0xffd0cece);
const Color kBlueGreyColor = const Color(0xFF6F6C90);
const Color kLittelGreyColor = const Color(0xff9A9FA8);
const Color kMostgreyColor = const Color(0xFF646464);
const Color kDarkPurpelColor = const Color(0xFF25145A);
const Color kSomeBlueColor = const Color(0xFF7064F5);
const Color kSemiBlueColor = const Color(0xff1B3664);
const Color kMoreblueColor = const Color(0xFF4E1BD9);
const Color kManyGreyColor = const Color(0xFF606060);
const Color kCardColor = const Color(0xffF1F1F6);
const Color kBlueAccentColor = const Color(0xFF16C7F9);
const Color kGreenColor = const Color(0xFF54BA4A);
const Color kPinkColor = const Color(0xFFF73164);
const Color kTableColor = const Color(0xFFEEEEEE);
const Color kDarkPurpleColor = const Color(0xFF4005A0);
const Color kLightBlackColor = const Color(0xFF333333);
const Color kManyBlackColor = const Color(0xff0F1419);
const Color kInactiveColor = const Color(0xFFD9D9D9);
const Color kBlueColor = const Color(0xff0038FF);
const Color kPartBlackColor = const Color(0xff343942);
const Color kLightPurpleColor = const Color(0xff7366FF);
const Color kpurpleColor = const Color(0xFF7A40F2);
const Color kMoreGreyColor = const Color(0xff3F3F3F);
const Color korangeCarColor = const Color(0xFFFFA941);
const Color kredColor = const Color(0xFFFF0000);
const Color kGreyColor = const Color(0xff5F5F5F);
const Color kSomeWhiteColor = const Color(0xffF8F8F8);
const Color kPartGreyColor = const Color(0xFF8A8A8A);
const Color kDarkGreyColor = const Color(0xff4B4B4B);
const Color kSomeBlackColor = const Color(0xff2F2F3B);
const Color kSomeGreyColor = const Color(0xff52526C);
const Color kLemonColor = const Color(0xff41C513);
const Color kNavyBlackColor = const Color(0xFF23272C);
const Color kSemiBlackColor = const Color(0xff16151C);
const Color kTextColor = const Color(0xFFA2A1A8);
const Color kUnavailableColor = const Color(0xffEBECF1);
const Color kMoreGreenColor = const Color(0xFF12C59C);
const Color kDarkBlueColor = const Color.fromARGB(255, 52, 30, 117);
const Color kgreyColor = const Color(0xFFAEAEAE);
const Color kroseColor = const Color(0xff01DAAD);
const Color kBlackColor = const Color(0xFF2A2A2A);
const Color kWhiteColor = const Color(0xffFFFFFF);


const Color kUnActiveStepColor = const Color(0xFF979797);
const Color kborderColor = const Color(0xFFBDB8B8);
const Color kMoreYellowColor = const Color(0xFFFFBD52);
const Color kBrownColor = const Color(0xFF403430);
const Color kgreenCarColor = const Color(0xFF006D3D);
const Color kburgundyCarColor = const Color(0xFF6D0115);
const Color kBoldRoseColor = const Color(0xFF28846E);
const Color kBackgroundNavBar = const Color(0xff62BAA1);
const Color kButtonNavBarColor = const Color(0xffFF7602);
const Color kButtonColor = const Color(0xFF007BFF);
const Color kMoreWhiteColor = const Color(0xffF8F9FA);
const Color kDividerColor = const Color(0xFFEFEFEFFF);
const Color kDarkGreenColor = const Color(0xFF006D3D);
const Color kRedColor = const Color(0xFFFC1414);
const Color kTransparentColor = Colors.transparent;
const Color kAvailableColor = const Color(0xFFE7F0FD);
const Color kYellowColor = const Color(0xFFF39204);
const Color kPrimaryColor = const Color(0xFFF39204);
const Color kGreenLight = const Color(0xFFE8F5E9);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kNavyBlackColor,
);
TextStyle greenTextStyle = GoogleFonts.poppins(
  color: kGreenColor,
);
TextStyle redTextStyle = GoogleFonts.poppins(
  color: kRedColor,
);
TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: kPrimaryColor,
);

BottomNavigationBarThemeData bottomNavigationBarTheme =
    const BottomNavigationBarThemeData(
  selectedItemColor: kGreenColor,
  unselectedItemColor: kPrimaryColor,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  type: BottomNavigationBarType.fixed,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

ColorScheme kColorScheme = ColorScheme(
  primary: kPrimaryColor,
  primaryContainer: kBlackColor,
  secondary: kGreenColor,
  secondaryContainer: kGreenColor,
  surface: kBlackColor,
  background: kNavyBlackColor,
  error: Colors.red,
  onPrimary: kPrimaryColor,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
