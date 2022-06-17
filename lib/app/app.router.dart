// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../UIs/views/blocked_users_view.dart';
import '../UIs/views/contact_us_view.dart';
import '../UIs/views/create_community_view.dart';
import '../UIs/views/get_notified_view.dart';
import '../UIs/views/manage_communities_view.dart';
import '../UIs/views/manage_page_view.dart';
import '../UIs/views/privacy_settings_view.dart';
import '../UIs/views/reports_view.dart';
import '../UIs/views/setting_view.dart';
import '../UIs/views/create_institutions_view.dart';

class Routes {
  static const String settingsView = '/';
  static const String privacySettingsView = '/privacy-settings-view';
  static const String blockedUsersView = '/blocked-users-view';
  static const String getNotifiedView = '/get-notified-view';
  static const String managePageView = '/manage-page-view';
  static const String manageCommunitiesView = '/manage-communities-view';
  static const String createCommunityView = '/create-community-view';
  static const String reportsView = '/reports-view';
  static const String contactUsView = '/contact-us-view';
  static const String createInstitutionsView = '/create-institutions-view';
  static const all = <String>{
    settingsView,
    privacySettingsView,
    blockedUsersView,
    getNotifiedView,
    managePageView,
    manageCommunitiesView,
    createCommunityView,
    reportsView,
    contactUsView,
    createInstitutionsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.settingsView, page: SettingsView),
    RouteDef(Routes.privacySettingsView, page: PrivacySettingsView),
    RouteDef(Routes.blockedUsersView, page: BlockedUsersView),
    RouteDef(Routes.getNotifiedView, page: GetNotifiedView),
    RouteDef(Routes.managePageView, page: ManagePageView),
    RouteDef(Routes.manageCommunitiesView, page: ManageCommunitiesView),
    RouteDef(Routes.createCommunityView, page: CreateCommunityView),
    RouteDef(Routes.reportsView, page: ReportsView),
    RouteDef(Routes.contactUsView, page: ContactUsView),
    RouteDef(Routes.createInstitutionsView, page: CreateInstitutionsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SettingsView(),
        settings: data,
      );
    },
    PrivacySettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PrivacySettingsView(),
        settings: data,
      );
    },
    BlockedUsersView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const BlockedUsersView(),
        settings: data,
      );
    },
    GetNotifiedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GetNotifiedView(),
        settings: data,
      );
    },
    ManagePageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ManagePageView(),
        settings: data,
      );
    },
    ManageCommunitiesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ManageCommunitiesView(),
        settings: data,
      );
    },
    CreateCommunityView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateCommunityView(),
        settings: data,
      );
    },
    ReportsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ReportsView(),
        settings: data,
      );
    },
    ContactUsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ContactUsView(),
        settings: data,
      );
    },
    CreateInstitutionsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateInstitutionsView(),
        settings: data,
      );
    },
  };
}
