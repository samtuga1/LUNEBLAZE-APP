// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../UIs/views/blocked_users_view.dart';
import '../UIs/views/get_notified_view.dart';
import '../UIs/views/manage_page_view.dart';
import '../UIs/views/privacy_settings_view.dart';
import '../UIs/views/setting_view.dart';

class Routes {
  static const String settingsView = '/';
  static const String privacySettingsView = '/privacy-settings-view';
  static const String blockedUsersView = '/blocked-users-view';
  static const String getNotifiedView = '/get-notified-view';
  static const String managePageView = '/manage-page-view';
  static const all = <String>{
    settingsView,
    privacySettingsView,
    blockedUsersView,
    getNotifiedView,
    managePageView,
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
  };
}
