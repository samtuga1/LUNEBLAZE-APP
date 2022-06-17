import 'package:flutter/cupertino.dart';
import 'package:luneblaze_app/UIs/views/blocked_users_view.dart';
import 'package:luneblaze_app/UIs/views/contact_us_view.dart';
import 'package:luneblaze_app/UIs/views/reports_view.dart';
import 'package:luneblaze_app/UIs/views/create_community_view.dart';
import 'package:luneblaze_app/UIs/views/get_notified_view.dart';
import 'package:luneblaze_app/UIs/views/manage_communities_view.dart';
import 'package:luneblaze_app/UIs/views/manage_page_view.dart';
import 'package:luneblaze_app/UIs/views/privacy_settings_view.dart';
import 'package:luneblaze_app/UIs/views/setting_view.dart';
import 'package:luneblaze_app/UIs/views/create_institutions_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';
import '../UIs/views/setting_view.dart';
import '../core/services/image_picker_service/image_picker_service.dart';

@StackedApp(
  routes: <MaterialRoute>[
    MaterialRoute(initial: true, page: SettingsView),
    MaterialRoute(page: PrivacySettingsView),
    MaterialRoute(page: BlockedUsersView),
    MaterialRoute(page: GetNotifiedView),
    MaterialRoute(page: ManagePageView),
    MaterialRoute(page: ManageCommunitiesView),
    MaterialRoute(page: CreateCommunityView),
    MaterialRoute(page: ReportsView),
    MaterialRoute(page: ContactUsView),
    MaterialRoute(page: CreateInstitutionsView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: ImagePickerService),
  ],
)
class App_setup {}
