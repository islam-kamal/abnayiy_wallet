import 'package:abnayiy_wallet/Features/Home/presentation/pages/home_screen.dart';
import 'package:abnayiy_wallet/Features/More/presentation/pages/more_screen.dart';
import 'package:abnayiy_wallet/Features/Services/presentation/pages/services_screen.dart';
import 'package:abnayiy_wallet/Features/Transfer/presentation/pages/transfer_screen.dart';
import 'package:abnayiy_wallet/Features/Wallet/presentation/pages/wallet_screen.dart';

import 'package:abnayiy_wallet/Shared/Base/common/theme.dart';
import 'package:flutter/material.dart';
import 'model/user.dart';

class IndexScreen extends StatefulWidget {
  int index;
  IndexScreen({required this.index});
  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int? current_index;

  @override
  void initState() {
    current_index = widget.index;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  List<Widget> _buildScreens = [
      HomeScreen(),
    TransferScreen(),
    WalletScreen(),
    ServicesScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
        onWillPop: ()async=>false,
    child: _buildScreens[current_index!]),
        floatingActionButton: User.role == "student"
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    current_index = 1;
                  });
                  //  scanQRandCheck();
                },
                child: Image.asset(
                  'assets/images/scanner_img.png',
                  scale: 1.2,
                  color: current_index == 1 ? kWhiteColor : kroseColor,
                ),
                backgroundColor: current_index == 1 ? kroseColor : kGreyColor,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/images/homee.png'),
                color: current_index == 0 ? kroseColor : kBlackColor,
              ),
              label: 'الرئيسية',
            ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    "assets/images/people.png",
                  ),
                  color: current_index == 1 ? kroseColor : kBlackColor,
                ),
                label: 'الأبناء',
              ),
            BottomNavigationBarItem(
             icon: ImageIcon(
               AssetImage(
                 "assets/images/moneys.png",
               ),
               color: current_index == 2 ? kroseColor : kBlackColor,
             ),
              label: 'الحسابات المالية',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/category.png",
                ),
                color: current_index == 3 ? kroseColor : kBlackColor,
              ), //notification_img.png
              label: 'الخدمات',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/more.png",
                ),
                color: current_index == 4 ? kroseColor : kBlackColor,
              ), //notification_img.png
              label: 'الاعدادات',
            )
          ],
          currentIndex: current_index!,
          selectedItemColor: kroseColor,
          onTap: _onItemTapped,
          backgroundColor: kWhiteColor,
          unselectedItemColor: kBlackColor,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          showUnselectedLabels: true,
          elevation: 22,
        )
        );
  }
}
