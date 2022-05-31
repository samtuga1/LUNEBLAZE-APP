import 'package:auto_route/annotations.dart';
import 'package:luneblaze_app/UIs/views/privacy_settings_view.dart';
import 'package:luneblaze_app/UIs/views/setting_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SettingsView, initial: true),
    AutoRoute(page: PrivacySettingsView),
  ],
)
class $AppRouter {}
