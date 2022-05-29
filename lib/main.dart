import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/views/settings/setting_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luneblaze',
      home: SettingsView(),
    );
  }
}
