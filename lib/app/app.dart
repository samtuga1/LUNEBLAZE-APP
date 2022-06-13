import 'package:luneblaze_app/UIs/views/blocked_users_view.dart';
import 'package:luneblaze_app/UIs/views/create_community_view.dart';
import 'package:luneblaze_app/UIs/views/get_notified_view.dart';
import 'package:luneblaze_app/UIs/views/manage_communities_view.dart';
import 'package:luneblaze_app/UIs/views/manage_page_view.dart';
import 'package:luneblaze_app/UIs/views/privacy_settings_view.dart';
import 'package:luneblaze_app/UIs/views/setting_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';
import '../UIs/views/setting_view.dart';

@StackedApp(
  routes: <MaterialRoute>[
    MaterialRoute(initial: true, page: SettingsView),
    MaterialRoute(page: PrivacySettingsView),
    MaterialRoute(page: BlockedUsersView),
    MaterialRoute(page: GetNotifiedView),
    MaterialRoute(page: ManagePageView),
    MaterialRoute(page: ManageCommunitiesView),
    MaterialRoute(page: CreateCommunityView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
  ],
)
class App_setup {}
