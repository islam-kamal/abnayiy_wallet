import 'package:abnayiy_wallet/Shared/AppVersion/data/repositories/app_version_repository.dart';
import 'package:abnayiy_wallet/Shared/Base/common/local_const.dart';
import 'package:abnayiy_wallet/Shared/Base/common/shared.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateChecker {
  Future<void> checkForUpdate(BuildContext context) async {
    try {
      // Get current app version
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.buildNumber;
      final response = await appVersionRepository.getAppVersion();
      if (response.isSuccess!) {
        final data = response.data;
        final releaseVersionNumber = getPlatform(context) == 'android'
            ? data!.releaseAndroidVersion
            : data!.releaseIosVersion;

        final isMandatory = false;// data.isMandatory;
        final updateUrl = getPlatform(context) == 'android' ? data.googleUrl : data.appleUrl;
        // Check if  current version is less than the latest version
        if (int.parse(currentVersion) >= releaseVersionNumber!) {
          Shared.checkFirstTime();
        }else{
          _showUpdateDialog(context, isMandatory, updateUrl!);

        }
      } else {
        // Handle API failure
        print('Failed to check for updates. ');
      }
    } catch (e) {
      print('Error checking for updates: $e');
    }
  }

  // Get the platform-specific key
  String getPlatform(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS ? 'ios' : 'android';
  }

  // Show dialog to prompt the user to update the app
  void _showUpdateDialog(
      BuildContext context, bool isMandatory, String updateUrl) {
    showDialog(
      context: context,
      barrierDismissible: !isMandatory, // Disable dismiss for mandatory updates
      builder: (context) => Directionality(
        textDirection: LocalizeAndTranslate.getLanguageCode() == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: AlertDialog(
          title: Text(isMandatory ? kUpdate_required.tr(): kUpdate_available.tr()),
          content: Text(isMandatory
              ? kupdate_mandatory.tr()
              : kUpdate_optional.tr()),
          actions: [
            if (!isMandatory)
              TextButton(
                child: Text(kLater.tr()),
                onPressed: (){
                  Navigator.of(context).pop();
                Shared.checkFirstTime();

                },
              ),
            TextButton(
              child: Text(kUpdate_now.tr()),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                if (await canLaunchUrl(Uri.parse(updateUrl))) {
                  await launchUrl(Uri.parse(updateUrl)); // Launch the store URL
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
UpdateChecker updateChecker = new UpdateChecker();