import 'package:abnayiy_wallet/Shared/AppVersion/data/models/app_version_model.dart';
import 'package:abnayiy_wallet/Shared/Base/common/config.dart';
import 'package:abnayiy_wallet/Shared/Base/network/network_util.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AppVersionRepository {

  Future<AppVersionModel> getAppVersion() async {
    return NetworkUtil.internal().get(AppVersionModel(),
        baseUrl +  appVersionUrl,
        headers: Map<String, String>.from({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Language': LocalizeAndTranslate.getLanguageCode().toUpperCase()
        }));
  }

}

AppVersionRepository appVersionRepository = new AppVersionRepository();