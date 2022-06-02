import 'package:flutter/material.dart';
import 'package:luneblaze_app/UIs/widgets/setup_dialog_ui.dart';
import 'package:luneblaze_app/app/app.locator.dart';
import 'package:luneblaze_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  await setupLocator();
  setupDialogUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luneblaze',
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
