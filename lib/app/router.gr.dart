// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../UIs/views/privacy_settings_view.dart' as _i2;
import '../UIs/views/setting_view.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SettingsView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SettingsView());
    },
    PrivacySettingsView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PrivacySettingsView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SettingsView.name, path: '/'),
        _i3.RouteConfig(PrivacySettingsView.name,
            path: '/privacy-settings-view')
      ];
}

/// generated route for
/// [_i1.SettingsView]
class SettingsView extends _i3.PageRouteInfo<void> {
  const SettingsView() : super(SettingsView.name, path: '/');

  static const String name = 'SettingsView';
}

/// generated route for
/// [_i2.PrivacySettingsView]
class PrivacySettingsView extends _i3.PageRouteInfo<void> {
  const PrivacySettingsView()
      : super(PrivacySettingsView.name, path: '/privacy-settings-view');

  static const String name = 'PrivacySettingsView';
}
